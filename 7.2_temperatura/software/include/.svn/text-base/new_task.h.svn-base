/*
 * new_task.h
 *
 *  Created on: Mar 24, 2015
 *      Author: mruaro
 */

#ifndef NEW_TASK_H_
#define NEW_TASK_H_

typedef struct {
	int task_ID;
	int master_ID;
	int allocated_processor;
	unsigned int initial_address;
	int code_size;
	int data_size;
	int bss_size;
} NewTask;

NewTask new_task_list[MAX_GLOBAL_TASKS];

unsigned int first = 0;
unsigned int last = 0;

void init_new_task_list(){

	for(int i=0; i<MAX_GLOBAL_TASKS; i++){
		new_task_list[i].task_ID = -1;
	}
}


void add_new_task(NewTask *input){

	NewTask *new_task = &new_task_list[last];

	if (last == MAX_GLOBAL_TASKS-1){
		last = 0;
	} else {
		last++;
	}

	new_task->task_ID = input->task_ID;

	new_task->master_ID = input->master_ID;

	new_task->allocated_processor = input->allocated_processor;

	new_task->initial_address = input->initial_address;

	new_task->code_size = input->code_size;

	new_task->data_size = input->data_size;

	new_task->bss_size = input->bss_size;

	//putsv("New task requisition: ", new_task->task_ID);
}

NewTask * get_next_new_task(){

	NewTask *new_task;

	if (first == last){

		return 0;

	} else {

		new_task = &new_task_list[first];

		if (first == MAX_GLOBAL_TASKS-1){
			first = 0;
		} else {
			first++;
		}

		//putsv("Task allocated: ", new_task->task_ID);

		return new_task;
	}
}

#endif /* NEW_TASK_H_ */
