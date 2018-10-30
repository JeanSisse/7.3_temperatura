/*
 * task_migration.h
 *
 *  Created on: Jan 25, 2015
 *      Author: mruaro
 */

#ifndef SOFTWARE_INCLUDE_TASK_MIGRATION_H_
#define SOFTWARE_INCLUDE_TASK_MIGRATION_H_

void putsv(const char *string, int v);
void send_task_migrated(int migrated_task, int old_proc);

void migrate_dynamic_memory(TCB * tcb_aux){

	unsigned int _stack_pointer;
	unsigned int stack_lenght;
	unsigned int processor;
	volatile unsigned int tcb_registers[30];
	volatile unsigned int task_location_array[MAX_APP_SIZE];
	volatile unsigned int request_msg[REQUEST_SIZE*3];
	unsigned int app_id;
	unsigned int request_index;
	ServiceHeader * p;

	//putsv("MIGRA-Init of Migrate DATA: ", MemoryRead(TICK_COUNTER));
	processor = tcb_aux->proc_to_migrate;

	tcb_aux->proc_to_migrate = -1;

	_stack_pointer = tcb_aux->reg[25];

	while((PAGESIZE - _stack_pointer) % 4)
		_stack_pointer--;

	stack_lenght = (PAGESIZE - _stack_pointer) / 4;

	_stack_pointer = tcb_aux->reg[25];

	//------ tcb ------
	//puts("\n--- tcb ----\n");
	p = get_service_header_slot();

	p->header = processor;

	p->service = MIGRATION_TCB;

	p->task_ID = tcb_aux->id;

	p->program_counter = tcb_aux->pc - tcb_aux->offset;

	for (int i=0; i<30; i++){
		if (i == 27)
			tcb_registers[i] = tcb_aux->reg[i] - tcb_aux->offset;
		else
			tcb_registers[i] = tcb_aux->reg[i];
	}

	send_packet(p, (unsigned int) &tcb_registers, 30);
	// ------- end tcb ------

	// ----- task location ------
	p = get_service_header_slot();

	p->header = processor;

	p->task_ID = tcb_aux->id;

	p->service = MIGRATION_TASK_LOCATION;

	app_id = tcb_aux->id & 0xFF00;

	for( int i=0; i<MAX_APP_SIZE; i++ ){

		if ( searchPIPEproducer(app_id | i) ) {
			task_location_array[i] = get_net_address();
		} else {
			task_location_array[i] = task_location[tcb_aux->id >> 8][i];
		}
		//puts("Location task "); puts(itoa(app_id | i)); putsv(" : ", task_location_array[i]);
	}

	send_packet(p, (unsigned int) &task_location_array, MAX_APP_SIZE);
	// ----- end task location ------

	// ----- task request -----
	request_index = 0;

	for(int i=0; i<REQUEST_SIZE; i++) {

		if (message_request[i].requested == tcb_aux->id){

			request_msg[request_index++] = message_request[i].requester;
			request_msg[request_index++] = message_request[i].requested;
			request_msg[request_index++] = message_request[i].requester_proc;

			message_request[i].requester = -1;
			message_request[i].requested = -1;
		}
	}

	if (request_index > 0){

		p = get_service_header_slot();

		p->header = processor;

		p->service = MIGRATION_MSG_REQUEST;

		p->task_ID = tcb_aux->id;

		p->request_size = request_index;

		send_packet(p, (unsigned int) &request_msg, request_index);
	}
	// ----- end task request -----

	// ----- stack -----
	p = get_service_header_slot();

	p->header = processor;

	p->service = MIGRATION_STACK;

	p->task_ID = tcb_aux->id;

	p->stack_size = stack_lenght;

	send_packet(p, (tcb_aux->offset + _stack_pointer), stack_lenght);
	// ----- end stack -----

	// ------ data and bss -----
	p = get_service_header_slot();

	p->header = processor;

	p->service = MIGRATION_DATA_BSS;

	p->task_ID = tcb_aux->id;

	p->data_size = tcb_aux->data_lenght;

	p->bss_size = tcb_aux->bss_lenght;

	send_packet(p, tcb_aux->offset + (tcb_aux->text_lenght * 4) ,  (tcb_aux->data_lenght + tcb_aux->bss_lenght) );
	// ----- end data and bss -----

	tcb_aux->status = FREE;

	puts("Task id: "); puts(itoa(tcb_aux->id)); puts(" migrated to proc "); puts(itoa(processor)); putsv(" at ", MemoryRead(TICK_COUNTER));

	task_location[tcb_aux->id >> 8][tcb_aux->id & 0xFF] = processor;

	task_status[tcb_aux->id >> 8][tcb_aux->id & 0xFF] |= MIGRATED;

	tcb_aux->pc = 0;
	tcb_aux->id = -1;
	tcb_aux->proc_to_migrate = -1;

}


void migrate_CODE(TCB* tcb_migration){

	ServiceHeader * p = get_service_header_slot();

	p->header = tcb_migration->proc_to_migrate;

	p->service = MIGRATION_CODE;

	p->master_ID = tcb_migration->master_address;

	p->task_ID = tcb_migration->id;

	p->code_size = tcb_migration->text_lenght;

	send_packet(p, tcb_migration->offset, tcb_migration->text_lenght);
}

void handle_migration_code(ServiceHeader * p, TCB * migrate_tcb){

	if(migrate_tcb == 0){
		puts("ERROR: Task Allocation in Migration - NO FREE PAGES\n");
		for(;;);
	}

	migrate_tcb->status = MIGRATING;

	migrate_tcb->id = p->task_ID;

	migrate_tcb->master_address = p->master_ID;

	migrate_tcb->text_lenght = p->code_size;

	DMA_read_data(migrate_tcb->offset, migrate_tcb->text_lenght);
	//printTaskInformations(allocatingTCB, 1, 0, 0);
	putsv("MIGRA-Code received: ", MemoryRead(TICK_COUNTER));
}

void handle_migration_TCB(ServiceHeader * p, TCB * migrate_tcb){

	volatile unsigned int tcb_registers[30];

	migrate_tcb->pc = p->program_counter + migrate_tcb->offset;


	DMA_read_data((unsigned int) &tcb_registers, 30);

	for (int i=0; i<30; i++){
		if (i == 27)
			migrate_tcb->reg[i] = tcb_registers[i] + migrate_tcb->offset;
		else
			migrate_tcb->reg[i] = tcb_registers[i];
	}
}

void handle_migration_task_location(ServiceHeader * p, TCB * migrate_tcb){

	volatile unsigned int task_location_array[MAX_APP_SIZE];
	unsigned int location;
	unsigned int app_id;

	DMA_read_data( (unsigned int) &task_location_array, MAX_APP_SIZE);

	app_id = migrate_tcb->id >> 8;

	for( int i=0; i<MAX_APP_SIZE; i++ ){

		location = task_location_array[i];

		puts("Location task "); puts(itoa(app_id << 8 | i)); putsv(" : ", location);

		if (task_location[app_id][i] == NOT_ALLOCATED && location != NOT_ALLOCATED){
			task_location[app_id][i] = location;
		}
	}
}

void handle_migration_request_msg(ServiceHeader * p, TCB * migrate_tcb){

	volatile unsigned int request_msg[p->request_size];
	int requested, requester, requester_proc;
	unsigned int request_index, iterations;

	DMA_read_data( (unsigned int) &request_msg, p->request_size);

	request_index = 0;

	iterations = p->request_size / 3;

	for( int i=0; i<iterations; i++ ) {
		requester = request_msg[request_index++];
		requested = request_msg[request_index++];
		requester_proc = request_msg[request_index++];

		if ( requested == migrate_tcb->id) {
			//putsv("requester: ", requester); putsv("requested: ", requested);
			insertMessageRequest(requested, requester, requester_proc);
		}
	}

}

void handle_migration_stack(ServiceHeader * p, TCB * migrate_tcb){

	if (p->stack_size > 0){
		DMA_read_data(migrate_tcb->offset + migrate_tcb->reg[25], p->stack_size);
	}
}

void handle_migration_DATA_BSS(ServiceHeader * p, TCB * migrate_tcb){

	migrate_tcb->data_lenght = p->data_size;

	migrate_tcb->bss_lenght = p->bss_size;

	if ((migrate_tcb->bss_lenght + migrate_tcb->data_lenght) > 0){

		DMA_read_data(migrate_tcb->offset + (migrate_tcb->text_lenght*4), (migrate_tcb->bss_lenght + migrate_tcb->data_lenght));
	}

	migrate_tcb->status = READY;

	migrate_tcb->proc_to_migrate = -1;

	migrate_tcb->reimaning_time_slice = MAX_TIME_SLICE;

	send_task_migrated(migrate_tcb->id, p->source_PE);

	//printTaskInformations(migrate_tcb, 1, 1, 1);
}


int handle_task_migration(ServiceHeader * p, TCB * tcb_ptr){

	putsv("MIGRA-Task migration init: ", MemoryRead(TICK_COUNTER));

	putsv("Migration order: task: ",  p->task_ID);
	putsv("To migrate to proc: ", p->allocated_processor);

	if (tcb_ptr && tcb_ptr->proc_to_migrate == -1){

		tcb_ptr->proc_to_migrate = p->allocated_processor;

		migrate_CODE(tcb_ptr);

		if (tcb_ptr->status == READY){

			puts("Migrou de primeira\n");

			migrate_dynamic_memory(tcb_ptr);

			return 1;
		}
	} else {
		puts ("WARNING: task not found or proc_to_migrated already assigned\n");
	}

	return 0;

}


int handle_migration(ServiceHeader * p, TCB * migrate_tcb){

	int need_scheduling = 0;

	switch(p->service){

		case TASK_MIGRATION:

			need_scheduling = handle_task_migration(p, migrate_tcb);

			break;

		case MIGRATION_CODE:

			handle_migration_code(p, migrate_tcb);

			break;

		case MIGRATION_TCB:

			handle_migration_TCB(p, migrate_tcb);

			break;

		case MIGRATION_TASK_LOCATION:

			handle_migration_task_location(p, migrate_tcb);

			break;

		case MIGRATION_MSG_REQUEST:

			handle_migration_request_msg(p, migrate_tcb);

			break;

		case MIGRATION_STACK:

			handle_migration_stack(p, migrate_tcb);

			break;

		case MIGRATION_DATA_BSS:

			handle_migration_DATA_BSS(p, migrate_tcb);

			need_scheduling = 1;

			break;
		default:
			puts("ERROR - Task Migration service unknown\n");
			break;
		}

	return need_scheduling;

}


#endif /* SOFTWARE_INCLUDE_TASK_MIGRATION_H_ */
