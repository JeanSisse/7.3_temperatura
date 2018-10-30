//------------------------------------------------------------------------------------------------
//
//  DISTRIBUTED HEMPS -  5.0
//
//  Research group: GAPH-PUCRS    -    contact   fernando.moraes@pucrs.br
//	
//  AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
//
//  COPYRIGHT: Software placed into the public domain by the author.
//    	       Software 'as is' without warranty.  Author liable for nothing.
//
//  Distribution:  September 2013
//
//  Source name:  plasma.h
//
//  Brief description: Plasma Hardware Defines
//------------------------------------------------------------------------------------------------

#ifndef __PLASMA_H__
#define __PLASMA_H__

/*********** Hardware addresses ***********/
#define UART_WRITE        	0x20000000
#define UART_READ         	0x20000000
#define IRQ_MASK          	0x20000010
#define IRQ_STATUS        	0x20000020
#define TIME_SLICE       	0x20000060
#define SYS_CALL		   	0x20000070
#define END_SIM 		   	0x20000080
#define CLOCK_HOLD 		   	0x20000090

/* Network Interface*/
#define	NI_STATUS_RECV		0x20000100
#define	NI_STATUS_SEND		0x20000110
#define	NI_RECV				0x20000120
#define	NI_SEND				0x20000130
#define	NI_CONFIG			0x20000140
#define	NI_ACK				0x20000150
#define	NI_NACK				0x20000160
#define	NI_END				0x20000170
#define	CURRENT_PAGE		0x20000180
#define NEXT_PAGE			0x20000190

/* DMA*/
#define DMA_SIZE_2 			0x20000205
#define DMA_ADDRESS_2 		0x20000215
#define DMA_SIZE		  	0x20000200
#define DMA_ADDRESS		  	0x20000210
#define DMA_OP			  	0x20000220
#define DMA_START		  	0x20000230
#define DMA_ACK			  	0x20000240
#define DMA_SEND_ACTIVE	  	0x20000250
#define DMA_RECEIVE_ACTIVE	0x20000260

//Scheduling report
#define SCHEDULING_REPORT	0x20000270
#define INTERRUPTION		0x10000
//#define SYSCALL			0x20000
#define SCHEDULER			0x40000
#define IDLE				0x80000


/* DMA operations */
#define READ	0
#define WRITE	1

#define TICK_COUNTER	  	0x20000300
#define TOTAL_FLITS_ROUTER 	0x20000310
#define CURRENT_TASK	  	0x20000400

#define REQ_APP		  		0x20000350
#define ACK_APP		  		0x20000360

//Kernel pending service FIFO
#define PENDING_SERVICE_INTR	0x20000400

/*********** Interrupt bits **************/
#define IRQ_PENDING_SERVICE			0x01 //bit 0
#define IRQ_SCHEDULER				0x08 //bit 3
#define IRQ_NOC					 	0x20 //bit 5
         
/*Memory Access*/
#define MemoryRead(A) (*(volatile unsigned int*)(A))		//única função que lê as variavéis passadas na sua chamada
#define MemoryWrite(A,V) *(volatile unsigned int*)(A)=(V)	//única função que escreve nas variavéis passadas na sua chamada

unsigned int get_net_address(){
	//NoC address adaptations must be implemented here
	return MemoryRead(NI_CONFIG);
}

#endif /*__PLASMA_H__*/
