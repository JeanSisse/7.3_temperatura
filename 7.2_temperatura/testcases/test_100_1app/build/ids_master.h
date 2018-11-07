#ifndef __ids_master_h__
#define __ids_master_h__
/*--------------------------------------------------------------------
 * struct ClusterInfo
 *
 * DESCRIPTION:
 *    Store the clusters information
 *
 *--------------------------------------------------------------------*/
typedef struct {
	int master_x;
	int master_y;
	int leftbottom_x;
	int leftbottom_y;
	int topright_x;
	int topright_y;
	int free_resources;
} ClusterInfo;

#define MAX_PROCESSORS		35	/* Number of slave processors available in the platform */
#define MAX_LOCAL_TASKS		2	/* Number of task which can be allocated simultaneously in one processor */
#define MAX_CLUSTER_TASKS		70	/* Number of task which can be allocated simultaneously in one processor */
#define MAX_GLOBAL_TASKS	MAX_LOCAL_TASKS * MAX_PROCESSORS	/* Number of task which can be allocated simultaneously in the platform */
#define XDIMENSION		6
#define YDIMENSION		6
#define XCLUSTER		6
#define YCLUSTER		6
#define CLUSTER_NUMBER		1
#define APP_NUMBER		5
#define TASK_NUMBER		35
#define MAX_APP_SIZE		12
#define APP_REPO_SIZE		4937

#define synthetic 0
#define mpeg 1
#define dijkstra 2
#define MPEG4 3
#define dtw 4
unsigned int energySlavesAcc[XDIMENSION][YDIMENSION];
unsigned int energySlavesAcc_discretizado[XDIMENSION][YDIMENSION];
unsigned int energyLocalClusterAcc;
unsigned int energyClustersAcc[CLUSTER_NUMBER];

//Application id relation
 int appstype[5] = {synthetic,mpeg,dijkstra,MPEG4,dtw,};

 int proc_available = 70;
 int task_location[APP_NUMBER][MAX_APP_SIZE] = { {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, }, {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, }, {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, }, {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, }, {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, }, };
 int task_terminated[APP_NUMBER][MAX_APP_SIZE] = { {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, }, {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, }, {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, }, {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, }, {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, }, };

char proc_free_pages[XDIMENSION][YDIMENSION] = {{MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS}, {MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS}, {MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS}, {MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS}, {MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS}, {MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS, MAX_LOCAL_TASKS}};
 int applications_terminated[APP_NUMBER] = {-1, -1, -1, -1, -1};
 int proc_load_total[XDIMENSION][YDIMENSION] = {{0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}};
 int clusters_load[CLUSTER_NUMBER] = {0};
ClusterInfo cluster_info[CLUSTER_NUMBER] = {
	{0,0,0,0,5,5,70},
};

#endif
