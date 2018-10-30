//------------------------------------------------------------------------------------------------
//
//  DISTRIBUTED HEMPS -  5.0
//
//  Research group: GAPH-PUCRS    -    contact   fernando.moraes@pucrs.br
//
//  Distribution:  September 2013
//
//  Source name:  HeMPS.h
//
//  Brief description: Tasks definitions.
//
//------------------------------------------------------------------------------------------------

#ifndef __TASK_H__
#define __TASK_H__

/**   
 * \ingroup app_api_group
 * @{
	 
 
 */


// Syscalls
#define EXIT      			0
#define WRITEPIPE 			1
#define READPIPE  			2
#define GETTICK   			3
#define ECHO      			4


extern int SystemCall();	/* Defined in bootTask.asm */

/*! \brief A function definition .

    Details.
*/
#define Send(msg, target) while(!SystemCall(WRITEPIPE, (unsigned int*)msg, target))

/*! \brief A function definition .
    
    Details.
*/
#define Receive(msg, source) while(!SystemCall(READPIPE, (unsigned int*)msg, source))

/*! \brief A function definition .
    
    Details.
*/
#define GetTick() SystemCall(GETTICK)

/*! \brief A function definition .
    
    Details.
*/
#define Echo(str) SystemCall(ECHO, (char*)str)


/*--------------------------------------------------------------------
 * struct Message
 *
 * DESCRIPTION:
 *    Used to handle messages inside the task.
 *    This is not the same structure used in the kernels.
 *
 *--------------------------------------------------------------------*/
/*! \brief A function definition .
    
    Details.
*/
#define MSG_SIZE 128

/*! \brief A function definition .
    
    Details.
*/
typedef struct {
	int length;
	int msg[MSG_SIZE];
} Message;

/**@}*/

#endif //__TASK_H__
