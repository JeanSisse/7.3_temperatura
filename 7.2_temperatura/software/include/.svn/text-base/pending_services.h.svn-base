/*
 * pending_services.h
 *
 *  Created on: Jun 15, 2015
 *      Author: mruaro
 */

#ifndef PENDING_SERVICES_H_
#define PENDING_SERVICES_H_

#define PENDING_SERVICE_TAM		20

ServiceHeader pending_services_FIFO[PENDING_SERVICE_TAM];

unsigned int pending_service_first = 0;
unsigned int pending_service_last = 0;

unsigned char add_fifo = 0; // 1 - last operation was add. 0 - Last operation was remove


unsigned char add_pending_service(ServiceHeader * pending_service){

	ServiceHeader * fifo_free_position;

	//Test if the buffer is full
	if (pending_service_first == pending_service_last && add_fifo == 1){
		puts("######## ERROR: Pending service FIFO FULL\n");
		return 0;
	}

	fifo_free_position = &pending_services_FIFO[pending_service_last];

	//equivalent to a memcopy once both are the same struct
	*fifo_free_position = *pending_service;

	if (pending_service_last == PENDING_SERVICE_TAM-1){
		pending_service_last = 0;
	} else {
		pending_service_last++;
	}

	add_fifo = 1;

	//puts("Interruption set ON\n");
	MemoryWrite(PENDING_SERVICE_INTR, 1);

	return 1;
}

ServiceHeader * get_next_pending_service(){

	ServiceHeader *service_header_to_ret;

	//Test if the buffer is empty
	if (pending_service_first == pending_service_last && add_fifo == 0){
		return 0;
	}

	service_header_to_ret = &pending_services_FIFO[pending_service_first];

	if (pending_service_first == PENDING_SERVICE_TAM-1){
		pending_service_first = 0;
	} else {
		pending_service_first++;
	}

	add_fifo = 0;

	//Test if the buffer is empty
	if (pending_service_first == pending_service_last){
		//puts("Interruption set OFF\n");
		MemoryWrite(PENDING_SERVICE_INTR, 0);
	}

	return service_header_to_ret;
}



#endif /* PENDING_SERVICES_H_ */
