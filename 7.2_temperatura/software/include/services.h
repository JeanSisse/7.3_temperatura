//------------------------------------------------------------------------------------------------
//
//  DISTRIBUTED HEMPS -  5.0
//
//  Research group: GAPH-PUCRS    -    contact   fernando.moraes@pucrs.br
//
//  Distribution:  September 2013
//
//  Source name:  services.h
//
//  Brief description: Kernel services
//
//------------------------------------------------------------------------------------------------

#ifndef __SERVICES_H__
#define __SERVICES_H__

#define 	MESSAGE_REQUEST					      0x00000010
#define 	MESSAGE_DELIVERY				      0x00000020
#define 	TASK_ALLOCATION     			    0x00000040
#define 	TASK_ALLOCATED     				    0x00000050
#define 	TASK_REQUEST        			    0x00000060
#define 	TASK_TERMINATED     			    0x00000070
#define 	LOAN_PROCESSOR_RELEASE			  0x00000090
#define 	DEBUG_MESSAGE  					      0x00000100
#define 	NEW_TASK						          0x00000130
#define	 	APP_TERMINATED					      0x00000140
#define		NEW_APP							          0x00000150
#define		INITIALIZE_CLUSTER				    0x00000160
#define		INITIALIZE_SLAVE				      0x00000170
#define		TASK_TERMINATED_OTHER_CLUSTER	0x00000180
#define		LOAN_PROCESSOR_REQUEST			  0x00000190
#define 	LOAN_PROCESSOR_DELIVERY			  0x00000200
#define 	TASK_MIGRATION					      0x00000210
#define 	MIGRATION_CODE					      0x00000220
#define 	MIGRATION_TCB					        0x00000221
#define 	MIGRATION_TASK_LOCATION			  0x00000222
#define 	MIGRATION_MSG_REQUEST			    0x00000223
#define 	MIGRATION_STACK					      0x00000224
#define 	MIGRATION_DATA_BSS				    0x00000225
#define 	UPDATE_TASK_LOCATION			    0x00000230
#define 	TASK_MIGRATED					        0x00000235
#define 	ENERGY_SLAVE					        0x00000240
#define 	ENERGY_CLUSTER					      0x00000250
#define 	STOP_EXECUTION					      0x00000251

#endif
