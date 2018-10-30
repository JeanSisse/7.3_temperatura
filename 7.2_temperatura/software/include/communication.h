/*
 * pipe.h
 *
 *  Created on: May 8, 2014
 *      Author: mruaro
 */
#ifndef __PIPE_H__
#define __PIPE_H__

#include "task.h"

#define PIPE_SIZE       MAXLOCALTASKS * 3 //24
#define REQUEST_SIZE	MAXLOCALTASKS*(MAX_APP_SIZE-1) //50
#define MAX_TASK_SLOTS	PIPE_SIZE/MAXLOCALTASKS

enum PipeSlotStatus {EMPTY, LOCKED, USED};

typedef struct {
	int producer_task;
	int consumer_task;
	Message message;
	char status;
	unsigned int order;
} PipeSlot;


typedef struct {
    int requester;             /*task that is requesting the message (target)*/
    int requested;              /*task source*/
    int requester_proc;
} MessageRequest;

PipeSlot * getPIPEfreePosition();



PipeSlot pipe[PIPE_SIZE];

unsigned char pipe_free_positions = PIPE_SIZE;

MessageRequest message_request[REQUEST_SIZE];

void initCommStructs(){
	for(int i=0; i<PIPE_SIZE; i++){
		pipe[i].status = EMPTY;
	}
	for(int i=0; i<REQUEST_SIZE; i++){
		message_request[i].requested = -1;
		message_request[i].requester = -1;
		message_request[i].requester_proc = -1;
	}

}


int addPIPE(int producer_task, int consumer_task, Message * msg){

	PipeSlot * pipe_ptr;
	unsigned int last_order = 0;
	unsigned char task_pipe_slots = 0;

	if (pipe_free_positions == 0){
		return 0;
	}

	for(int i=0; i<PIPE_SIZE; i++){

		pipe_ptr = &pipe[i];

		if (pipe_ptr->status == USED && pipe_ptr->producer_task == producer_task){

			task_pipe_slots++;

			if (pipe_ptr->consumer_task == consumer_task){

				if (last_order < pipe_ptr->order){
					last_order = pipe_ptr->order;
				}
			}
		}
	}

	if (task_pipe_slots == MAX_TASK_SLOTS){
		return 0;
	}

	pipe_ptr = getPIPEfreePosition();

	if (pipe_ptr == 0){
		return 0;
	}

	pipe_ptr->producer_task = producer_task;

	pipe_ptr->consumer_task = consumer_task;

	pipe_ptr->message.length = msg->length;

	pipe_ptr->status = USED;

	pipe_ptr->order = last_order + 1;

	for (int i=0; i<msg->length; i++){
		pipe_ptr->message.msg[i] = msg->msg[i];
	}

	pipe_free_positions--;

	return 1;

}

unsigned int searchPIPEproducer(int producer_task){

	PipeSlot * pipe_ptr;
	unsigned int msg_count=0;

	for(int i=0; i<PIPE_SIZE; i++){

		pipe_ptr = &pipe[i];

		if (pipe_ptr->status == USED && producer_task == pipe_ptr->producer_task){
			msg_count++;
		}
	}

	return msg_count;
}

unsigned int searchForAnyMsgInPIPE(){

	PipeSlot * pipe_ptr;
	unsigned int msg_count=0;

	for(int i=0; i<PIPE_SIZE; i++){

		pipe_ptr = &pipe[i];

		if (pipe_ptr->status == USED){
			msg_count++;
		}
	}

	if (msg_count){
		return msg_count;
	}

	return 0;
}

PipeSlot * removePIPE(int producer_task,  int consumer_task){

	PipeSlot * pipe_ptr, * sel_pipe;
	unsigned int min_order = 0xFFFFFFFF; //Max unsigned integer value

	if (pipe_free_positions == PIPE_SIZE){
		return 0;
	}

	sel_pipe = 0;

	for(int i=0; i<PIPE_SIZE; i++){

		pipe_ptr = &pipe[i];

		if (pipe_ptr->status == USED && producer_task == pipe_ptr->producer_task && consumer_task == pipe_ptr->consumer_task){

			if(min_order > pipe_ptr->order){
				sel_pipe = pipe_ptr;
				min_order = pipe_ptr->order;
			}
		}
	}

	if (sel_pipe == 0){
		return 0;
	}

	sel_pipe->status = EMPTY;

	pipe_free_positions++;

	return sel_pipe;
}


PipeSlot * getPIPEfreePosition(){

	for(int i=0; i<PIPE_SIZE; i++){
		if (pipe[i].status == EMPTY){
			return &pipe[i];
		}
	}

	return 0;

}

int insertMessageRequest(int producer_task, int consumer_task, int requester_proc) {

    int i;

    for (i=0; i<REQUEST_SIZE; i++)
    	if ( message_request[i].requester == -1 ) {
    		message_request[i].requester  = consumer_task;
    		message_request[i].requested  = producer_task;
    		message_request[i].requester_proc = requester_proc;
    		return 1;
		}

    puts("ERROR - request table if full\n");
	return 0;	/*no space in table*/
}

char searchMessageRequest(int producer_task, int consumer_task) {

    for(int i=0; i<REQUEST_SIZE; i++) {
        if( message_request[i].requested == producer_task && message_request[i].requester == consumer_task){
            return 1;
        }
    }

    return 0;
}

int removeMessageRequest(int producer_task, int consumer_task) {

    for(int i=0; i<REQUEST_SIZE; i++) {
        if( message_request[i].requested == producer_task && message_request[i].requester == consumer_task){
        	message_request[i].requester = -1;
        	message_request[i].requested = -1;
            return message_request[i].requester_proc;
        }
    }

    return -1;
}

#endif
