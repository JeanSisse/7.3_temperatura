#include <task.h>
#include <stdlib.h>
#include <stdio.h>

#define NUM_NODES                  16		//16 for small input; 160 for large input; 30 for medium input;
#define MAXPROCESSORS			   64		//The amount of processor
#define NPROC 						5

int PROCESSORS;
int pthread_n_workers;
int paths;
int tasks[MAXPROCESSORS][2];
int nodes_tasks[NUM_NODES*(NUM_NODES-1)/2][2];
int AdjMatrix[NUM_NODES][NUM_NODES];
int result[33];
int ended;

int main(int argc, char *argv[])
{
	int m_argc,size,i;
	char *m_argv[3];
	ended = 0;
	
	//Echo("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
	//Send(
	pthread_n_workers = NPROC;

	PROCESSORS = pthread_n_workers;

	execute();

	exit();
}


void startThreads(void) {
	int i, j;
	Message msg;

	/* SEND nodes_tasks[NUM_NODES*(NUM_NODES-1)/2][2] */
	msg.length = NUM_NODES*(NUM_NODES-1)/2;
	// Send X of nodes_tasks
	for (i=0; i<(NUM_NODES*(NUM_NODES-1)/2); i++)
	{
		msg.msg[i] = nodes_tasks[i][0];
		/*Echo("\n XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX msg.msg[i]");
		Echo(itoa(msg.msg[i]));
		Echo("  ||  ");
		Echo(itoa(nodes_tasks[i][0]));
		Echo("\n");*/
	}
	Send(&msg, dijkstra_0);
	Send(&msg, dijkstra_1);
	Send(&msg, dijkstra_2);
	Send(&msg, dijkstra_3);
	Send(&msg, dijkstra_4);

	// Send Y of nodes_tasks
	for (i=0; i<(NUM_NODES*(NUM_NODES-1)/2); i++)
		msg.msg[i] = nodes_tasks[i][1];
	Send(&msg, dijkstra_0);
	Send(&msg, dijkstra_1);
	Send(&msg, dijkstra_2);
	Send(&msg, dijkstra_3);
	Send(&msg, dijkstra_4);

	/* SEND tasks[MAXPROCESSORS][2] */
	msg.length = MAXPROCESSORS;
	// Send X of tasks
	for (i=0; i<MAXPROCESSORS; i++)
		msg.msg[i] = tasks[i][0];
	Send(&msg, dijkstra_0);
	Send(&msg, dijkstra_1);
	Send(&msg, dijkstra_2);
	Send(&msg, dijkstra_3);
	Send(&msg, dijkstra_4);
	Echo("GRUPO 0");
	//Echo(itoa(tasks[0][0]));
	//Echo(itoa(tasks[1][0]));
	//Echo(itoa(tasks[2][0]));
	//Echo(itoa(tasks[3][0]));
	Echo(itoa(tasks[4][0]));


	// Send Y of tasks
	for (i=0; i<MAXPROCESSORS; i++)
		msg.msg[i] = tasks[i][1];
	Send(&msg, dijkstra_0);
	Send(&msg, dijkstra_1);
	Send(&msg, dijkstra_2);
	Send(&msg, dijkstra_3);
	Send(&msg, dijkstra_4);

	Echo("GRUPO 1");
	//Echo(itoa(tasks[0][1]));
	//Echo(itoa(tasks[1][1]));
	//Echo(itoa(tasks[2][1]));
	//Echo(itoa(tasks[3][1]));
	//Echo(itoa(tasks[4][1]));

	//Echo("FIMMM");

	/* SEND AdjMatrix[NUM_NODES][NUM_NODES] */
	msg.length = NUM_NODES;
	for (i=0; i<NUM_NODES; i++) {
		//Echo(" SEND: ");
		for (j=0; j<NUM_NODES; j++) {
			msg.msg[j] = AdjMatrix[j][i];
			//Echo(itoa(msg.msg[j]));
			//Echo(" ");
		}
		Send(&msg, dijkstra_0);
		Send(&msg, dijkstra_1);
		Send(&msg, dijkstra_2);
		Send(&msg, dijkstra_3);
		Send(&msg, dijkstra_4);
		//Echo("\n");
	}
}

void divide_task_group(int task) {
	int i;
	for(i=0;i<PROCESSORS;i++){
		tasks[i][0] = task/PROCESSORS* (i);
		tasks[i][1] = task/PROCESSORS* (i+1) + (i+1==PROCESSORS&task%PROCESSORS!=0?task%PROCESSORS:0);
		
	}
}

void ProcessMessage() {
	int paths = 0;

	if (result[0] == -1) {
		ended++;
		Echo("**************************************************************************************************  ENDED ");
		Echo(itoa(ended));
		Echo("\n");
		Echo(itoa(GetTick()));
		Echo("Divider finished.");
	}
	else {
		Echo("From ");
		Echo(itoa(result[0]+1));
		Echo(" to ");
		Echo(itoa(result[1]+1));
		Echo(", shortest path is ");
		Echo(itoa(result[2]));
		Echo(" in cost. ");
		Echo("Path is: ");
		Echo(itoa(result[0]+1));
		for(paths=3; paths<33; paths++) {
			if (result[paths] > 0) {
				Echo(" ");
				Echo(itoa(result[paths]));
			}
		}
		Echo("\n");
	}
}

int execute() {
	
	int i,j,k;
	/*Echo(itoa(k));
	Echo("\n");
	Echo(itoa(k));
	Echo("\n");*/
	k = 0;
	
	int fpTrix[NUM_NODES*NUM_NODES] = { 1,    6,    3,    9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999,
										6,    1,    2,    5,    9999, 9999, 1,    9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999,
										3,    2,    1,    3,    4,    9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999,
										9999, 5,    3,    1,    2,    3,    9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999,
										9999, 9999, 4,    2,    1,    5,    9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999,
										9999, 9999, 9999, 3,    5,    1,    3,    2,    9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999,
										9999, 1,    9999, 9999, 9999, 3,    1,    4,    9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999,
										9999, 9999, 9999, 9999, 9999, 2,    4,    1,    7,    9999, 9999, 9999, 9999, 9999, 9999, 9999,
										9999, 9999, 9999, 9999, 9999, 9999, 9999, 7,    1,    5,    1,    9999, 9999, 9999, 9999, 9999,
										9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 5,    1,    9999, 3,    9999, 9999, 9999, 9999,
										9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 1,    9999, 1,    9999, 4,    9999, 9999, 8,
										9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 3,    9999, 1,    9999, 2,    9999, 9999,
										9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 4,    9999, 1,    1,    9999, 2,
										9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 2,    1,    1,    6,    9999,
										9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 6,    1,    3,
										9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 8,    9999, 2,    9999, 3,    1 };
										
	//for(echo=0; echo<100000; echo++);
	//GetTick();
	/* Step 1: geting the working vertexs and assigning values */
	for (i=0;i<NUM_NODES;i++) {
		//Echo(" MATRIX: ");
		for (j=0;j<NUM_NODES;j++) {
			AdjMatrix[i][j]= fpTrix[k];
			//Echo(itoa(AdjMatrix[i][j]));
			//Echo(" ");
			k++;
		}
		//Echo("\n");
	}
	
	int tasks = NUM_NODES*(NUM_NODES-1)/2;

	int x=0;
	for(i=0;i<NUM_NODES-1;i++){ //small:15; large:159
		for(j=i+1;j<NUM_NODES;j++){	//small:16; large:160
			nodes_tasks[x][0] = i;
			nodes_tasks[x][1] = j;
			x++;
		}
	}

	divide_task_group(tasks);
	startThreads();
	
	int end_task[5] = {0, 0, 0, 0, 0};

	Echo("\n");
	Message msg;
	msg.length = 33;
	while (1) {
		if(end_task[0] != -1)
		{
			Receive(&msg, dijkstra_0);
			for (k=0; k<33; k++)
				result[k] = msg.msg[k];
			//if(result[0] == -1) end_task[0] = -1;
			ProcessMessage();
		}
		if(end_task[1] != -1)
		{
			Receive(&msg, dijkstra_1);
			for (k=0; k<33; k++)
				result[k] = msg.msg[k];
			//if(result[0] == -1) end_task[1] = -1;
			ProcessMessage();
		}
		if(end_task[2] != -1)
		{
			Receive(&msg, dijkstra_2);
			for (k=0; k<33; k++)
				result[k] = msg.msg[k];
			//if(result[0] == -1) end_task[2] = -1;
			ProcessMessage();
		}
		if(end_task[3] != -1)
		{
			Receive(&msg, dijkstra_3);
			for (k=0; k<33; k++)
				result[k] = msg.msg[k];
			//if(result[0] == -1) end_task[3] = -1;
			ProcessMessage();
		}
		if(end_task[4] != -1)
		{
			Receive(&msg, dijkstra_4);
			for (k=0; k<33; k++)
				result[k] = msg.msg[k];
			//if(result[0] == -1) end_task[4] = -1;
			ProcessMessage();
		}

		if (ended == (NPROC)) {
			return 0;
		}
	}

	return 0;
}
