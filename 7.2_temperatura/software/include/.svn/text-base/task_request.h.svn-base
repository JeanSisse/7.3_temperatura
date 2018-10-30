/*
 * task_request.h
 *
 *  Created on: Mar 24, 2015
 *      Author: mruaro
 */

#ifndef TASK_REQUEST_H_
#define TASK_REQUEST_H_

typedef struct {
	int task_ID;
	int requesting_task;
} TaskRequest;

TaskRequest task_req_list[MAX_GLOBAL_TASKS];

unsigned int task_req_first = 0;
unsigned int task_req_last = 0;

void init_task_req_list(){

	for(int i=0; i<MAX_GLOBAL_TASKS; i++){
		task_req_list[i].task_ID = -1;
	}
}


void add_task_request(int task_ID, int requesting_task){

	TaskRequest *task_req = &task_req_list[task_req_last];

	if (task_req_last == MAX_GLOBAL_TASKS-1){
		task_req_last = 0;
	} else {
		task_req_last++;
	}

	task_req->task_ID = task_ID;

	task_req->requesting_task = requesting_task;

}

TaskRequest * get_next_task_request(){

	TaskRequest *task_req;

	if (task_req_first == task_req_last){

		return 0;

	} else {

		task_req = &task_req_list[task_req_first];

		if (task_req_first == MAX_GLOBAL_TASKS-1){
			task_req_first = 0;
		} else {
			task_req_first++;
		}

		return task_req;
	}
}

#endif /* NEW_TASK_H_ */
