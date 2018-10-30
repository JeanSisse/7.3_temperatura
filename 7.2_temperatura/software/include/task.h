//------------------------------------------------------------------------------------------------
//
//  DISTRIBUTED HEMPS -  5.0
//
//  Research group: GAPH-PUCRS    -    contact   fernando.moraes@pucrs.br
//
//  Distribution:  September 2013
//
//  Source name:  task.h
//
//  Brief description: Task definitions
//
//------------------------------------------------------------------------------------------------

#ifndef __TASK_H__
#define __TASK_H__

/* Syscalls*/
#define EXIT      			0
#define WRITEPIPE 			1
#define READPIPE  			2
#define GETTICK   			3
#define ECHO      			4

#define MemoryWrite(A,V) *(volatile unsigned int*)(A)=(V)
#define TRUE	1
#define FALSE	0

extern int SystemCall();

#define Send(msg, target) while(!SystemCall(WRITEPIPE, (unsigned int*)msg, target,0))
#define Receive(msg, source) while(!SystemCall(READPIPE, (unsigned int*)msg, source,0))
#define GetTick() SystemCall(GETTICK,0,0,0)
#define Echo(str) SystemCall(ECHO, (char*)str,0,0)
#define exit() while(!SystemCall(EXIT, 0, 0, 0))

/*---------Aplication loop controls -------------------*/

#define MPEG_FRAMES				20
#define SYNTHETIC_ITERATIONS	200
#define NUM_PATTERNS			40//40

/*--------------------------------------------------------------------
 * struct Message
 *
 * DESCRIPTION:
 *    Used to handle messages inside the task.
 *    This is not the same structure used in the kernels.
 *
 *--------------------------------------------------------------------*/
#define MSG_SIZE 128

typedef struct {
	int length;
	int msg[MSG_SIZE];
} Message;

#endif /*__TASK_H__*/

