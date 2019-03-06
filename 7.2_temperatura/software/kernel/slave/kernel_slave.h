//------------------------------------------------------------------------------------------------
//
//  DISTRIBUTED HEMPS -  5.0
//
//  Research group: GAPH-PUCRS    -    contact   fernando.moraes@pucrs.br
//
//  Distribution:  September 2013
//
//  Source name:  kernel_slave.h
//
//  Brief description:  Microkernel for Plasma processor
//
//------------------------------------------------------------------------------------------------

#ifndef __KERNEL_H__
#define __KERNEL_H__

/**
 * \ingroup slave_kernel_group
 * @{

	 \todo  Kernel_master Doc is incomplete because not all functions are defined in the .h.
	 Please list all function headers defined in kernel_slave.c into this file
	 so it can included into the Doc
 */

#define MSG_SIZE 128
/*---------------------------------------------------------------------------------
 * INCLUDE
 * -------------------------------------------------------------------------------*/
#include "../../include/stdlib.h"
#include "../../include/services.h"
#include "../../include/plasma.h"
#include "../../include/communication.h"
#include "../../include/packet.h"
#include "../../include/pending_services.h"

/*--------------------------------------------------------------------------------
 * TASKS STATUS
 * -------------------------------------------------------------------------------*/
#define READY       	1
#define WAITING     	2
#define TERMINATED  	3
#define RUNNING     	4
#define FREE        	5
#define ALLOCATING  	6
#define MIGRATING		  7
#define NOT_ALLOCATED  -1
#define REQUESTED		-2


/*
 * ENABLE MODULES
 */
#define MIGRATION_ENABLED	0
#define SCHEDULING_REPORT_ENABLED	1

/*--------------------------------------------------------------------------------
 * TASKS STATUS MASK
 * -------------------------------------------------------------------------------*/
#define MIGRATED		0x1

#define MAX_TIME_SLICE	16318

/*--------------------------------------------------------------------
 * struct TCB
 *
 * DESCRIPTION:
 *    Task control block.
 *--------------------------------------------------------------------*/

/*! \brief A struct type definition .

    Details.
*/
typedef struct {
    unsigned int reg[30];       /*30 registers (Vn,An,Tn,Sn,RA)*/
    unsigned int pc;            	/*program counter*/
    unsigned int offset;        	/*initial address of the code*/
    int       id;            		/*identifier*/
    unsigned int status;        	/*status (READY, WAITING, TERMINATED, RUNNING, FREE, ALLOCATING)*/
	  unsigned int text_lenght;   	/*Memory TEXT section lenght in bytes*/
    unsigned int data_lenght;		/*Memory DATA section lenght in bytes*/
    unsigned int bss_lenght;		/*Memory BSS section lenght in bytes*/
    unsigned int proc_to_migrate;	/*Processor to migrate the task*/
    unsigned int master_address;
    unsigned int reimaning_time_slice;

} TCB;

#define get_location(x) task_location[x >> 8][x & 0xFF]

extern unsigned int ASM_SetInterruptEnable(unsigned int);
extern void ASM_SaveRemainingContext(TCB*);
extern void ASM_RunScheduledTask(TCB*);

/*! \brief A function definition .

    Details.
*/
void OS_InterruptServiceRoutine(unsigned int);
/* ISR*/
unsigned int OS_InterruptMaskSet(unsigned int);
unsigned int OS_InterruptMaskClear(unsigned int);

/* Init*/
void OS_Init();
void OS_Idle();

/* Scheduler*/
void Scheduler();

/**@}*/

#endif
