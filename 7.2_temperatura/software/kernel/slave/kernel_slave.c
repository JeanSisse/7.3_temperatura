//------------------------------------------------------------------------------------------------
//
//  DISTRIBUTED HEMPS -  5.0
//
//  Research group: GAPH-PUCRS    -    contact   fernando.moraes@pucrs.br
//
//  Distribution:  September 2013
//
//  Source name:  kernel_slave.c
//
//  Brief description: Microkernel for Plasma processors, this source manages the resources of HeMPS, communication between hardware
//		       and software.
//
//------------------------------------------------------------------------------------------------


#include "kernel_slave.h"

#if MIGRATION_ENABLED
#include "../../include/task_migration.h"
#endif

unsigned int net_address;
unsigned int schedule_after_syscall;

TCB idle_tcb;						/*idle task's tcb*/
TCB tcbs[MAXLOCALTASKS];			/*local tasks' tcbs*/
TCB *current;						/*pointer to scheduled task's tcb*/

Message msg_write_pipe;

unsigned int cluster_master_address = 0;
unsigned int counter_ticks = 500000;
unsigned long int router_flits_anterior = 0;

unsigned int stop_execution_flag = 0;

void puts(char *string) {

	int *str_part;
	for(str_part = (int*)string,  MemoryWrite(UART_WRITE,*str_part);
		!(((char*)str_part)[0] == 0 || ((char*)str_part)[1] == 0 || ((char*)str_part)[2] == 0 || ((char*)str_part)[3] == 0);
		*str_part++,MemoryWrite(UART_WRITE, *str_part));
}


TCB* search_free_TCB() {

    for(int i=0; i<MAXLOCALTASKS; i++){
		if(tcbs[i].status == FREE){
			return &tcbs[i];
		}
	}

    puts("ERROR - no FREE TCB\n");
    return 0;
}

TCB* searchTCB(unsigned int task) {

    int i;

    for(i=0; i<MAXLOCALTASKS; i++)
    	if(tcbs[i].id == task)
    		return &tcbs[i];

    return 0;
}

void putsv(const char *string, int v){
	puts(string);
	puts(itoa(v));
	puts("\n");
}

void send_task_terminated(TCB * terminated_task){

	ServiceHeader *p = get_service_header_slot();

	p->header = terminated_task->master_address;

	p->service = TASK_TERMINATED;

	p->task_ID = terminated_task->id;

	p->master_ID = cluster_master_address;

	send_packet(p, 0, 0);

	if (terminated_task->master_address != cluster_master_address){

		p->header = cluster_master_address;

		p->service = TASK_TERMINATED_OTHER_CLUSTER;

		p->master_ID = terminated_task->master_address;

		send_packet(p, 0, 0);
	}

}

void send_message_delivery(int producer_task, int consumer_task, int consumer_PE, Message * msg_ptr){

	ServiceHeader *p = get_service_header_slot();

	p->header = consumer_PE;

	p->service = MESSAGE_DELIVERY;

	p->producer_task = producer_task;

	p->consumer_task = consumer_task;

	p->msg_lenght = msg_ptr->length;

	send_packet(p, (unsigned int)msg_ptr->msg, msg_ptr->length);

}

void send_task_request(TCB * requester_task, int requested_task){

	ServiceHeader *p = get_service_header_slot();

	p->header =  requester_task->master_address;

	p->service = TASK_REQUEST;

	p->task_ID = requested_task;

	p->requesting_task = requester_task->id;

	send_packet(p, 0, 0);

	task_location[requested_task >> 8][requested_task & 0xFF] = REQUESTED;
}

void send_update_task_location(unsigned int proc, unsigned int task){

	ServiceHeader *p = get_service_header_slot();

	p->header = proc;

	p->service = UPDATE_TASK_LOCATION;

	p->task_ID = task;

	p->allocated_processor = get_location(task);

	send_packet(p, 0, 0);
}

void send_message_request(int producer_task, int consumer_task, unsigned int sourcePE){


	ServiceHeader *p = get_service_header_slot();

	p->header = task_location[producer_task >> 8][producer_task & 0xFF];

	p->service = MESSAGE_REQUEST;

	p->requesting_processor = sourcePE;

	p->producer_task = producer_task;

	p->consumer_task = consumer_task;

	send_packet(p, 0, 0);
}


void send_energy_slave(){


	ServiceHeader *p = get_service_header_slot();

	read_inst();


	logical_energy 		= logical_inst * 23 	- logical_energy;
	branch_energy		= branch_inst * 31 		- branch_energy;
	jump_energy			= jump_inst * 20 		- jump_energy;
	move_energy			= move_inst * 21 		- move_energy;
	other_energy		= other_inst * 26 		- other_energy;
	arith_energy		= arith_inst * 26 		- arith_energy;
	load_energy			= load_inst	* 44 		- load_energy;
	shift_energy		= shift_inst * 22 		- shift_energy;
	nop_energy	  		= nop_inst * 15 		- nop_energy;
	mult_div_energy 	= mult_div_inst * 23 	- mult_div_energy;

	/*
	logical_energy 		= logical_inst - logical_energy;
	branch_energy		= branch_inst - branch_energy;
	jump_energy			= jump_inst - jump_energy;
	move_energy			= move_inst - move_energy;
	other_energy		= other_inst - other_energy;
	arith_energy		= arith_inst - arith_energy;
	load_energy			= load_inst	- load_energy;
	shift_energy		= shift_inst - shift_energy;
	nop_energy	  		= nop_inst - nop_energy;
	mult_div_energy 	= mult_div_inst - mult_div_energy;
	*/

	router_flits = MemoryRead(TOTAL_FLITS_ROUTER);

	//energy_acc_local = (logical_energy + branch_energy + jump_energy + move_energy + other_energy + arith_energy + load_energy + shift_energy + nop_energy + mult_div_energy + (router_flits - router_flits_anterior)*5);
	energy_acc_local = (logical_energy + branch_energy + jump_energy + move_energy + other_energy + arith_energy + load_energy + shift_energy + nop_energy + mult_div_energy );


	/*	puts("logical_energy: "); puts(itoa(logical_energy)); puts(" "); puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");
		puts("branch_energy: "); puts(itoa(branch_energy)); puts(" "); puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");
		puts("jump_energy: "); puts(itoa(jump_energy)); puts(" "); puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");
		puts("move_energy: "); puts(itoa(move_energy)); puts(" "); puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");
		puts("other_energy: "); puts(itoa(other_energy)); puts(" "); puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");
		puts("arith_energy: "); puts(itoa(arith_energy)); puts(" "); puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");
		puts("load_energy: "); puts(itoa(load_energy)); puts(" "); puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");
		puts("shift_energy: "); puts(itoa(shift_energy)); puts(" "); puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");
		puts("nop_energy: "); puts(itoa(nop_energy)); puts(" "); puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");
		puts("mult_div_energy: "); puts(itoa(mult_div_energy)); puts(" "); puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");
		puts("energy_acc_local: "); puts(itoa(energy_acc_local)); puts(" "); puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");
*/
		logical_energy 		= logical_inst * 23;
		branch_energy		= branch_inst * 31;
		jump_energy			= jump_inst * 20;
		move_energy			= move_inst * 21;
		other_energy		= other_inst * 26;
		arith_energy		= arith_inst * 26;
		load_energy			= load_inst	* 44;
		shift_energy		= shift_inst * 22;
		nop_energy	  		= nop_inst * 15;
		mult_div_energy 	= mult_div_inst * 23;

	puts("energy_acc_local total: "); puts(itoa(energy_acc_local));
	puts("\t"); puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");


/*	if(energy_acc_local > 2340000*5) {
		energy_acc_local = 10;
	}
	else if(energy_acc_local > 2080000*5){
			energy_acc_local = 9;
		 }
	else if(energy_acc_local > 1820000*5){
			energy_acc_local = 8;
		 }
	else if(energy_acc_local > 1560000*5){
			energy_acc_local = 7;
		 }
	else if(energy_acc_local > 1300000*5){
			energy_acc_local = 6;
		 }
	else if(energy_acc_local > 1040000*5){
			energy_acc_local = 5;
		 }
	else if(energy_acc_local > 780000*5){
			energy_acc_local = 4;
		 }
	else if(energy_acc_local > 520000*5){
			energy_acc_local = 3;
		 }
	else if(energy_acc_local > 260000*5){
			energy_acc_local = 2;
		 }
	else if(energy_acc_local > 130000*5){
			energy_acc_local = 1;
		 }
	else energy_acc_local = 0;
*/

	//energy_acc_local = 0;

	//puts("energy_acc_local discret: "); puts(itoa(energy_acc_local)); puts("\n");

	router_flits_anterior = router_flits;

	p->header = cluster_master_address; //para onde estou enviando

	p->service = ENERGY_SLAVE;

	p->energy_acc = energy_acc_local;

	send_packet(p, 0, 0); // send_packet(p, initial_address, dma_msg_size)

}


#if MIGRATION_ENABLED
void send_task_migrated(int migrated_task, int old_proc){

	ServiceHeader * p = get_service_header_slot();

	p->header = cluster_master_address;

	p->service = TASK_MIGRATED;

	p->task_ID = migrated_task;

	p->released_proc = old_proc;

	send_packet(p, 0, 0);
}
#endif

/*--------------------------------------------------------------------
* Syscall
*
* DESCRIPTION:
*    Syscall handler.
*--------------------------------------------------------------------*/
int Syscall(unsigned int service, unsigned int arg0, unsigned int arg1, unsigned int arg2) {

	Message *msg_read;
	Message *msg_write;
	PipeSlot *pipe_ptr;
	int consumer_task;
	int producer_task;
	int producer_PE;
	int consumer_PE;
	int appID;
	int ret;

	schedule_after_syscall = 0;



   /* if((MemoryRead(TICK_COUNTER)/100000) >= counter_ticks){

		counter_ticks++;

		send_energy_slave();
		puts("energy_acc_local: "); puts(itoa(energy_acc_local)); puts(" "); puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");

	}
	*/

	switch (service) {

		case EXIT:

			schedule_after_syscall = 1;

			if (MemoryRead(DMA_SEND_ACTIVE)){
				return 0;
			}

			puts("Task id: "); puts(itoa(current->id)); putsv(" terminated at ", MemoryRead(TICK_COUNTER));

			current->status = FREE;

			send_task_terminated(current);

		return 1;

		case WRITEPIPE:

			if ( MemoryRead(DMA_SEND_ACTIVE) ){
				return 0;
			}

			producer_task =  current->id;
			consumer_task = (int) arg1;

			appID = producer_task >> 8;
			consumer_task = (appID << 8) | consumer_task;

			consumer_PE = task_location[consumer_task >> 8][consumer_task & 0xFF];

			if (consumer_PE == NOT_ALLOCATED){
				send_task_request(current, consumer_task);
			}

			/*Points the message in the task page. Address composition: offset + msg address*/
			msg_read = (Message *)((current->offset) | arg0);

			consumer_PE = removeMessageRequest(producer_task, consumer_task);

			if (consumer_PE != -1){

				if (consumer_PE == net_address){

					TCB * requesterTCB = searchTCB(consumer_task);
					msg_write = (Message*)((requesterTCB->offset) | ((unsigned int)requesterTCB->reg[3])); /*reg[3] = address message*/

					msg_write->length = msg_read->length;

					for (int i=0; i<msg_write->length; i++)
						msg_write->msg[i] = msg_read->msg[i];

					requesterTCB->reg[0] = TRUE;  /*v0, return value*/

					requesterTCB->status = READY;

#if MIGRATION_ENABLED
					if (requesterTCB->proc_to_migrate != -1){
						//puts("Migrou no write pipe\n");

						migrate_dynamic_memory(requesterTCB);
						schedule_after_syscall = 1;
					}
#endif

				} else {

					msg_write_pipe.length = msg_read->length;

					//Avoids message overwriting by the producer task
					for (int i=0; i < msg_read->length; i++)
						msg_write_pipe.msg[i] = msg_read->msg[i];

					send_message_delivery(producer_task, consumer_task, consumer_PE, &msg_write_pipe);

				}
			} else {

				//########################### ADD PIPE #################################
				ret = addPIPE(producer_task, consumer_task, msg_read);
				//########################### ADD PIPE #################################

				if (ret == 0){
					schedule_after_syscall = 1;
					return 0;
				}
			}

		return 1;

		case READPIPE:

			if (MemoryRead(DMA_SEND_ACTIVE)){
				return 0;
			}

			consumer_task =  current->id;
			producer_task = (int) arg1;

			appID = consumer_task >> 8;
			producer_task = (appID << 8) | producer_task;

			producer_PE = task_location[producer_task >> 8][producer_task & 0xFF];

			if (producer_PE == NOT_ALLOCATED || producer_PE == REQUESTED){

				if (producer_PE == NOT_ALLOCATED){

					send_task_request(current, producer_task);
				}

				schedule_after_syscall = 1;
				return 0;
			}

			pipe_ptr = removePIPE(producer_task, consumer_task);

			if (pipe_ptr == 0){

				if (producer_PE == net_address){

					insertMessageRequest(producer_task, consumer_task, net_address);

				} else {

					send_message_request(producer_task, consumer_task, net_address);
				}

				current->status = WAITING;

				schedule_after_syscall = 1;

				return 0;
			}

			msg_write = (Message*) arg0;

			msg_write = (Message*)((current->offset) | ((unsigned int)msg_write));

			msg_write->length = pipe_ptr->message.length;

			for (int i = 0; i<msg_write->length; i++)
				msg_write->msg[i] = pipe_ptr->message.msg[i];

		return 1;

		case GETTICK:

			return MemoryRead(TICK_COUNTER);

		break;

		case ECHO:

			puts(itoa(MemoryRead(TICK_COUNTER))); puts("_");
			puts(itoa(net_address>>8));puts("x");puts(itoa(net_address&0xFF)); puts("_");
			puts(itoa(current->id >> 8)); puts("_");
			puts(itoa(current->id & 0xFF)); puts("_");
			puts((char *)((current->offset) | (unsigned int) arg0));
			puts("\n");

		break;
	}

	return 0;
}

/*--------------------------------------------------------------------
* Handler_NI
*
* DESCRIPTION:
*    Initiates the handling of incoming network services.
*
*--------------------------------------------------------------------*/
int handle_packet(ServiceHeader *p) {

	unsigned int need_scheduling;
	unsigned int task;
	unsigned char task_st;
	PipeSlot * slot_ptr;
	Message * msg_ptr;
	TCB * tcb_ptr = 0;

    need_scheduling = 0;
    // stop_execution_flag = 0;

   // puts("SERVICO "); puts(itoa(p->service)); puts("RECEBIDO NO PROCESSADOR "); puts(itoa(p->header));puts("\n");

	switch (p->service) {
		// puts(": "); puts(itoa(p->service)); puts("\n");
		case MESSAGE_REQUEST:

			slot_ptr = removePIPE(p->producer_task, p->consumer_task);

			if (slot_ptr == 0){

				task_st = task_status[p->producer_task >> 8][p->producer_task & 0xFF];

				if (task_st & MIGRATED) {

					send_message_request(p->producer_task, p->consumer_task, p->requesting_processor);

					if ( searchPIPEproducer(p->producer_task) == 0 ){

						send_update_task_location(p->source_PE, p->producer_task);
					}

				} else {

					insertMessageRequest(p->producer_task, p->consumer_task, p->requesting_processor);
				}

			} else if (p->requesting_processor != net_address){

				send_message_delivery(p->producer_task, p->consumer_task, p->requesting_processor, &slot_ptr->message);

			} else {

				TCB * tcb_ptr = searchTCB(p->consumer_task);
				msg_ptr = (Message*)((tcb_ptr->offset) | ((unsigned int)tcb_ptr->reg[3]));

				msg_ptr->length = slot_ptr->message.length;

				for (int i=0; i<msg_ptr->length; i++)
					msg_ptr->msg[i] = slot_ptr->message.msg[i];

				tcb_ptr->reg[0] = TRUE;

				tcb_ptr->status = READY;
			}

			break;

		case  MESSAGE_DELIVERY:

			tcb_ptr = searchTCB(p->consumer_task);

			msg_ptr = (Message *)(tcb_ptr->offset | tcb_ptr->reg[3]);

			msg_ptr->length = p->msg_lenght;

			DMA_read_data((unsigned int)msg_ptr->msg, msg_ptr->length);

			tcb_ptr->reg[0] = 1;

			tcb_ptr->status = READY;

#if MIGRATION_ENABLED
			if (tcb_ptr->proc_to_migrate != -1){
				//puts("Migrou no delivery\n");
				migrate_dynamic_memory(tcb_ptr);
				need_scheduling = 1;

			} else
#endif
			if (current == &idle_tcb){
				need_scheduling = 1;
			}

			break;

		case TASK_ALLOCATION:

			tcb_ptr = search_free_TCB();

			tcb_ptr->pc = 0;

			tcb_ptr->id = p->task_ID;

			// puts("SERVICO "); puts(itoa(p->service)); puts("RECEBIDO NO PROCESSADOR "); puts(itoa(p->header)); puts("\n");

			puts("Task id: "); puts(itoa(tcb_ptr->id)); putsv(" allocated at ", MemoryRead(TICK_COUNTER));

			int code_lenght = p->code_size;

			tcb_ptr->data_lenght = p->data_size;

			tcb_ptr->bss_lenght = p->bss_size;

			tcb_ptr->text_lenght = code_lenght - tcb_ptr->data_lenght;

			tcb_ptr->master_address = p->master_ID;

			tcb_ptr->proc_to_migrate = -1;

			tcb_ptr->reimaning_time_slice = MAX_TIME_SLICE;

			DMA_read_data(tcb_ptr->offset, code_lenght);

			task_location[tcb_ptr->id >> 8][tcb_ptr->id & 0xFF] = net_address;

			task_status[tcb_ptr->id >> 8][tcb_ptr->id & 0xFF] = 0;

			tcb_ptr->status = READY;

			if (current == &idle_tcb){
				need_scheduling = 1;
			}

			break;

		case TASK_ALLOCATED:

			task = p->task_ID;

			task_location[task >> 8][task & 0xFF] = p->allocated_processor;

			break;

		case UPDATE_TASK_LOCATION:

			task = p->task_ID;

			task_location[task >> 8][task & 0xFF] = p->allocated_processor;

			break;

		case INITIALIZE_SLAVE:

			cluster_master_address = p->source_PE;

			break;

#if MIGRATION_ENABLED
		case TASK_MIGRATION:
		case MIGRATION_CODE:
		case MIGRATION_TCB:
		case MIGRATION_TASK_LOCATION:
		case MIGRATION_MSG_REQUEST:
		case MIGRATION_STACK:
		case MIGRATION_DATA_BSS:

			if (p->service == MIGRATION_CODE){
				tcb_ptr = search_free_TCB();
			} else {
				tcb_ptr = searchTCB(p->task_ID);
			}

			need_scheduling = handle_migration(p, tcb_ptr);
			break;
#endif

		case STOP_EXECUTION:
			// puts("SERVICO "); puts(itoa(p->service)); puts("RECEBIDO NO PROCESSADOR "); puts(itoa(p->header)); puts("\n");
			puts("Pacote STOP_EXECUTION RECEBIDO!\n");
			puts("(kernel_slave)->No processador: "); puts(itoa(p->header)); puts("\n");
			// puts("execution_stoped: "); puts(itoa(p->execution_stoped)); puts("\n");
			need_scheduling = 1;
			stop_execution_flag = 1;
			break;

		default:
			putsv("ERROR-SLAVE: service unknown: ", MemoryRead(TICK_COUNTER));
			break;
	}

	return need_scheduling;

}

void Scheduler() {
#if SCHEDULING_REPORT_ENABLED
	MemoryWrite(SCHEDULING_REPORT, SCHEDULER);
#endif
    static unsigned int round_robin = 0;

    int scheduled = FALSE;
    int i;

    if((MemoryRead(TICK_COUNTER)) >= counter_ticks){

			counter_ticks = counter_ticks + 500000;

			send_energy_slave();
			puts("energy_acc_local (k_slave): ");
			puts(itoa(energy_acc_local)); puts(" "); puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");

	}

  if (current->status == RUNNING){
    current->status = READY;
    current->reimaning_time_slice = MemoryRead(TIME_SLICE);
    if (current->reimaning_time_slice <= 1){
    	current->reimaning_time_slice = MAX_TIME_SLICE;
    }
  }

  if(stop_execution_flag){
		current = &idle_tcb; /* schedules the idle task */
		// scheduled = TRUE;
		// puts("teste com stop_execution_flag parando"); putsv(" at ", MemoryRead(TICK_COUNTER)); puts("\n");
		if (current->status == READY ) {
	       puts("teste com stop_execution_flag parando"); putsv(" em ", MemoryRead(TICK_COUNTER)); puts("\n");
	       	/*ready to execute*/
			current->status = RUNNING;
			scheduled = TRUE;

			OS_InterruptMaskClear(0xffffffff);		// MDO: INCERIDO 19/10

			/*enable timeslice counter*/
			OS_InterruptMaskSet(IRQ_SCHEDULER);

			/*restart timeslice for the task*/
			MemoryWrite(TIME_SLICE, current->reimaning_time_slice);
			#if SCHEDULING_REPORT_ENABLED
				MemoryWrite(SCHEDULING_REPORT, current->id);
			#endif

			stop_execution_flag = 1;
	    }
	}
	else{
	    for (i=0; i<MAXLOCALTASKS; i++) {
	        if (round_robin == MAXLOCALTASKS-1)
	        	round_robin = 0;
	        else
	        	round_robin++;

	        current = &(tcbs[round_robin]);

	        if (current->status == READY ) {
	        	/*ready to execute*/
				current->status = RUNNING;
				scheduled = TRUE;
				/*enable timeslice counter*/
				OS_InterruptMaskSet(IRQ_SCHEDULER);
				/*restart timeslice for the task*/
				MemoryWrite(TIME_SLICE, current->reimaning_time_slice);
				#if SCHEDULING_REPORT_ENABLED
					MemoryWrite(SCHEDULING_REPORT, current->id);
				#endif
				break;
	        }
	    }
	}

    if(!scheduled){	/* if no ready tasks to execute*/

    	current = &idle_tcb;	/* schedules the idle task */
        /*disable timeslice counter*/
        OS_InterruptMaskClear(IRQ_SCHEDULER);
		#if SCHEDULING_REPORT_ENABLED
        	MemoryWrite(SCHEDULING_REPORT, IDLE);
		#endif
    }
}


void OS_InterruptServiceRoutine(unsigned int status) {

	#if SCHEDULING_REPORT_ENABLED
	MemoryWrite(SCHEDULING_REPORT, INTERRUPTION);
	#endif
	volatile ServiceHeader p;
	ServiceHeader * next_service;
	int call_scheduler = 0;

	if (status & IRQ_NOC){

		read_packet(&p);
		// puts("INTERRUPTION (NOC)\n"); // MDO: INCERIDO 19/10

		if (MemoryRead(DMA_SEND_ACTIVE) && (p.service == MESSAGE_REQUEST || p.service == TASK_MIGRATION) ){

			add_pending_service(&p);

		} else {

			call_scheduler = handle_packet(&p);
		}

	} else if (status & IRQ_PENDING_SERVICE) {

		// puts("INTERRUPTION (PENDING_SERVICE)\n"); // MDO: INCERIDO 19/10

		next_service = get_next_pending_service();
		if (next_service){
			call_scheduler = handle_packet(next_service);
		}

	}
	 else if (status & IRQ_SCHEDULER){

	 	// puts("INTERRUPTION (TIME_SLICE)\n"); // MDO: INCERIDO 19/10
		call_scheduler = 1;

		OS_InterruptMaskSet(IRQ_SCHEDULER | IRQ_NOC | IRQ_PENDING_SERVICE); // MDO: INCERIDO 19/10

		stop_execution_flag = 0;
	}

	if (call_scheduler){
		Scheduler();
	}
#if SCHEDULING_REPORT_ENABLED
	else if (current == &idle_tcb){
		MemoryWrite(SCHEDULING_REPORT, IDLE);
	} else {
		MemoryWrite(SCHEDULING_REPORT, current->id);
	}
#endif

    /*runs the scheduled task*/
    ASM_RunScheduledTask(current);
}

unsigned int OS_InterruptMaskClear(unsigned int Mask) {

    unsigned int mask;

    mask = MemoryRead(IRQ_MASK) & ~Mask;
    MemoryWrite(IRQ_MASK, mask);

    return mask;
}


unsigned int OS_InterruptMaskSet(unsigned int Mask) {

    unsigned int mask;

    mask = MemoryRead(IRQ_MASK) | Mask;
    MemoryWrite(IRQ_MASK, mask);

    return mask;
}


void OS_Idle() {
	for (;;){
		if(stop_execution_flag == 1) {
			MemoryWrite(CLOCK_HOLD, 2);
			puts(itoa(stop_execution_flag)); puts("<- stop_execution_flag\n");
		}else{
			MemoryWrite(CLOCK_HOLD, 1);
			// puts(itoa(stop_execution_flag)); puts("<- stop_execution_flag??\n");
		}
	}
}

int main(){

	ASM_SetInterruptEnable(FALSE);

	idle_tcb.pc = (unsigned int) &OS_Idle;
	idle_tcb.id = 0;
	idle_tcb.offset = 0;
	idle_tcb.status = READY;
	// idle_tcb.reimaning_time_slice = MAX_TIME_SLICE; // MDO: COMENTADO 19/10
	idle_tcb.reimaning_time_slice = 500000; // MDO: INCERIDO 19/10

	current = &idle_tcb;

	net_address = get_net_address();

	puts("Initializing PE: "); puts(itoh(net_address)); puts("\n");

	initCommStructs();

	init_service_header_slots();

	for(int i=0; i<MAXLOCALTASKS; i++) {
		tcbs[i].status = FREE;
		tcbs[i].id = -1;
		tcbs[i].pc = 0;
		tcbs[i].offset = PAGESIZE*(i + KERNELPAGECOUNT);
		tcbs[i].proc_to_migrate = -1;
	}

	/*disable interrupts*/
	OS_InterruptMaskClear(0xffffffff);

	/*enables timeslice counter and wrapper interrupts*/
	OS_InterruptMaskSet(IRQ_SCHEDULER | IRQ_NOC | IRQ_PENDING_SERVICE);

	/*runs the scheduled task*/
    ASM_RunScheduledTask(current);

	return 0;
}


// OS_Idle é chamando em outro lugar além da função main??
// comparar as temperaturas da versão antiga com a versão editada

//19-10: ALTERAÇÕES:
	//MODULO KERNEL_SLAVE FOI ALTERADO (novo valor no reimaning_time_slice, puts para debug na função OS_InterruptServiceRoutine, \
	função scheduler forçamos interrupção com MaskClear)
	//MODULO PLASMA.CPP FOI ALTERADO (novo controle apara acordar o clock do PE em idle)
	//NO HARDWARE PLASMA.H FOI ALTERADO (inserido um sinal)



//TCC:
	//TERMINAR SEÇÃO:
	// 2.6.3;
	// 2.6.4;
	// 2.6.5;
	// 2.7;
	// 2.8.2;
	// 2.8.4;
	// 2.9

//Mudanças a fazer para nova versão:
	// printar as energias no case ENERGY_SLAVE:
	// MODIFICAR NO KERNEL_BUILDER.PY PARA INSERIR
