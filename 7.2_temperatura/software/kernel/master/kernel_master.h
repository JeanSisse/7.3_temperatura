//------------------------------------------------------------------------------------------------
//
//  DISTRIBUTED HEMPS -  5.0
//
//  Research group: GAPH-PUCRS    -    contact   fernando.moraes@pucrs.br
//
//  Distribution:  September 2013
//
//  Source name:  kernel_master.h
//
//  Brief description:  Microkernel for Plasma processors
//
//------------------------------------------------------------------------------------------------

#ifndef __KERNEL_H__
#define __KERNEL_H__

/**
 * \ingroup master_kernel_group
 * @{

	 \todo  Kernel_master Doc is incomplete because not all functions are defined in the .h.
	 Please list all function headers defined in kernel_master.c into this file
	 so it can included into the Doc

 */

/**
     \todo functions puts and putsv are defined twice in kernel_slave and kernel_master.
*/

/*--------------------------------------------------------------------------------
 * PROC STATUS
 * -------------------------------------------------------------------------------*/
#define RUNNING       	1

/*--------------------------------------------------------------------------------
 * APPLICATION INFORMATION
 * -------------------------------------------------------------------------------*/
/*! \brief A struct type definition .

    Details.
*/
typedef struct {
	int cluster_proc;
	int temperatura;
}cluster_temperature;


typedef struct {
	int task;    /**< Detailed description after the member */
	int flits;   /**< Detailed description after the member */
} DependencePackage;

/*! \brief A struct type definition .

    Details.
*/
typedef struct {
	int  id;                 /**< Detailed description after the member */
	int  code_size;
	int  data_size;
	int  bss_size;
	int  initial_address;
	int  proc;
	int  load;
	//int  static_position;
	int  dependences_number;
	DependencePackage dependences[10];
} TaskPackage;

/*! \brief A struct type definition .

    Details.
*/
typedef struct {
	int task_ID;
	int requesting_task;
	int pending_loan_delivery;
	int min_loan_proc_hops;
	int current_borrowed_proc;
	int current_borrowed_master;
	int neighbors_level;
	int cancel_reclustering;
} Reclustering;

/*! \brief A struct type definition .

    Details.
*/
typedef struct {
	int task_ID;
	int requesting_task;
} ReclusteringTasks;

/*! \brief A struct type definition .

    Details.
*/
typedef struct {
   int size;
   TaskPackage tasks[MAX_APP_SIZE];
} ApplicationPackage;


#define MAX_RECLUSTERING MAX_APP_SIZE-1  /**< Detailed description after the member */
#define NOT_ALLOCATED			-1
#define EMPTY							-1
#define TERMINATED				-2
#define MAX_INITIAL_TASKS	10

#define DELTA_T						10000000		//1 grau
#define T_MAX						1005000000	//105 grau
#define T_SAFE						1000000000	//100 grau

/*! \brief A def definition .

    Details.
*/
#define get_location(x) (task_location[x >> 8][x & 0xFF])
#define get_cluster_proc(x)		(cluster_info[x].master_x << 8 | cluster_info[x].master_y)

/* Indicates an incoming service */
#define noc_interruption (MemoryRead(IRQ_STATUS) & IRQ_NOC)
#define	app_req_reg (MemoryRead(REQ_APP) & 0x80000000)
#define	external_app_reg (MemoryRead(REQ_APP) & 0x7fffffff)


/*! \brief A function definition .
    \param taskID to be completed...
    \param requesting_task to be completed...
    \param selected_proc to be completed...

    Details.
*/
void allocate_new_task(int taskID, int requesting_task, int selected_proc);

/*! \brief A function definition .

    Details.
*/
void send_task_allocated(int requesting_task, int requested_task, int allocated_processor);
void reserve_cluster_resources(int cluster_index, int num_app_task);
void putsv(const char *string, int v);
void send_new_task(int task_ID, int master_ID, int mapped_proc, unsigned int initial_address, int code_size, int data_size, int bss_size);
void initialize_slaves();
void compara_temp_procs();

/**@}*/

#endif
