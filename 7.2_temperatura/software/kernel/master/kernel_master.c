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

#include "kernel_master.h"
#include "../../include/services.h"
#include "../../include/packet.h"
#include "../../include/plasma.h"
#include "../../include/stdlib.h"
#include "../../include/new_task.h"
#include "../../include/task_request.h"
#include "../../include/mapping.h"
#include "../../include/temperature.h"
#include <time.h>
/*--------------------------------------------------------------------
 * GLOBALS
 *--------------------------------------------------------------------*/
unsigned int net_address;
unsigned char is_global_master;
unsigned char global_master_address;
int running_task[APP_NUMBER];
int terminated_app_count = 0;
int max_neighbors_level = 0;

int threshold_top = 75;  // 80 %
int threshold_down = 20; // 20 %
int threshold_top_flag = 0;  
int threshold_down_flag = 0;
int aux_threshold = 0; // 20 %

unsigned int counter_ticks = 500000;
unsigned int counter_ticks2 = 700000;

int	count_receive_power = 0;

//cluster_temperature *temp;


#ifndef WithoutLoad
RegionPackage region;
#endif

Reclustering reclustering;

void puts(char *string) {

	int *str_part;
	for(str_part = (int*)string,  MemoryWrite(UART_WRITE,*str_part);
		!(((char*)str_part)[0] == 0 || ((char*)str_part)[1] == 0 || ((char*)str_part)[2] == 0 || ((char*)str_part)[3] == 0);
		*str_part++,MemoryWrite(UART_WRITE, *str_part));
}


void putsv(const char *string, int v){
	puts(string);
	puts(itoa(v));
	puts("\n");
}


int search_cluster_ID(int x, int y){

	for (int i=0; i<CLUSTER_NUMBER; i++){
		if (cluster_info[i].master_x == x && cluster_info[i].master_y == y){
			return i;
		}
	}
	puts("ERRO - cluster nao encontrado\n");
	return -1;
}

void page_released(int proc) {

	int proc_x, proc_y;

	proc_x = proc >> 8;
	proc_y = proc & 0xFF;

	/* 
 	* Se for simulação com profiler não libera o processador
 	* Pois o calculo do load e flits do arquivo.cfg necessita que o processador tenha executado apenas uma tarefa
 	*/
	#ifndef WithProfiler
		proc_free_pages[proc_x][proc_y]++;
	#endif

	if (proc_x >= cluster_xi && proc_x <= cluster_xf && proc_y >= cluster_yi && proc_y <= cluster_yf){

	   proc_available++;
	}

}


void page_used(int proc) {

	int proc_x, proc_y;

	proc_x = proc >> 8;
	proc_y = proc & 0xFF;

	proc_free_pages[proc_x][proc_y]--;

	if (proc_x >= cluster_xi && proc_x <= cluster_xf && proc_y >= cluster_yi && proc_y <= cluster_yf){

	   proc_available--;

	}
}


void insert_task_loc(int application, int task, int proc) {

	task_location[application][task] = proc;

	applications[application].tasks[task].proc = proc; 
	proc_load_total[proc >> 8][proc & 0xFF] = proc_load_total[proc >> 8][proc & 0xFF] + applications[application].tasks[task].load;

}

int search_physical_master_address(int proc){

	ClusterInfo *cf;
	int proc_x, proc_y;

	proc_x = proc >> 8;
	proc_y = proc & 0xFF;

	for(int i=0; i<CLUSTER_NUMBER; i++){
		cf = &cluster_info[i];

		if (cf->leftbottom_x <= proc_x && cf->topright_x >= proc_x && cf->leftbottom_y <= proc_y && cf->topright_y >= proc_y){
			return get_cluster_proc(i);
		}
	}

	return -1;
}

void allocate_initial_task(unsigned int *initial_tasks){

	int task_ID;
	int proc;

	for (int i=0; i<MAX_INITIAL_TASKS; i++){

		task_ID = initial_tasks[i];

		if (task_ID != EMPTY){

			#if defined(WithoutLoad) || defined(WithProfiler)

				proc = InitialMapping( (task_ID >> 8), (task_ID & 0xFF));

			#else

				if(i==0) {

					region = InitialMapping( (task_ID >> 8), (task_ID & 0xFF));
					proc = region.center;

				} else{
					if (region.center == -1){
						region = InitialMapping( (task_ID >> 8), (task_ID & 0xFF));
						proc = region.center;
					} else {
						proc = InitialMapping2(region);
					}

				}
			#endif

			allocate_new_task(task_ID, -1, proc);
		}
	}
}

void send_loan_proc_request(int address, int taskID){

	ServiceHeader *p = get_service_header_slot();

	p->header = address;

	p->service = LOAN_PROCESSOR_REQUEST;

	p->task_ID = taskID;

	p->allocated_processor = net_address;
	//p->allocated_processor = get_location(taskID);

	send_packet(p, 0, 0);

}


void send_task_migration(int task_ID, int new_proc){

	ServiceHeader *p = get_service_header_slot();

	p->header = get_location(task_ID);

	p->service = TASK_MIGRATION;

	p->task_ID = task_ID;

	p->allocated_processor = new_proc;

	send_packet(p, 0, 0);

	page_used(new_proc);
}

void send_energy_cluster(){

	//puts("send_energy_cluster ");puts(itoa(energyLocalClusterAcc));puts(" ");puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");
	
	ServiceHeader *p = get_service_header_slot();

	p->header = global_master_address; //para onde estou enviando

	p->service = ENERGY_CLUSTER;

	p->energy_acc = energyLocalClusterAcc;
	
	p->cluster_ID = clusterID;
	
	send_packet(p, 0, 0); // send_packet(p, initial_address, dma_msg_size)

	energyLocalClusterAcc = 0;
}


void fires_reclustering_protocol(){

	//neighbors_level significa o nivel de quadrado envolvente, que comeca em 1.

	int other_x, other_y;
	int this_x, this_y;
	int hops_x, hops_y;
	int cluster_x_size, initial_x_level;
	int cluster_y_size, initial_y_level;
	int other_address;

	reclustering.pending_loan_delivery = 0;
	reclustering.current_borrowed_proc = -1;
	reclustering.current_borrowed_master = -1;
	reclustering.min_loan_proc_hops = 0xFFFFFF;

	cluster_x_size = cluster_xf - cluster_xi + 1; //+ 1 para calcular o numero de processadores do eixo x e nao o numero de hops
	cluster_y_size = cluster_yf - cluster_yi + 1;

	initial_x_level = cluster_x_size * (reclustering.neighbors_level -1);
	initial_y_level = cluster_y_size * (reclustering.neighbors_level -1);

	cluster_x_size *= reclustering.neighbors_level;
	cluster_y_size *= reclustering.neighbors_level;

	this_x = cluster_info[clusterID].master_x;
	this_y = cluster_info[clusterID].master_y;

	for(int i=0; i<CLUSTER_NUMBER; i++) {

		other_x = cluster_info[i].master_x;
		other_y = cluster_info[i].master_y;

		if (clusterID == i){
			continue;
		}

		hops_x = abs(this_x - other_x);
		hops_y = abs(this_y - other_y);

		if ( (hops_x > initial_x_level || hops_y > initial_y_level) &&
				hops_x <= cluster_x_size && hops_y <= cluster_y_size) {

			other_address = (other_x << 8) | other_y;

			send_loan_proc_request(other_address, reclustering.task_ID);

			reclustering.pending_loan_delivery++;
		}
	}
}

void reclustering_task(int taskID, int requesting_task){

	reclustering.task_ID = taskID;

	reclustering.requesting_task = requesting_task;

	reclustering.neighbors_level = 1;

	reclustering.cancel_reclustering = 0;

	fires_reclustering_protocol();

}

void allocate_new_task(int taskID, int requesting_task, int selected_proc){

	TaskPackage *tp;
	NewTask nt;

	if (selected_proc == -1){

		if (proc_available <= 0){


			if (reclustering.task_ID != -1){
				add_task_request(taskID, requesting_task);
			} else {
				reclustering_task(taskID, requesting_task);
			}

			return;

		} else {

			selected_proc = MapTask(taskID >> 8, taskID & 0xFF);

			if (selected_proc == -1){
				puts("ERROR - MapTask return -1\n");
				for(;;);
			}
		}

	}

	if (selected_proc < 1 || taskID == -1)
		puts("ERROR - invalid variables into allocate new task\n");

	tp = &applications[taskID >> 8].tasks[taskID & 0xFF];

	if (is_global_master){

		nt.allocated_processor = selected_proc;
		nt.bss_size = tp->bss_size;
		nt.code_size = tp->code_size;
		nt.data_size = tp->data_size;
		nt.initial_address = tp->initial_address;
		nt.master_ID = net_address;
		nt.task_ID = taskID;

		add_new_task(&nt);
		
		cluster_info[clusterID].free_resources -= 1;
		puts("clusterinfo_handle2 ");puts(itoa(cluster_info[clusterID].free_resources)); puts("\n");

		energyClustersAcc[clusterID]  = energyClustersAcc[clusterID] + energyLocalClusterAcc;
		energyLocalClusterAcc = 0;
		
		//puts("energyClustersAcc ");puts(itoa(clusterID)); puts(" ");
		//puts(itoa(energyClustersAcc[clusterID])); puts("\n");
		
		//send_task_allocation(taskID, net_address, selected_proc, tp->initial_address, tp->code_size, tp->data_size, tp->bss_size);

	} else {

		send_new_task(taskID, net_address, selected_proc, tp->initial_address, tp->code_size, tp->data_size, tp->bss_size);

	}

	page_used(selected_proc);

	insert_task_loc(taskID >> 8, taskID & 0xFF, selected_proc);

	//No caso das initial task nao ha requesting task
	if (requesting_task != -1){

		send_task_allocated(requesting_task, taskID, selected_proc);

	}
}

//######################################################################################

void update_clusters_load(int clusterID_selected, int app_ID, const unsigned int *ref_address, unsigned int app_descriptor_size){
	
	
	unsigned int initial_tasks[MAX_INITIAL_TASKS];
	TaskPackage *tp;
	volatile unsigned int task_ID;

	//Cuidado com app_descriptor_size muito grande, pode estourar a memoria
	unsigned int app_descriptor[app_descriptor_size];
	
	applications[app_ID].size = *(ref_address++);


	for(int k=0; k < MAX_INITIAL_TASKS; k++){
		initial_tasks[k] = (app_ID << 8) | *(ref_address++);
	}

	for(int k=0; k < applications[app_ID].size; k++){

		task_ID = *(ref_address++);
		task_ID = task_ID & (unsigned int) 0xFF;

		tp = &applications[app_ID].tasks[task_ID];

		tp->code_size = *(ref_address++);
		tp->data_size = *(ref_address++);
		tp->bss_size = *(ref_address++);
		tp->initial_address = *(ref_address++);
		tp->proc = -1;
		tp->dependences_number = 0;
		tp->load = *(ref_address++);
		clusters_load[clusterID_selected] = clusters_load[clusterID_selected] + tp->load;
		
		
	//	puts("clusters_load ");puts(itoa(clusterID_selected)); puts(" ");
	//	puts(itoa(clusters_load[clusterID_selected])); puts(" ");
	//	puts(itoa(tp->load)); puts("\n");
		
		for(int j=0; j < MAX_INITIAL_TASKS; j++){

			tp->dependences[j].task = (app_ID << 8) | *(ref_address++);
			tp->dependences[j].flits = *(ref_address++);

			if(tp->dependences[j].task != EMPTY) {
				tp->dependences_number++;
			}
		}		
		
		
	}
}



void handle_new_app(int app_ID, const unsigned int *ref_address, unsigned int app_descriptor_size){

	unsigned int initial_tasks[MAX_INITIAL_TASKS];
	TaskPackage *tp;
	volatile unsigned int task_ID;
	
	//Cuidado com app_descriptor_size muito grande, pode estourar a memoria
	unsigned int app_descriptor[app_descriptor_size];

	if (!is_global_master){

		DMA_read_data( (unsigned int) app_descriptor, app_descriptor_size);

		ref_address = app_descriptor;
	}

	applications[app_ID].size = *(ref_address++);

	running_task[app_ID] = applications[app_ID].size;

	//reserve_cluster_resources(clusterID, applications[app_ID].size);

	for(int k=0; k < MAX_INITIAL_TASKS; k++){
		initial_tasks[k] = (app_ID << 8) | *(ref_address++);
	}

	for(int k=0; k < applications[app_ID].size; k++){

		 //O uso de (task_ID) volatile remove um erro quando se realiza o AND de 0xFF na variavel task_ID
		task_ID = *(ref_address++);
		task_ID = task_ID & (unsigned int) 0xFF;

		tp = &applications[app_ID].tasks[task_ID];

		tp->code_size = *(ref_address++);
		tp->data_size = *(ref_address++);
		tp->bss_size = *(ref_address++);
		tp->initial_address = *(ref_address++);
		tp->proc = -1;
		tp->dependences_number = 0;
		tp->load = *(ref_address++);
		clusters_load[clusterID] = clusters_load[clusterID] + tp->load;


		//tp->static_position = *(ref_address++);

		for(int j=0; j < MAX_INITIAL_TASKS; j++){

			tp->dependences[j].task = (app_ID << 8) | *(ref_address++);
			tp->dependences[j].flits = *(ref_address++);

			if(tp->dependences[j].task != EMPTY) {
				tp->dependences_number++;
			}
		}
	}

	puts("clusters_load["); puts(itoa(clusterID));puts("]: "); puts(itoa(clusters_load[clusterID])); puts("\n");


	allocate_initial_task(initial_tasks);
}

void reserve_cluster_resources(int cluster_index, int num_app_task){

	if (cluster_info[cluster_index].free_resources < num_app_task){

		cluster_info[cluster_index].free_resources = 0;

	} else {

		cluster_info[cluster_index].free_resources -= num_app_task;
		puts("clusterinfo_reserve ");puts(itoa(cluster_info[cluster_index].free_resources)); puts("\n");

	}

}


int handle_app_request(){

	unsigned int * initial_address, * load_address;
	unsigned int app_ID, num_app_tasks, app_descriptor_size, selected_cluster_proc;
	int selected_cluster;
	ServiceHeader *p;



	app_ID = external_app_reg;

	initial_address = (unsigned int *) (0x10000000 + (appstype[app_ID] * APP_REPO_SIZE * 4));

	num_app_tasks = *initial_address;

	app_descriptor_size = 11 + (26 * num_app_tasks);

	selected_cluster = SearchCluster(num_app_tasks);

	if (selected_cluster == -1){
		return 0;
	}


	if(threshold_top_flag == 0 && threshold_down_flag == 0) { // 0 % occupation

		aux_threshold = 100-((total_mpsoc_resources - num_app_tasks)*100)/((int)MAX_GLOBAL_TASKS);
			//puts("total_mpsoc_resources: "); puts(itoa(total_mpsoc_resources)); puts("\t");
			//puts("num_app_tasks: "); puts(itoa(num_app_tasks)); puts("\t");
			//puts("threshold_down_flag: "); puts(itoa(threshold_down_flag)); puts("\t");
			//puts("threshold_top_flag: "); puts(itoa(threshold_top_flag)); puts("\t");
			//puts("aux_threshold1: "); puts(itoa(aux_threshold)); puts("\n");

		if(aux_threshold >= threshold_down){
			threshold_down_flag = 1;
			//puts("threshold_down_flag2: "); puts(itoa(threshold_down_flag)); puts("\t");

		}
		if(aux_threshold >= threshold_top){
			threshold_top_flag = 1;
			//puts("threshold_top_flag2: "); puts(itoa(threshold_top_flag)); puts("\t");

		}
	}
	else if(threshold_top_flag == 1){ // no allocation, threshold top

			aux_threshold = 100-(total_mpsoc_resources*100) / ((int)MAX_GLOBAL_TASKS);
			
			//puts("total_mpsoc_resources: "); puts(itoa(total_mpsoc_resources)); puts("\t");
			//puts("num_app_tasks: "); puts(itoa(num_app_tasks)); puts("\t");
			//puts("threshold_down_flag: "); puts(itoa(threshold_down_flag)); puts("\t");
			//puts("threshold_top_flag: "); puts(itoa(threshold_top_flag)); puts("\t");
			//puts("aux_threshold: "); puts(itoa(aux_threshold)); puts("\n");		
			if(aux_threshold <= threshold_down){
				aux_threshold = 100-((total_mpsoc_resources - num_app_tasks)*100)/((int)MAX_GLOBAL_TASKS);
				
				if(aux_threshold >= threshold_down){
					threshold_down_flag = 1;
				}
				else{
					threshold_down_flag = 0;
				}

				if(aux_threshold >= threshold_top){
					threshold_top_flag = 1;
				}
				else{
					threshold_top_flag = 0;
				}	
			}

			else{
				return 0;
			}
		}

	else{ // allocation, threshold down
		
		aux_threshold = 100-((total_mpsoc_resources - num_app_tasks)*100)/((int)MAX_GLOBAL_TASKS);
		//puts("total_mpsoc_resources: "); puts(itoa(total_mpsoc_resources)); puts("\t");
		//puts("num_app_tasks: "); puts(itoa(num_app_tasks)); puts("\t");
		//puts("threshold_down_flag: "); puts(itoa(threshold_down_flag)); puts("\t");
		//puts("threshold_top_flag: "); puts(itoa(threshold_top_flag)); puts("\t");
		//puts("aux_threshold3: "); puts(itoa(aux_threshold)); puts("\n");	
									
		if(aux_threshold >= threshold_top){
			threshold_top_flag = 1;
		}						
	}



	total_mpsoc_resources -= num_app_tasks;
	
	puts("total_mpsoc_resources ");puts(itoa(total_mpsoc_resources)); puts("\n");

	selected_cluster_proc = get_cluster_proc(selected_cluster);

	puts("selected_cluster_proc ");puts(itoa(selected_cluster)); puts("\n");
	puts("energyClustersAcc[0] ");puts(itoa(energyClustersAcc[0])); puts(" ");puts(itoa(cluster_info[0].free_resources)); puts("\n");
	puts("energyClustersAcc[1] ");puts(itoa(energyClustersAcc[1])); puts(" ");puts(itoa(cluster_info[1].free_resources)); puts("\n");
	puts("energyClustersAcc[2] ");puts(itoa(energyClustersAcc[2])); puts(" ");puts(itoa(cluster_info[2].free_resources)); puts("\n");
	puts("energyClustersAcc[3] ");puts(itoa(energyClustersAcc[3])); puts(" ");puts(itoa(cluster_info[3].free_resources)); puts("\n");


	if (selected_cluster_proc == global_master_address){

		handle_new_app(app_ID, initial_address, app_descriptor_size);

	} else {

		//Load update
		load_address = initial_address;
		load_address += 16;
		for(int k=0; k < num_app_tasks; k++){
			//puts("load: "); puts(itoh((unsigned int)*load_address)); puts("\n");
			clusters_load[selected_cluster] = clusters_load[selected_cluster] + (unsigned int)*load_address;
			load_address += 26;
		}
		//End load update
		
		puts("clusters_load1["); puts(itoa(selected_cluster));puts("]: "); puts(itoa(clusters_load[selected_cluster])); puts("\n");


		update_clusters_load(selected_cluster, app_ID, initial_address, app_descriptor_size);
		
		p = get_service_header_slot();

		p->header = selected_cluster_proc;

		p->service = NEW_APP;

		p->app_ID = app_ID;

		p->app_descriptor_size = app_descriptor_size;

		send_packet(p, (unsigned int)initial_address, app_descriptor_size);
	}

	MemoryWrite(ACK_APP, 1);

	return 1;

}

void decrement_cluster_resources(int borrowed_cluster_id){

	int borrowed_cluster_index;

	borrowed_cluster_index = search_cluster_ID(borrowed_cluster_id >> 8, borrowed_cluster_id & 0xFF);

	cluster_info[borrowed_cluster_index].free_resources--;
	puts("clusterinfo_decrement ");puts(itoa(cluster_info[borrowed_cluster_index].free_resources)); puts("\n");

}


//#######################################################################################

void send_task_allocation(NewTask * new_t){


	ServiceHeader *p = get_service_header_slot();

	p->header = new_t->allocated_processor;

	p->service = TASK_ALLOCATION;

	p->master_ID = new_t->master_ID;

	p->task_ID = new_t->task_ID;

	p->code_size = new_t->code_size;

	p->data_size = new_t->data_size;

	p->bss_size = new_t->bss_size;

	send_packet(p, (0x10000000 | new_t->initial_address), new_t->code_size);

}


void send_app_terminated(int app_ID){

	ServiceHeader *p = get_service_header_slot();
	int app_task_number;

	p->header = global_master_address;

	p->service = APP_TERMINATED;

	p->app_ID = app_ID;

	app_task_number = applications[app_ID].size;

	p->app_task_number = app_task_number;

	p->energy_acc = energyLocalClusterAcc;
	
	p->cluster_ID = clusterID;

	send_packet(p, (unsigned int) task_terminated[app_ID], app_task_number);
	
	energyLocalClusterAcc = 0;
}

void send_task_allocated(int requesting_task, int requested_task, int allocated_processor){

	ServiceHeader *p = get_service_header_slot();

	p->header = get_location(requesting_task);

	p->service = TASK_ALLOCATED;

	p->task_ID = requested_task;

	p->allocated_processor = allocated_processor;

	send_packet(p, 0, 0);

}

void send_new_task(int task_ID, int master_ID, int mapped_proc, unsigned int initial_address, int code_size, int data_size, int bss_size) {

	ServiceHeader *p = get_service_header_slot();

	p->header = global_master_address;

	p->service = NEW_TASK;

	p->master_ID = master_ID;

	p->task_ID = task_ID;

	p->allocated_processor = mapped_proc;

	p->code_size = code_size;

	p->data_size = data_size;

	p->bss_size = bss_size;

	p->initial_address = initial_address;

	p->energy_acc = energyLocalClusterAcc;
	
	p->cluster_ID = clusterID;

	send_packet(p, 0, 0);

	energyLocalClusterAcc = 0;
}

void handle_app_terminated(unsigned int app_task_number, unsigned int app_master_addr, unsigned int *terminated_task_list){

	unsigned int task_master_addr;
	int borrowed_cluster, original_cluster;

	original_cluster = search_cluster_ID(app_master_addr >> 8, app_master_addr & 0xFF);

	for (int i=0; i<app_task_number; i++){
		task_master_addr = terminated_task_list[i];

		if (task_master_addr != app_master_addr){
			borrowed_cluster = search_cluster_ID(task_master_addr >> 8, task_master_addr & 0xFF);
			cluster_info[borrowed_cluster].free_resources++;
		} else {
			cluster_info[original_cluster].free_resources++;
		}
		
		puts("total_mpsoc_resources ");puts(itoa(total_mpsoc_resources)); puts("\n");
		total_mpsoc_resources++;
	}
	terminated_app_count++;

	if (terminated_app_count == APP_NUMBER){
		puts("FINISH ");puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");

		temperature();
		
		MemoryWrite(END_SIM,1);
	}

}

void send_loan_proc_delivery(int master_address, int taskID, int proc, int hops){

	ServiceHeader *p = get_service_header_slot();

	p->header = master_address;

	p->service = LOAN_PROCESSOR_DELIVERY;

	p->task_ID = taskID;

	p->hops = hops;

	p->allocated_processor = proc;

	send_packet(p, 0, 0);

}


void send_loan_proc_release(int master_address, int release_proc){

	ServiceHeader *p = get_service_header_slot();

	p->header = master_address;

	p->service = LOAN_PROCESSOR_RELEASE;

	p->released_proc = release_proc;

	send_packet(p, 0, 0);

}

void handle_new_task(NewTask *new_task){
	
	send_task_allocation(new_task);

	new_task->task_ID = -1;
}

void handle_task_request(TaskRequest *task_request){

	int proc = get_location(task_request->task_ID);

	if (proc == -1){

		allocate_new_task(task_request->task_ID, task_request->requesting_task, -1);

	} else if (task_request->requesting_task != -1){

		send_task_allocated(task_request->requesting_task, task_request->task_ID, proc);
	}

	task_request->task_ID = -1;
}

void handle_end_of_reclustering_round(){

	if (reclustering.cancel_reclustering){

		add_task_request(reclustering.task_ID, reclustering.requesting_task);

		reclustering.task_ID = -1;

	} else {

		if (reclustering.current_borrowed_proc != -1){

			allocate_new_task(reclustering.task_ID, reclustering.requesting_task, reclustering.current_borrowed_proc);

			//Somente faz sentido decrementar os recursos quando este kernel executa em modo global, pois
			//somente o global faz gerenciamento dos recursos dos clusers
			if (is_global_master){
				decrement_cluster_resources(reclustering.current_borrowed_master);
			}

			//Neste ponto o reclustering acabou
			reclustering.task_ID = -1;

		} else {

			reclustering.neighbors_level++;

			if (reclustering.neighbors_level > max_neighbors_level){

				puts("######## handle_end_of_reclustering_round ########\n ERROR: max neighbors_level reached.\n");

			} else {

				fires_reclustering_protocol();
			}

		}
	}
}



void handle_packet(){

	unsigned int app_ID, terminated_task_list[MAX_APP_SIZE];
	unsigned int proc, hops, master_addr;
	unsigned int diff_energy;
	
	volatile ServiceHeader p;
	NewTask nt;

	read_packet(&p);

	switch (p.service){

	case INITIALIZE_CLUSTER:

		global_master_address = p.source_PE;

		clusterID = p.cluster_ID;

		cluster_xi = cluster_info[clusterID].leftbottom_x;
		cluster_yi = cluster_info[clusterID].leftbottom_y;
		cluster_xf = cluster_info[clusterID].topright_x;
		cluster_yf = cluster_info[clusterID].topright_y;

		proc_free_pages[net_address >> 8][net_address & 0xFF] = 0;

		puts("Kernel Initialized\n");
		putsv("cluster ID: ", clusterID);

		initialize_slaves();

		break;

	case NEW_APP:

		handle_new_app(p.app_ID, 0, p.app_descriptor_size);

		break;

	case NEW_TASK:

		nt.allocated_processor = p.allocated_processor;
		nt.bss_size = p.bss_size;
		nt.code_size = p.code_size;
		nt.data_size = p.data_size;
		nt.initial_address = p.initial_address;
		nt.master_ID = p.master_ID;
		nt.task_ID = p.task_ID;

		energyClustersAcc[p.cluster_ID]  = energyClustersAcc[p.cluster_ID] + p.energy_acc;

		//puts("energyClustersAcc ");puts(itoa(p.cluster_ID)); puts(" ");
		//puts(itoa(energyClustersAcc[p.cluster_ID])); puts("\n");

		add_new_task(&nt);

		master_addr = search_physical_master_address(p.allocated_processor);

		if (master_addr != global_master_address && master_addr != p.source_PE){
			decrement_cluster_resources(master_addr);
		}
		else{
			cluster_info[p.cluster_ID].free_resources -= 1;
			puts("clusterinfo_handle ");puts(itoa(cluster_info[p.cluster_ID].free_resources)); puts("\n");

		}

		break;

	case APP_TERMINATED:

		DMA_read_data((unsigned int)terminated_task_list, p.app_task_number);

		energyClustersAcc[p.cluster_ID]  = energyClustersAcc[p.cluster_ID] + p.energy_acc;

		//puts("energyClustersAcc ");puts(itoa(p.cluster_ID)); puts(" ");
		//puts(itoa(energyClustersAcc[p.cluster_ID])); puts("\n");

		handle_app_terminated(p.app_task_number, p.source_PE, terminated_task_list);

		break;

	case TASK_TERMINATED:

		page_released(p.source_PE);

		app_ID = p.task_ID >> 8;
		
		//applications[app_ID].tasks[p.task_ID & 0xFF].proc = -1; //ARRUMAR

		running_task[app_ID]--;

		task_terminated[app_ID][p.task_ID & 0xFF] = p.master_ID;

		if (running_task[app_ID] == 0){

			if (is_global_master) {

				for (int i=0; i<applications[app_ID].size; i++){
					terminated_task_list[i] = task_terminated[app_ID][i];
				}

				energyClustersAcc[clusterID]  = energyClustersAcc[clusterID] + energyLocalClusterAcc;
				energyLocalClusterAcc = 0;
	
				//puts("energyClustersAcc ");puts(itoa(clusterID)); puts(" ");
				//puts(itoa(energyClustersAcc[clusterID])); puts("\n");

				handle_app_terminated(applications[app_ID].size, net_address, terminated_task_list);
				

			} else {

				//send_energy_cluster();


				send_app_terminated(app_ID);
			}
		}

		if (reclustering.task_ID != -1){
			reclustering.cancel_reclustering = 1;
		}

		break;

	case TASK_TERMINATED_OTHER_CLUSTER:

		page_released(p.source_PE);

		if (reclustering.task_ID != -1){
			reclustering.cancel_reclustering = 1;
		}

		break;

	case TASK_REQUEST:

		add_task_request(p.task_ID, p.requesting_task);

		break;

	case LOAN_PROCESSOR_REQUEST:

		if (proc_available <= 0){

			send_loan_proc_delivery(p.source_PE, p.task_ID, -1, -1);

		} else {

			//Procura pelo processador mais proximo do processador requisitnate
			proc = loan_mapping(p.task_ID);

			hops = (p.allocated_processor >> 8) + (proc >> 8);
			hops += (p.allocated_processor & 0xFF) + (proc & 0xFF);

			send_loan_proc_delivery(p.source_PE, p.task_ID, proc, hops);

			page_used(proc);
		}

		break;

	case LOAN_PROCESSOR_DELIVERY:

		reclustering.pending_loan_delivery--;

		if (reclustering.cancel_reclustering){

			send_loan_proc_release(p.source_PE, p.allocated_processor);

			if (reclustering.current_borrowed_master != -1 && reclustering.current_borrowed_master != p.source_PE){

				send_loan_proc_release(reclustering.current_borrowed_master, reclustering.current_borrowed_proc);
			}

		} else if (p.allocated_processor != -1){

			if (p.hops < reclustering.min_loan_proc_hops){

				reclustering.min_loan_proc_hops = p.hops;

				if (reclustering.current_borrowed_proc != -1){

					send_loan_proc_release(reclustering.current_borrowed_master, reclustering.current_borrowed_proc);
				}

				reclustering.current_borrowed_proc = p.allocated_processor;

				reclustering.current_borrowed_master = p.source_PE;

			} else {

				send_loan_proc_release(p.source_PE, p.allocated_processor);

			}
		}

		if (reclustering.pending_loan_delivery == 0){

			handle_end_of_reclustering_round();
		}

		break;

	case LOAN_PROCESSOR_RELEASE:

		page_released(p.released_proc);

		break;
		
	case ENERGY_SLAVE:

		//if (energySlavesAcc[p.source_PE>>8][p.source_PE&0xFF] > p.energy_acc)
		//	diff_energy = energySlavesAcc[p.source_PE>>8][p.source_PE&0xFF] - p.energy_acc;

		//else diff_energy = p.energy_acc - energySlavesAcc[p.source_PE>>8][p.source_PE&0xFF];

		if(p.energy_acc > 2340000*5) {
			energySlavesAcc_discretizado[p.source_PE>>8][p.source_PE&0xFF] = 10;
		}
		else if(p.energy_acc > 2080000*5){
				energySlavesAcc_discretizado[p.source_PE>>8][p.source_PE&0xFF] = 9;
			 }
		else if(p.energy_acc > 1820000*5){
				energySlavesAcc_discretizado[p.source_PE>>8][p.source_PE&0xFF] = 8;
			 }
		else if(p.energy_acc > 1560000*5){
				energySlavesAcc_discretizado[p.source_PE>>8][p.source_PE&0xFF] = 7;
			 }
		else if(p.energy_acc > 1300000*5){
				energySlavesAcc_discretizado[p.source_PE>>8][p.source_PE&0xFF] = 6;
			 }
		else if(p.energy_acc > 1040000*5){
				energySlavesAcc_discretizado[p.source_PE>>8][p.source_PE&0xFF] = 5;
			 }
		else if(p.energy_acc > 780000*5){
				energySlavesAcc_discretizado[p.source_PE>>8][p.source_PE&0xFF] = 4;
			 }
		else if(p.energy_acc > 520000*5){
				energySlavesAcc_discretizado[p.source_PE>>8][p.source_PE&0xFF] = 3;
			 }
		else if(p.energy_acc > 260000*5){
				energySlavesAcc_discretizado[p.source_PE>>8][p.source_PE&0xFF] = 2;
			 }
		else if(p.energy_acc > 130000*5){
				energySlavesAcc_discretizado[p.source_PE>>8][p.source_PE&0xFF] = 1;
			 }
		else energySlavesAcc_discretizado[p.source_PE>>8][p.source_PE&0xFF] = 0;


		energySlavesAcc[p.source_PE>>8][p.source_PE&0xFF] = p.energy_acc;
		
		//puts("p.energy_acc\n"); puts(itoa(p.energy_acc)); puts("\n");
		
		//count_receive_power++;
			//puts("count_receive_power : "); puts(itoa(count_receive_power)); puts(" ");puts(itoa(p.source_PE>>8)); puts(" ");puts(itoa(p.source_PE&0xFF)); puts(" "); puts(itoa(p.energy_acc)); puts("\n");
		



		//puts("energySlavesAcc: "); puts(itoa(energySlavesAcc[p.source_PE>>8][p.source_PE&0xFF])); puts(" "); puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");

		energyLocalClusterAcc = diff_energy + energyLocalClusterAcc;		

		break;

	case ENERGY_CLUSTER:

		//puts("ENERGY_CLUSTER ");puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");

		energyClustersAcc[p.cluster_ID]  = energyClustersAcc[p.cluster_ID] + p.energy_acc;
		//puts("energyClustersAcc ");puts(itoa(p.cluster_ID)); puts(" ");
		//puts(itoa(energyClustersAcc[p.cluster_ID])); puts("\n");

		break;

	case TASK_MIGRATED:

		page_released(p.released_proc);

		task_location[p.task_ID >> 8][p.task_ID & 0xFF] = p.source_PE;

		break;

	// case STOP_EXECUTION:
	// 	puts("Recebi um pacote STOP_EXECUTION!\n"); 
	// 	puts("(kernel_master)->No processador: "); puts(itoa(p.header)); puts("\n");
	// 	break;

	default:
		puts("ERROR: service unknown ");puts(itoh(p.service)); puts("\n");
		putsv("Time: ", MemoryRead(TICK_COUNTER));
		break;

	}
}

void initialize_clusters(){

	int cluster_master_address;
	ServiceHeader *p;

	for(int i=0; i<CLUSTER_NUMBER; i++) {

		cluster_master_address = (cluster_info[i].master_x << 8) | cluster_info[i].master_y;

		//puts("Vai inicializr cluster "); puts(itoa(i)); puts("\n");

		if(cluster_master_address != global_master_address){

			p = get_service_header_slot();

			p->header = cluster_master_address;

			p->service = INITIALIZE_CLUSTER;

			p->source_PE = global_master_address;

			p->cluster_ID = i;

			send_packet(p, 0, 0); 

		} else {

			//puts("Inicializou mestre global com ID "); puts(itoa(i)); puts("\n");

			clusterID = i;

			cluster_xi = cluster_info[i].leftbottom_x;
			cluster_yi = cluster_info[i].leftbottom_y;
			cluster_xf = cluster_info[i].topright_x;
			cluster_yf = cluster_info[i].topright_y;

			proc_free_pages[net_address >> 8][net_address & 0xFF] = 0;
		}
	}
}


void initialize_slaves(){

	int proc, index;
	ServiceHeader *p;

	index = 0;

	for(int i=cluster_xi; i<=cluster_xf; i++) {
		for(int j=cluster_yi; j<=cluster_yf; j++) {

			proc = i*256 + j;
			// puts("initialize_slaves-proc num: "); puts(itoa(proc)); puts("\n");
			if(proc != net_address) {
				p = get_service_header_slot();
				p->header = proc;			//destino
				p->service = INITIALIZE_SLAVE;

				send_packet(p, 0, 0);
			}
		}
	}
}


void compara_temp_procs(){

	cluster_temperature temp[XCLUSTER*YCLUSTER]; // VETOR PARA TEMPERATURA DO CLUSTER


	int aux = 0; 
	int temp_maior, prox;

	/*for (int i = 1; i < XDIMENSION*YDIMENSION; i++){
		
		puts("temperatura (testando igualdade de temperatura): "); puts(itoa(i)); puts(" "); puts(itoa(model_temperatura[i])); puts("\n");
	}*/

	for (int i = cluster_xi; i <= cluster_xf; i++){
		for(int j = cluster_yi; j <= cluster_yf; j++){
			// temp[aux].cluster_proc = i * 256 + j;
			// temp[aux].temperatura = model_temperatura[i*XDIMENSION+j];

			temp[aux].cluster_proc = i * 256 + j;
			temp[aux].temperatura = model_temperatura[j*XDIMENSION+i];

			puts("tem[aux].cluster_proc -> "); puts(itoa(temp[aux].cluster_proc)); puts("\n");
			puts("temp[aux].temperatura -> "); puts(itoa(temp[aux].temperatura)); puts("\n");
			aux++;
		}
	}

	for(int i = 0; i < XCLUSTER*YCLUSTER; i++){
		for(int j = i+1 ; j < XCLUSTER*YCLUSTER; j++){

			if(temp[aux].cluster_proc != net_address){ 	// verifica se não é o mestre
				
				if(abs(temp[i].temperatura - temp[j].temperatura) >= 10000000){
					temp_maior = temp[i].temperatura - temp[j].temperatura;

					//****** MONTAGEM E ENVIO DE PACOTE ******//
					ServiceHeader *p;
					p = get_service_header_slot();
					p->service = STOP_EXECUTION;
						
					// VERIFICA QUAL PE ESTA COM TEMPERATURA ELEVADA 
					if(temp_maior < 0){
						p->header = temp[j].cluster_proc;
						if(temp[j].cluster_proc != -1){
							puts("STOP_EXECUTION enviado p/ processador "); puts(itoa(temp[j].cluster_proc)); puts("\n");
							send_packet(p, 0, 0);
							temp[j].cluster_proc = -1;
							// p->execution_stoped = 1;
							// p[1].proc = temp[j].cluster_proc;
						}
					}else{
						p->header = temp[i].cluster_proc;
						if(temp[i].cluster_proc != -1){
							puts("STOP_EXECUTION enviado p/ processador "); puts(itoa(temp[i].cluster_proc)); puts("\n");
							send_packet(p, 0, 0);
							temp[i].cluster_proc = -1;
							// p->execution_stoped = 1;
							// p[1].proc = temp[i].cluster_proc;
						}
					}
					//*****************FIM************************
											
					// count_dif_proc_temp++;
					// prox = 1;
				}
			}
		}
	}
}

/*--------------------------------------------------------------------
 * Main
 *
 * DESCRIPTION:
 * 	- Iinitializes data structures.
 *	- Handles/Stores the incoming NoC services.
 *
 *--------------------------------------------------------------------*/
int main(void) {

	NewTask * pending_new_task;
	TaskRequest * pending_task_request;


	// cluster_temperature temp[XCLUSTER*YCLUSTER]; // VETOR PARA TEMPERATURA DO CLUSTER

	net_address = get_net_address();

	

	if (net_address == 0){

		puts("Kernel Initialized\n");
		puts("This kernel is global master\n");

		is_global_master = 1;

		global_master_address = net_address;

		initialize_clusters();	//INICIALIZA CLUSTER

		initialize_slaves();	//INICIALIZA SLAVES

	} else {

		puts("This kernel is local master\n");

		is_global_master = 0;
	}

	if ((XDIMENSION/XCLUSTER) > (YDIMENSION/YCLUSTER)){
		max_neighbors_level = XDIMENSION/XCLUSTER;
	} else {
		max_neighbors_level = YDIMENSION/YCLUSTER; 
	}

	init_new_task_list();	//inicializa lista para novas tarefas (-1)
	init_task_req_list();	//inicializa lista de requisição de tarefas (-1)
	init_service_header_slots();

	reclustering.task_ID = -1;

	for (;;) {

		if (noc_interruption){

			handle_packet();

		} else if (!MemoryRead(DMA_SEND_ACTIVE)){

				
				//if(((MemoryRead(TICK_COUNTER)) >= counter_ticks) && !is_global_master){
				if(((MemoryRead(TICK_COUNTER)) >= (counter_ticks2)) ){
					
					//puts("temperature counter_ticks2 antes\n"); puts(itoa(counter_ticks2)); puts("\n");
					puts("temperature tick antes (kernel_master): "); puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");
					temperature();
					puts("temperature tick depois (kernel_master): "); puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");
					//count_receive_power = 0;
					counter_ticks2 = counter_ticks2 + counter_ticks;

				// VERIFICAR DIFERENÇA DE TEMPERATURA ENTRE OS Pes DE UM CLUSTER
					compara_temp_procs();
			

					puts("energySlavesAcc 1 : ");puts(itoa(energySlavesAcc[1][0]));puts("\n");
					puts("energySlavesAcc 2 : ");puts(itoa(energySlavesAcc[2][0]));puts("\n");
					puts("energySlavesAcc 3 : ");puts(itoa(energySlavesAcc[3][0]));puts("\n");
					puts("energySlavesAcc 4 : ");puts(itoa(energySlavesAcc[4][0]));puts("\n");
					puts("energySlavesAcc 5 : ");puts(itoa(energySlavesAcc[5][0]));puts("\n");
					puts("energySlavesAcc 6 : ");puts(itoa(energySlavesAcc[0][1]));puts("\n");
					puts("energySlavesAcc 7 : ");puts(itoa(energySlavesAcc[1][1]));puts("\n");
					puts("energySlavesAcc 8 : ");puts(itoa(energySlavesAcc[2][1]));puts("\n");
					puts("energySlavesAcc 9 : ");puts(itoa(energySlavesAcc[3][1]));puts("\n");
					puts("energySlavesAcc 10 : ");puts(itoa(energySlavesAcc[4][1]));puts("\n");
					puts("energySlavesAcc 11 : ");puts(itoa(energySlavesAcc[5][1]));puts("\n");
					puts("energySlavesAcc 12 : ");puts(itoa(energySlavesAcc[0][2]));puts("\n");
					puts("energySlavesAcc 13 : ");puts(itoa(energySlavesAcc[1][2]));puts("\n");
					puts("energySlavesAcc 14 : ");puts(itoa(energySlavesAcc[2][2]));puts("\n");
					puts("energySlavesAcc 15 : ");puts(itoa(energySlavesAcc[3][2]));puts("\n");
					puts("energySlavesAcc 16 : ");puts(itoa(energySlavesAcc[4][2]));puts("\n");
					puts("energySlavesAcc 17 : ");puts(itoa(energySlavesAcc[5][2]));puts("\n");
					puts("energySlavesAcc 18 : ");puts(itoa(energySlavesAcc[0][3]));puts("\n");
					puts("energySlavesAcc 19 : ");puts(itoa(energySlavesAcc[1][3]));puts("\n");
					puts("energySlavesAcc 20 : ");puts(itoa(energySlavesAcc[2][3]));puts("\n");
					puts("energySlavesAcc 21 : ");puts(itoa(energySlavesAcc[3][3]));puts("\n");
					puts("energySlavesAcc 22 : ");puts(itoa(energySlavesAcc[4][3]));puts("\n");
					puts("energySlavesAcc 23 : ");puts(itoa(energySlavesAcc[5][3]));puts("\n");
					puts("energySlavesAcc 24 : ");puts(itoa(energySlavesAcc[0][4]));puts("\n");
					puts("energySlavesAcc 25 : ");puts(itoa(energySlavesAcc[1][4]));puts("\n");
					puts("energySlavesAcc 26 : ");puts(itoa(energySlavesAcc[2][4]));puts("\n");
					puts("energySlavesAcc 27 : ");puts(itoa(energySlavesAcc[3][4]));puts("\n");					
					puts("energySlavesAcc 28 : ");puts(itoa(energySlavesAcc[4][4]));puts("\n");
					puts("energySlavesAcc 29 : ");puts(itoa(energySlavesAcc[5][4]));puts("\n");
					puts("energySlavesAcc 30 : ");puts(itoa(energySlavesAcc[0][5]));puts("\n");
					puts("energySlavesAcc 31 : ");puts(itoa(energySlavesAcc[1][5]));puts("\n");
					puts("energySlavesAcc 32 : ");puts(itoa(energySlavesAcc[2][5]));puts("\n");
					puts("energySlavesAcc 33 : ");puts(itoa(energySlavesAcc[3][5]));puts("\n");
					puts("energySlavesAcc 34 : ");puts(itoa(energySlavesAcc[4][5]));puts("\n");
					puts("energySlavesAcc 35 : ");puts(itoa(energySlavesAcc[5][5]));puts("\n");
					
	
	
					puts("energySlavesAcc_discretizado 1 : ");puts(itoa(energySlavesAcc_discretizado[1][0]));puts("\n");
					puts("energySlavesAcc_discretizado 2 : ");puts(itoa(energySlavesAcc_discretizado[2][0]));puts("\n");
					puts("energySlavesAcc_discretizado 3 : ");puts(itoa(energySlavesAcc_discretizado[3][0]));puts("\n");
					puts("energySlavesAcc_discretizado 4 : ");puts(itoa(energySlavesAcc_discretizado[4][0]));puts("\n");
					puts("energySlavesAcc_discretizado 5 : ");puts(itoa(energySlavesAcc_discretizado[5][0]));puts("\n");
					puts("energySlavesAcc_discretizado 6 : ");puts(itoa(energySlavesAcc_discretizado[0][1]));puts("\n");
					puts("energySlavesAcc_discretizado 7 : ");puts(itoa(energySlavesAcc_discretizado[1][1]));puts("\n");
					puts("energySlavesAcc_discretizado 8 : ");puts(itoa(energySlavesAcc_discretizado[2][1]));puts("\n");
					puts("energySlavesAcc_discretizado 9 : ");puts(itoa(energySlavesAcc_discretizado[3][1]));puts("\n");
					puts("energySlavesAcc_discretizado 10 : ");puts(itoa(energySlavesAcc_discretizado[4][1]));puts("\n");
					puts("energySlavesAcc_discretizado 11 : ");puts(itoa(energySlavesAcc_discretizado[5][1]));puts("\n");
					puts("energySlavesAcc_discretizado 12 : ");puts(itoa(energySlavesAcc_discretizado[0][2]));puts("\n");
					puts("energySlavesAcc_discretizado 13 : ");puts(itoa(energySlavesAcc_discretizado[1][2]));puts("\n");
					puts("energySlavesAcc_discretizado 14 : ");puts(itoa(energySlavesAcc_discretizado[2][2]));puts("\n");
					puts("energySlavesAcc_discretizado 15 : ");puts(itoa(energySlavesAcc_discretizado[3][2]));puts("\n");
					puts("energySlavesAcc_discretizado 16 : ");puts(itoa(energySlavesAcc_discretizado[4][2]));puts("\n");
					puts("energySlavesAcc_discretizado 17 : ");puts(itoa(energySlavesAcc_discretizado[5][2]));puts("\n");
					puts("energySlavesAcc_discretizado 18 : ");puts(itoa(energySlavesAcc_discretizado[0][3]));puts("\n");
					puts("energySlavesAcc_discretizado 19 : ");puts(itoa(energySlavesAcc_discretizado[1][3]));puts("\n");
					puts("energySlavesAcc_discretizado 20 : ");puts(itoa(energySlavesAcc_discretizado[2][3]));puts("\n");
					puts("energySlavesAcc_discretizado 21 : ");puts(itoa(energySlavesAcc_discretizado[3][3]));puts("\n");
					puts("energySlavesAcc_discretizado 22 : ");puts(itoa(energySlavesAcc_discretizado[4][3]));puts("\n");
					puts("energySlavesAcc_discretizado 23 : ");puts(itoa(energySlavesAcc_discretizado[5][3]));puts("\n");
					puts("energySlavesAcc_discretizado 24 : ");puts(itoa(energySlavesAcc_discretizado[0][4]));puts("\n");
					puts("energySlavesAcc_discretizado 25 : ");puts(itoa(energySlavesAcc_discretizado[1][4]));puts("\n");
					puts("energySlavesAcc_discretizado 26 : ");puts(itoa(energySlavesAcc_discretizado[2][4]));puts("\n");
					puts("energySlavesAcc_discretizado 27 : ");puts(itoa(energySlavesAcc_discretizado[3][4]));puts("\n");					
					puts("energySlavesAcc_discretizado 28 : ");puts(itoa(energySlavesAcc_discretizado[4][4]));puts("\n");
					puts("energySlavesAcc_discretizado 29 : ");puts(itoa(energySlavesAcc_discretizado[5][4]));puts("\n");
					puts("energySlavesAcc_discretizado 30 : ");puts(itoa(energySlavesAcc_discretizado[0][5]));puts("\n");
					puts("energySlavesAcc_discretizado 31 : ");puts(itoa(energySlavesAcc_discretizado[1][5]));puts("\n");
					puts("energySlavesAcc_discretizado 32 : ");puts(itoa(energySlavesAcc_discretizado[2][5]));puts("\n");
					puts("energySlavesAcc_discretizado 33 : ");puts(itoa(energySlavesAcc_discretizado[3][5]));puts("\n");
					puts("energySlavesAcc_discretizado 34 : ");puts(itoa(energySlavesAcc_discretizado[4][5]));puts("\n");
					puts("energySlavesAcc_discretizado 35 : ");puts(itoa(energySlavesAcc_discretizado[5][5]));puts("\n");
	
					
					energySlavesAcc[1][0] = 0;
					energySlavesAcc[2][0] = 0;					
					energySlavesAcc[3][0] = 0;					
					energySlavesAcc[4][0] = 0;					
					energySlavesAcc[5][0] = 0;					
					energySlavesAcc[0][1] = 0;					
					energySlavesAcc[1][1] = 0;					
					energySlavesAcc[2][1] = 0;					
					energySlavesAcc[3][1] = 0;					
					energySlavesAcc[4][1] = 0;					
					energySlavesAcc[5][1] = 0;					
					energySlavesAcc[0][2] = 0;					
					energySlavesAcc[1][2] = 0;					
					energySlavesAcc[2][2] = 0;					
					energySlavesAcc[3][2] = 0;					
					energySlavesAcc[4][2] = 0;					
					energySlavesAcc[5][2] = 0;					
					energySlavesAcc[0][3] = 0;					
					energySlavesAcc[1][3] = 0;					
					energySlavesAcc[2][3] = 0;					
					energySlavesAcc[3][3] = 0;					
					energySlavesAcc[4][3] = 0;					
					energySlavesAcc[5][3] = 0;					
					energySlavesAcc[0][4] = 0;					
					energySlavesAcc[1][4] = 0;					
					energySlavesAcc[2][4] = 0;					
					energySlavesAcc[3][4] = 0;					
					energySlavesAcc[4][4] = 0;					
					energySlavesAcc[5][4] = 0;					
					energySlavesAcc[0][5] = 0;					
					energySlavesAcc[1][5] = 0;					
					energySlavesAcc[2][5] = 0;					
					energySlavesAcc[3][5] = 0;					
					energySlavesAcc[4][5] = 0;					
					energySlavesAcc[5][5] = 0;					
					
					
					energySlavesAcc_discretizado[1][0] = 0;
					energySlavesAcc_discretizado[2][0] = 0;					
					energySlavesAcc_discretizado[3][0] = 0;					
					energySlavesAcc_discretizado[4][0] = 0;					
					energySlavesAcc_discretizado[5][0] = 0;					
					energySlavesAcc_discretizado[0][1] = 0;					
					energySlavesAcc_discretizado[1][1] = 0;					
					energySlavesAcc_discretizado[2][1] = 0;					
					energySlavesAcc_discretizado[3][1] = 0;					
					energySlavesAcc_discretizado[4][1] = 0;					
					energySlavesAcc_discretizado[5][1] = 0;					
					energySlavesAcc_discretizado[0][2] = 0;					
					energySlavesAcc_discretizado[1][2] = 0;					
					energySlavesAcc_discretizado[2][2] = 0;					
					energySlavesAcc_discretizado[3][2] = 0;					
					energySlavesAcc_discretizado[4][2] = 0;					
					energySlavesAcc_discretizado[5][2] = 0;					
					energySlavesAcc_discretizado[0][3] = 0;					
					energySlavesAcc_discretizado[1][3] = 0;					
					energySlavesAcc_discretizado[2][3] = 0;					
					energySlavesAcc_discretizado[3][3] = 0;					
					energySlavesAcc_discretizado[4][3] = 0;					
					energySlavesAcc_discretizado[5][3] = 0;					
					energySlavesAcc_discretizado[0][4] = 0;					
					energySlavesAcc_discretizado[1][4] = 0;					
					energySlavesAcc_discretizado[2][4] = 0;					
					energySlavesAcc_discretizado[3][4] = 0;					
					energySlavesAcc_discretizado[4][4] = 0;					
					energySlavesAcc_discretizado[5][4] = 0;					
					energySlavesAcc_discretizado[0][5] = 0;					
					energySlavesAcc_discretizado[1][5] = 0;					
					energySlavesAcc_discretizado[2][5] = 0;					
					energySlavesAcc_discretizado[3][5] = 0;					
					energySlavesAcc_discretizado[4][5] = 0;					
					energySlavesAcc_discretizado[5][5] = 0;								
								
			
			
			
			/*
					puts("energySlavesAcc 1 : "); puts(itoa(energySlavesAcc[1][0]));puts("\n");
					puts("energySlavesAcc 2 : "); puts(itoa(energySlavesAcc[2][0]));puts("\n");
					puts("energySlavesAcc 3 : "); puts(itoa(energySlavesAcc[3][0]));puts("\n");
					puts("energySlavesAcc 4 : "); puts(itoa(energySlavesAcc[0][1]));puts("\n");
					puts("energySlavesAcc 5 : "); puts(itoa(energySlavesAcc[1][1]));puts("\n");
					puts("energySlavesAcc 6 : "); puts(itoa(energySlavesAcc[2][1]));puts("\n");
					puts("energySlavesAcc 7 : "); puts(itoa(energySlavesAcc[3][1]));puts("\n");
					puts("energySlavesAcc 8 : "); puts(itoa(energySlavesAcc[0][2]));puts("\n");
					puts("energySlavesAcc 9 : "); puts(itoa(energySlavesAcc[1][2]));puts("\n");
					puts("energySlavesAcc 10 : ");puts(itoa(energySlavesAcc[2][2]));puts("\n");
					puts("energySlavesAcc 11 : ");puts(itoa(energySlavesAcc[3][2]));puts("\n");
					puts("energySlavesAcc 12 : ");puts(itoa(energySlavesAcc[0][3]));puts("\n");
					puts("energySlavesAcc 13 : ");puts(itoa(energySlavesAcc[1][3]));puts("\n");
					puts("energySlavesAcc 14 : ");puts(itoa(energySlavesAcc[2][3]));puts("\n");
					puts("energySlavesAcc 15 : ");puts(itoa(energySlavesAcc[3][3]));puts("\n");
					

					puts("energySlavesAcc_discretizado 1 : ");puts(itoa(energySlavesAcc_discretizado[1][0]));puts("\n");
					puts("energySlavesAcc_discretizado 2 : ");puts(itoa(energySlavesAcc_discretizado[2][0]));puts("\n");
					puts("energySlavesAcc_discretizado 3 : ");puts(itoa(energySlavesAcc_discretizado[3][0]));puts("\n");
					puts("energySlavesAcc_discretizado 4 : ");puts(itoa(energySlavesAcc_discretizado[0][1]));puts("\n");
					puts("energySlavesAcc_discretizado 5 : ");puts(itoa(energySlavesAcc_discretizado[1][1]));puts("\n");
					puts("energySlavesAcc_discretizado 6 : ");puts(itoa(energySlavesAcc_discretizado[2][1]));puts("\n");
					puts("energySlavesAcc_discretizado 7 : ");puts(itoa(energySlavesAcc_discretizado[3][1]));puts("\n");
					puts("energySlavesAcc_discretizado 8 : ");puts(itoa(energySlavesAcc_discretizado[0][2]));puts("\n");
					puts("energySlavesAcc_discretizado 9 : ");puts(itoa(energySlavesAcc_discretizado[1][2]));puts("\n");
					puts("energySlavesAcc_discretizado 10 : ");puts(itoa(energySlavesAcc_discretizado[2][2]));puts("\n");
					puts("energySlavesAcc_discretizado 11 : ");puts(itoa(energySlavesAcc_discretizado[3][2]));puts("\n");
					puts("energySlavesAcc_discretizado 12 : ");puts(itoa(energySlavesAcc_discretizado[0][3]));puts("\n");
					puts("energySlavesAcc_discretizado 13 : ");puts(itoa(energySlavesAcc_discretizado[1][3]));puts("\n");
					puts("energySlavesAcc_discretizado 14 : ");puts(itoa(energySlavesAcc_discretizado[2][3]));puts("\n");
					puts("energySlavesAcc_discretizado 15 : ");puts(itoa(energySlavesAcc_discretizado[3][3]));puts("\n");
										
					
					
					energySlavesAcc[1][0] = 0;
					energySlavesAcc[2][0] = 0;
					energySlavesAcc[3][0] = 0;
					energySlavesAcc[0][1] = 0;
					energySlavesAcc[1][1] = 0;
					energySlavesAcc[2][1] = 0;
					energySlavesAcc[3][1] = 0;
					energySlavesAcc[0][2] = 0;
					energySlavesAcc[1][2] = 0;
					energySlavesAcc[2][2] = 0;
					energySlavesAcc[3][2] = 0;
					energySlavesAcc[0][3] = 0;
					energySlavesAcc[1][3] = 0;
					energySlavesAcc[2][3] = 0;
					energySlavesAcc[3][3] = 0;
					
					
					energySlavesAcc_discretizado[1][0] = 0;
					energySlavesAcc_discretizado[2][0] = 0;
					energySlavesAcc_discretizado[3][0] = 0;
					energySlavesAcc_discretizado[0][1] = 0;
					energySlavesAcc_discretizado[1][1] = 0;
					energySlavesAcc_discretizado[2][1] = 0;
					energySlavesAcc_discretizado[3][1] = 0;
					energySlavesAcc_discretizado[0][2] = 0;
					energySlavesAcc_discretizado[1][2] = 0;
					energySlavesAcc_discretizado[2][2] = 0;
					energySlavesAcc_discretizado[3][2] = 0;
					energySlavesAcc_discretizado[0][3] = 0;
					energySlavesAcc_discretizado[1][3] = 0;
					energySlavesAcc_discretizado[2][3] = 0;
					energySlavesAcc_discretizado[3][3] = 0;
					*/					
					
			
			
			
			
			
			
					
			//3x3	
			/*		puts("energySlavesAcc 1 : ");puts(itoa(energySlavesAcc[1][0]));puts("\n");
					puts("energySlavesAcc 2 : ");puts(itoa(energySlavesAcc[2][0]));puts("\n");
					puts("energySlavesAcc 3 : ");puts(itoa(energySlavesAcc[0][1]));puts("\n");
					puts("energySlavesAcc 4 : ");puts(itoa(energySlavesAcc[1][1]));puts("\n");
					puts("energySlavesAcc 5 : ");puts(itoa(energySlavesAcc[2][1]));puts("\n");
					puts("energySlavesAcc 6 : ");puts(itoa(energySlavesAcc[0][2]));puts("\n");
					puts("energySlavesAcc 7 : ");puts(itoa(energySlavesAcc[1][2]));puts("\n");
					puts("energySlavesAcc 8 : ");puts(itoa(energySlavesAcc[2][2]));puts("\n");
					
					
					puts("energySlavesAcc_discretizado 1 : ");puts(itoa(energySlavesAcc_discretizado[1][0]));puts("\n");
					puts("energySlavesAcc_discretizado 2 : ");puts(itoa(energySlavesAcc_discretizado[2][0]));puts("\n");
					puts("energySlavesAcc_discretizado 3 : ");puts(itoa(energySlavesAcc_discretizado[0][1]));puts("\n");
					puts("energySlavesAcc_discretizado 4 : ");puts(itoa(energySlavesAcc_discretizado[1][1]));puts("\n");
					puts("energySlavesAcc_discretizado 5 : ");puts(itoa(energySlavesAcc_discretizado[2][1]));puts("\n");
					puts("energySlavesAcc_discretizado 6 : ");puts(itoa(energySlavesAcc_discretizado[0][2]));puts("\n");
					puts("energySlavesAcc_discretizado 7 : ");puts(itoa(energySlavesAcc_discretizado[1][2]));puts("\n");
					puts("energySlavesAcc_discretizado 8 : ");puts(itoa(energySlavesAcc_discretizado[2][2]));puts("\n");
					
					
					energySlavesAcc[1][0] = 0;
					energySlavesAcc[2][0] = 0;					
					energySlavesAcc[0][1] = 0;					
					energySlavesAcc[1][1] = 0;					
					energySlavesAcc[2][1] = 0;					
					energySlavesAcc[0][2] = 0;					
					energySlavesAcc[1][2] = 0;					
					energySlavesAcc[2][2] = 0;				
					
					
					energySlavesAcc_discretizado[1][0] = 0;
					energySlavesAcc_discretizado[2][0] = 0;					
					energySlavesAcc_discretizado[0][1] = 0;					
					energySlavesAcc_discretizado[1][1] = 0;					
					energySlavesAcc_discretizado[2][1] = 0;					
					energySlavesAcc_discretizado[0][2] = 0;					
					energySlavesAcc_discretizado[1][2] = 0;					
					energySlavesAcc_discretizado[2][2] = 0;
					*/
					
				}
					
					//counter_ticks = counter_ticks + 300000;

					//send_energy_cluster();
					//puts("energy_acc_local: "); puts(itoa(energy_acc_local)); puts(" "); puts(itoa(MemoryRead(TICK_COUNTER))); puts("\n");

				//}

				else { 
	
					pending_task_request = get_next_task_request();

					if (pending_task_request){

						handle_task_request(pending_task_request);

					} else if (is_global_master){

						pending_new_task = get_next_new_task();

						if (pending_new_task){

							handle_new_task(pending_new_task);

						} else if (app_req_reg) {

							handle_app_request();
						}
					}
				}
		}
	}

	return 0;
}


//TODO: não testar temperatura do mestre
// funçao para ficar atualizando a temperatura do mestre
// Verificar se esta enviando pacote para processador mestre (não ser enviado) 