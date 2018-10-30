/*
 * packet.h
 *
 *  Created on: Jan 9, 2015
 *      Author: mruaro
 */


#ifndef SOFTWARE_INCLUDE_PACKET_H_
#define SOFTWARE_INCLUDE_PACKET_H_

#include "plasma.h"
#include "stdlib.h"

unsigned long int global_inst		=0;
unsigned long int energy_acc_local	=0;
unsigned long int logical_inst 		=0;
unsigned long int branch_inst		=0;
unsigned long int jump_inst			=0;
unsigned long int move_inst			=0;
unsigned long int other_inst		=0;
unsigned long int arith_inst		=0;
unsigned long int load_inst			=0;
unsigned long int shift_inst		=0;
unsigned long int nop_inst	   		=0;
unsigned long int mult_div_inst 	=0;

unsigned long int logical_energy 	=0;
unsigned long int branch_energy		=0;
unsigned long int jump_energy		=0;
unsigned long int move_energy		=0;
unsigned long int other_energy		=0;
unsigned long int arith_energy		=0;
unsigned long int load_energy		=0;
unsigned long int shift_energy		=0;
unsigned long int nop_energy	   	=0;
unsigned long int mult_div_energy 	=0;
unsigned long int router_flits 		=0;



#define CONSTANT_PKT_SIZE	15

/* Attention: union structures can cause issues in heterogeneous MPSoCS (endianness problem)
 * DO NOT CHANGE THE VARIABLES and UNIONS ORDER OF STRUCT ServiceHeader
*/
typedef struct {
	unsigned int header;
	unsigned int payload_size;
	unsigned int service;
	// unsigned int execution_stoped; //Verificação de envio da msg para parar processador
	union {
		   unsigned int producer_task;
		   unsigned int task_ID;
		   unsigned int app_ID;
	};

	union {
	   unsigned int consumer_task;
	   unsigned int master_ID;
	   unsigned int hops;
	};

	unsigned int source_PE;
	unsigned int timestamp;
	unsigned int transaction;

	union {
		unsigned int msg_lenght;
		unsigned int resolution;
		unsigned int priority;
		unsigned int latency_deadline;
		unsigned int pkt_latency;
		unsigned int stack_size;
		unsigned int requesting_task;
		unsigned int released_proc;
		unsigned int app_task_number;
		unsigned int app_descriptor_size;
		unsigned int allocated_processor;
		unsigned int requesting_processor;
	};

	union {
		unsigned int troughput_deadline;
		unsigned int pkt_size;
		unsigned int data_size;
	};

	union {
		unsigned int code_size;
		unsigned int max_free_procs;
	};

	union {
		unsigned int bss_size;
		unsigned int request_size;
	};

	union {
		unsigned int initial_address;
		unsigned int program_counter;
	};
	union {
	   unsigned int cluster_ID;
	};
	union {
		unsigned int energy_acc; //energia acumulada
	};
	// union {
	// 	unsigned int execution_stoped; //Verificação de envio da msg para parar processador
	// 	unsigned int proc;
	// };
	//Add new variables here ...

} ServiceHeader;


typedef struct {

	ServiceHeader service_header;
	unsigned int status;

}ServiceHeaderSlot;

ServiceHeaderSlot sh_slot1, sh_slot2;


ServiceHeader* get_service_header_slot() {

	if ( sh_slot1.status ) {

		sh_slot1.status = 0;
		sh_slot2.status = 1;
		return &sh_slot1.service_header;

	} else {

		sh_slot2.status = 0;
		sh_slot1.status = 1;
		return &sh_slot2.service_header;
	}
}

void init_service_header_slots(){
	sh_slot1.status = 1;
	sh_slot2.status = 1;
}


void DMA_read_data(unsigned int initial_address, unsigned int dma_msg_size){

	MemoryWrite(DMA_SIZE, dma_msg_size);
	MemoryWrite(DMA_OP, WRITE);
	MemoryWrite(DMA_ADDRESS, initial_address);
	MemoryWrite(DMA_START, 1);
	while (MemoryRead(DMA_RECEIVE_ACTIVE));
}

void DMA_send_data(unsigned int initial_address, unsigned int dma_msg_size){

	while (MemoryRead(DMA_SEND_ACTIVE));

	MemoryWrite(DMA_SIZE, dma_msg_size);
	MemoryWrite(DMA_OP, READ);
	MemoryWrite(DMA_ADDRESS, initial_address);
	MemoryWrite(DMA_START, 1);
}



void send_packet(ServiceHeader *p, unsigned int initial_address, unsigned int dma_msg_size){

	p->payload_size = (CONSTANT_PKT_SIZE - 2) + dma_msg_size;

	p->transaction = 0;

	p->source_PE = MemoryRead(NI_CONFIG);

	while (MemoryRead(DMA_SEND_ACTIVE));

	p->timestamp = MemoryRead(TICK_COUNTER);

	MemoryWrite(DMA_SIZE, CONSTANT_PKT_SIZE);
	MemoryWrite(DMA_ADDRESS, (unsigned int) p);

	if (dma_msg_size > 0){

		MemoryWrite(DMA_SIZE_2, dma_msg_size);
		MemoryWrite(DMA_ADDRESS_2, initial_address);
	}

	MemoryWrite(DMA_OP, READ);
	MemoryWrite(DMA_START, 1);

}

void read_packet(ServiceHeader *p){

	MemoryWrite(DMA_SIZE, CONSTANT_PKT_SIZE);
	MemoryWrite(DMA_OP, WRITE);
	MemoryWrite(DMA_ADDRESS, (unsigned int) p);
	MemoryWrite(DMA_START, 1);
	while (MemoryRead(DMA_RECEIVE_ACTIVE));
}



#endif /* SOFTWARE_INCLUDE_PACKET_H_ */
