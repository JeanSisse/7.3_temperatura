//------------------------------------------------------------------------------------------------
//
//  DISTRIBUTED HEMPS -  5.0
//
//  Research group: GAPH-PUCRS    -    contact   fernando.moraes@pucrs.br
//
//  Distribution:  September 2013
//
//  Source name:  mapping.h
//
//  Brief description:  in premapping, allows the premapping of tasks. In mapTask, searches for the best processor to map the required task.
//
//------------------------------------------------------------------------------------------------
	
//#define Premap
//#define WithLoad
//#define WithoutLoad

typedef struct {
	int center;
	int  xi;
	int  xf;
	int  yi;
	int  yf;
} RegionPackage;

int clusterID; 
ApplicationPackage applications[APP_NUMBER];
int cluster_xi, cluster_xf, cluster_yi, cluster_yf; //variáveis inicializados durante inicialização de cluster no kernel_master.c
int total_mpsoc_resources = MAX_GLOBAL_TASKS;

#if defined(WithoutLoad) || defined(WithProfiler)
int InitialMapping(int application, int task){

    int x, y, xo, yo, hops, proc, max_free_procs, free_procs, current_hops;
    int xi, xf, yi, yf;

	proc = -1;
	hops = HOP_NUMBER;
	max_free_procs = -1;

	for(xo = cluster_xi; xo <= cluster_xf; xo++){
		for(yo = cluster_yi; yo <= cluster_yf; yo++){

			if(proc_free_pages[xo][yo] > 0){
				xi = xo-hops;
				xf = xo+hops;
				yi = yo-hops;
				yf = yo+hops;

				if(xi<cluster_xi) xi=cluster_xi;
				if(yi<cluster_yi) yi=cluster_yi;
				if(xf>cluster_xf) xf=cluster_xf;
				if(yf>cluster_yf) yf=cluster_yf;

				free_procs = 0;

				for(x=xi;x<=xf;x++) {
					for(y=yi;y<=yf;y++){
						current_hops = abs(xo-x)+abs(yo-y);
						if((current_hops<=hops)&&(proc_free_pages[x][y]>0)){
							free_procs = free_procs + (proc_free_pages[x][y]);
						}
					}
				}
				if(free_procs > max_free_procs){
					proc = xo*256 + yo;
					max_free_procs = free_procs;
				}
			}
		}
	}

	if(proc == -1) {
		return EMPTY;
	}else{
		return proc;
	}

}
/*--------------------------------------------------------------------
* LEC-DN
*--------------------------------------------------------------------*/
int MapTask(int application, int task) {

	 int i, x, y, xo, yo, proc, mhop;
	 int xi, xf, yi, yf, left, right, top, bottom, end, bb, proc_free_slots;
	 unsigned long int min_hops, hops;
	DependencePackage current_dep;
	DependencePackage tasks[applications[application].tasks[task].dependences_number];

	 int mapped_deps = 0; //Store the number of already mapped dependences of the required task.

	if(proc_available != 0){
		for(i=0; i<applications[application].tasks[task].dependences_number; i++){
			tasks[i].task = 0;
			current_dep = applications[application].tasks[task].dependences[i];

			if(applications[application].tasks[current_dep.task & 0xFF].proc != -1)
			{
					tasks[mapped_deps].task = applications[application].tasks[current_dep.task & 0xFF].proc; //Here, the task field of the structure tasks is used to store the proc where the dependence is mapped
					tasks[mapped_deps].flits = current_dep.flits;
					mapped_deps++;
			}
		}

		proc = -1;
		min_hops = 0xFFFFFFFF;

		if(mapped_deps==1){
			hops = 0;

			xo = tasks[0].task >> 8;
			yo = tasks[0].task & 0xFF;

			xi = xo-1;
			xf = xo+1;
			yi = yo-1;
			yf = yo+1;

			if(xi<cluster_xi) xi=cluster_xi;
			if(yi<cluster_yi) yi=cluster_yi;
			if(xf>cluster_xf) xf=cluster_xf;
			if(yf>cluster_yf) yf=cluster_yf;

			do
			{
				for(x=xi;x<=xf;x++)
				{
					for(y=yi;y<=yf;y++)
					{
						if(proc_free_pages[x][y]>0)
						{
							if((abs(xo-x)+abs(yo-y))==hops)
							{
								proc=x*256+y;
							}
						}
					}
				}

				if(proc==-1)
				{
					hops++;
					if(xi>cluster_xi) xi--;
					if(yi>cluster_yi) yi--;
					if(xf<cluster_xf) xf++;
					if(yf<cluster_yf) yf++;
				}

			} while(hops<=(abs(cluster_xf-cluster_xi) + abs(cluster_yf-cluster_yi)) && (proc==-1));

		}
		else
		{
			xi = tasks[0].task >> 8;
			xf = tasks[0].task >> 8;
			yi = tasks[0].task & 0xFF;
			yf = tasks[0].task & 0xFF;

			for(i=1;i<mapped_deps;i++)
			{
				if((tasks[i].task >> 8)<xi) xi = tasks[i].task >> 8;
				if((tasks[i].task >> 8)>xf) xf = tasks[i].task >> 8;
				if((tasks[i].task & 0xFF)<yi) yi = tasks[i].task & 0xFF;
				if((tasks[i].task & 0xFF)>yf) yf = tasks[i].task & 0xFF;
			}

			xi = xi-1;
			xf = xf+1;
			yi = yi-1;
			yf = yf+1;

			if(xi<cluster_xi) xi=cluster_xi;
			if(yi<cluster_yi) yi=cluster_yi;
			if(xf>cluster_xf) xf=cluster_xf;
			if(yf>cluster_yf) yf=cluster_yf;

			end = 0;
			bb = 0;
			left = -1;
			right = -1;
			top = -1;
			bottom = -1;
			do
			{
				for(x=xi;x<=xf;x++)
					for(y=yi;y<=yf;y++)
					{
						if(bb==0 || (bb==1 && ((x==left && y!=-1) || (x==right && y!=-1) || (x!=-1 && y==bottom) || (x!=-1 && y==top))))
						{
							if(proc_free_pages[x][y]>0){
								hops = 0;

								for(i=0;i<mapped_deps;i++){
									mhop = 0;
									xo = tasks[i].task >> 8;
									yo = tasks[i].task & 0xFF;
									mhop = abs(xo-x) + abs(yo-y);
									hops = hops + mhop*tasks[i].flits;
									proc_free_slots = proc_free_pages[x][y];
								}
								if(hops<min_hops){
									proc=x*256+y;
									min_hops = hops;
								}
							}
						}
					}
				if(proc==-1)
				{
					end = 0;
					bb = 1;
					if(xi>cluster_xi)
					{
						xi--;
						left = xi;
					}
					else
					{
						end++;
						left = -1;
					}
					if(yi>cluster_yi)
					{
						yi--;
						bottom = yi;
					}
					else
					{
						end++;
						bottom = -1;
					}
					if(xf<cluster_xf)
					{
						xf++;
						right = xf;
					}
					else
					{
						end++;
						right = -1;
					}
					if(yf<cluster_yf)
					{
						yf++;
						top = yf;
					}
					else
					{
						end++;
						top = -1;
					}
				}
			} while(end!=4 && proc==-1);
		}

		if(proc == -1) return EMPTY;
		else return proc;
	}
	else return EMPTY;
}
#endif

#ifdef WithLoad
RegionPackage InitialMapping(int application, int task){

    int x, y, xo, yo, hops, current_hops, max_free_procs, free_procs;
    int load_total, min_load_total, first_min_load_total, media;
    int xi, xf, yi, yf;
   RegionPackage region_load;

	hops = HOP_NUMBER;
	max_free_procs = -1;
	min_load_total = 0;
	first_min_load_total = 1;
	region_load.center = -1;
	region_load.xi = -1;
	region_load.xf = -1;
	region_load.yi = -1;
	region_load.yf = -1;

	for(xo=cluster_xi; xo<=cluster_xf; xo++){
		for(yo=cluster_yi; yo<=cluster_yf; yo++){

			if(proc_free_pages[xo][yo]>0){
				xi = xo-hops;
				xf = xo+hops;
				yi = yo-hops;
				yf = yo+hops;

				if(xi<cluster_xi) xi=cluster_xi;
				if(yi<cluster_yi) yi=cluster_yi;
				if(xf>cluster_xf) xf=cluster_xf;
				if(yf>cluster_yf) yf=cluster_yf;

				free_procs = 0;
				load_total = 0;

				for(x=xi;x<=xf;x++){
					for(y=yi;y<=yf;y++){
						current_hops = abs(xo-x)+abs(yo-y);
						if((current_hops <= hops) && (proc_free_pages[x][y] > 0)){
							free_procs = free_procs + (proc_free_pages[x][y]);
							load_total = load_total + proc_load_total[x][y];
						}
					}
				}

				media = load_total/free_procs;

				if(media<min_load_total){
					region_load.center = xo*256 + yo;
					region_load.xi = xi;
					region_load.xf = xf;
					region_load.yi = yi;
					region_load.yf = yf;
					min_load_total = media;
				}

				if(first_min_load_total == 1){
					region_load.center = xo*256 + yo; 
					region_load.xi = xi;
					region_load.xf = xf;
					region_load.yi = yi;
					region_load.yf = yf;
					min_load_total = media;
					first_min_load_total = 0;
				}
			}
		}
	}
	return region_load;
}

int InitialMapping2(RegionPackage region){

	 int i, x, y, xo, yo, proc;
	 int xi, xf, yi, yf, end;
	 unsigned long int hops, min_load_total, first_min_load;

	xi=region.xi;
	yi=region.yi;
	xf=region.xf;
	yf=region.yf;

	if(proc_available != 0){
		proc = -1;
		first_min_load = 1;
		min_load_total = 0;

		do
		{
			for(x=xi;x<=xf;x++)
			{
				for(y=yi;y<=yf;y++)
				{
					if(proc_free_pages[x][y]>0)
					{
						if(proc_load_total[x][y]<min_load_total)
						{
							proc=x*256+y;
							min_load_total = proc_load_total[x][y];
						}
						if(first_min_load==1)
						{
							proc=x*256+y;
							min_load_total = proc_load_total[x][y];
							first_min_load = 0;
						}
					}
				}
			}

			if(proc==-1)
			{
				end = 0;

				if(xi>cluster_xi)
				{
					xi--;
					end++;
				}
				if(yi>cluster_yi)
				{
					yi--;
					end++;
				}
				if(xf<cluster_xf)
				{
					xf++;
					end++;
				}
				if(yf<cluster_yf)
				{
					yf++;
					end++;
				}
			}

		} while(end!=4 && proc==-1);

		if(proc == -1) return EMPTY;
		else return proc;
	}
	else return EMPTY;
}

int MapTask(int application, int task){

	 int i, x, y, xo, yo, proc, mhop;
	 int xi, xf, yi, yf, left, right, top, bottom, end, bb, proc_free_slots, max_proc_free_slots;
	 unsigned long int min_hops, hops, min_load_total, chosen_load_total, first_min_load;
	DependencePackage current_dep;
	DependencePackage tasks[applications[application].tasks[task].dependences_number];

	 int mapped_deps = 0; //Store the number of already mapped dependences of the required task.

	if(proc_available != 0){
			for(i=0; i<applications[application].tasks[task].dependences_number; i++)
			{
				tasks[i].task = 0;
				current_dep = applications[application].tasks[task].dependences[i];

				if(applications[application].tasks[current_dep.task & 0xFF].proc != -1)
				{
						tasks[mapped_deps].task = applications[application].tasks[current_dep.task & 0xFF].proc; //Here, the task field of the structure tasks is used to store the proc where the dependence is mapped
						tasks[mapped_deps].flits = current_dep.flits;
						mapped_deps++;
				}
			}

			proc = -1;
			first_min_load = 1;
			min_load_total = 0;
			hops = 1;

			if(mapped_deps==1)
			{

				xo = tasks[0].task >> 8;
				yo = tasks[0].task & 0xFF;

				xi = xo-hops;
				xf = xo+hops;
				yi = yo-hops;
				yf = yo+hops;

				if(xi<cluster_xi) xi=cluster_xi;
				if(yi<cluster_yi) yi=cluster_yi;
				if(xf>cluster_xf) xf=cluster_xf;
				if(yf>cluster_yf) yf=cluster_yf;

				do
				{
					for(x=xi;x<=xf;x++)
					{
						for(y=yi;y<=yf;y++)
						{
							if(proc_free_pages[x][y]>0)
							{
								if(proc_load_total[x][y]<min_load_total)
								{
									proc=x*256+y;
									min_load_total = proc_load_total[x][y];
								}
								if(first_min_load==1)
								{
									proc=x*256+y;
									min_load_total = proc_load_total[x][y];
									first_min_load = 0;
								}
							}
						}
					}

					if(proc==-1)
					{
						hops++;
						if(xi>cluster_xi) xi--;
						if(yi>cluster_yi) yi--;
						if(xf<cluster_xf) xf++;
						if(yf<cluster_yf) yf++;
					}

				} while(hops<=(abs(cluster_xf-cluster_xi) + abs(cluster_yf-cluster_yi)) && (proc==-1));

			}
			else
			{
				xi = tasks[0].task >> 8;
				xf = tasks[0].task >> 8;
				yi = tasks[0].task & 0xFF;
				yf = tasks[0].task & 0xFF;

				for(i=1;i<mapped_deps;i++)
				{
					if((tasks[i].task >> 8)<xi) xi = tasks[i].task >> 8;
					if((tasks[i].task >> 8)>xf) xf = tasks[i].task >> 8;
					if((tasks[i].task & 0xFF)<yi) yi = tasks[i].task & 0xFF;
					if((tasks[i].task & 0xFF)>yf) yf = tasks[i].task & 0xFF;
				}

				xi = xi-hops;
				xf = xf+hops;
				yi = yi-hops;
				yf = yf+hops;

				if(xi<cluster_xi) xi=cluster_xi;
				if(yi<cluster_yi) yi=cluster_yi;
				if(xf>cluster_xf) xf=cluster_xf;
				if(yf>cluster_yf) yf=cluster_yf;

				end = 0;
				bb = 0;
				left = -1;
				right = -1;
				top = -1;
				bottom = -1;
				do
				{
					for(x=xi;x<=xf;x++)
						for(y=yi;y<=yf;y++)
						{
							if(bb==0 || (bb==1 && ((x==left && y!=-1) || (x==right && y!=-1) || (x!=-1 && y==bottom) || (x!=-1 && y==top))))
							{
								if(proc_free_pages[x][y]>0){
									if(proc_load_total[x][y]<min_load_total){
										proc=x*256+y;
										min_load_total = proc_load_total[x][y];
									}
									if(first_min_load==1){
										proc=x*256+y;
										min_load_total = proc_load_total[x][y];
										first_min_load = 0;
									}
								}
							}
						}
					if(proc==-1)
					{
						end = 0;
						bb = 1;
						if(xi>cluster_xi)
						{
							xi--;
							left = xi;
						}
						else
						{
							end++;
							left = -1;
						}
						if(yi>cluster_yi)
						{
							yi--;
							bottom = yi;
						}
						else
						{
							end++;
							bottom = -1;
						}
						if(xf<cluster_xf)
						{
							xf++;
							right = xf;
						}
						else
						{
							end++;
							right = -1;
						}
						if(yf<cluster_yf)
						{
							yf++;
							top = yf;
						}
						else{
							end++;
							top = -1;
						}
					}
				} while(end!=4 && proc==-1);

			}

			if(proc == -1) return EMPTY;
			else return proc;
	}
	else return EMPTY;
}
#endif

#ifdef WithLoad_RealTime
RegionPackage InitialMapping(int application, int task) {

    int x, y, xo, yo, hops, current_hops, max_free_procs, free_procs;
    int load_total, min_load_total, first_min_load_total, media;
    int xi, xf, yi, yf;
   RegionPackage region_load;

	hops = HOP_NUMBER;
	max_free_procs = -1;
	min_load_total = 0;
	first_min_load_total = 1;
	region_load.center = -1;
	region_load.xi = -1;
	region_load.xf = -1;
	region_load.yi = -1;
	region_load.yf = -1;

	for(xo=cluster_xi; xo<=cluster_xf; xo++){
		for(yo=cluster_yi; yo<=cluster_yf; yo++){

			if(proc_free_pages[xo][yo]>0){
				xi = xo-hops;
				xf = xo+hops;
				yi = yo-hops;
				yf = yo+hops;

				if(xi<cluster_xi) xi=cluster_xi;
				if(yi<cluster_yi) yi=cluster_yi;
				if(xf>cluster_xf) xf=cluster_xf;
				if(yf>cluster_yf) yf=cluster_yf;

				free_procs = 0;
				load_total = 0;

				for(x=xi;x<=xf;x++) {
					for(y=yi;y<=yf;y++)
					{
						current_hops = abs(xo-x)+abs(yo-y);
						if((current_hops<=hops)&&(proc_free_pages[x][y]>0))
						{
							free_procs = free_procs + (proc_free_pages[x][y]);
							load_total = load_total + energySlavesAcc[x][y];
						}
					}
				}

				media = load_total/free_procs;

				if(media<min_load_total){
					region_load.center = xo*256 + yo;
					region_load.xi = xi;
					region_load.xf = xf;
					region_load.yi = yi;
					region_load.yf = yf;
					min_load_total = media;
				}

				if(first_min_load_total == 1){
					region_load.center = xo*256 + yo;
					region_load.xi = xi;
					region_load.xf = xf;
					region_load.yi = yi;
					region_load.yf = yf;
					min_load_total = media;
					first_min_load_total = 0;
				}
			}
		}
	}
	return region_load;
}

int InitialMapping2(RegionPackage region)
{

	 int i, x, y, xo, yo, proc;
	 int xi, xf, yi, yf, end;
	 unsigned long int hops, min_load_total, first_min_load;

	xi=region.xi;
	yi=region.yi;
	xf=region.xf;
	yf=region.yf;

	if(proc_available != 0)
	{
		proc = -1;
		first_min_load = 1;
		min_load_total = 0;

		do
		{
			for(x=xi;x<=xf;x++)
			{
				for(y=yi;y<=yf;y++)
				{
					if(proc_free_pages[x][y]>0)
					{
						if(energySlavesAcc[x][y]<min_load_total){
							proc=x*256+y;
							min_load_total = energySlavesAcc[x][y];
						}
						if(first_min_load==1)
						{
							proc=x*256+y;
							min_load_total = energySlavesAcc[x][y];
							first_min_load = 0;
						}
					}
				}
			}

			if(proc==-1)
			{
				end = 0;

				if(xi>cluster_xi)
				{
					xi--;
					end++;
				}
				if(yi>cluster_yi)
				{
					yi--;
					end++;
				}
				if(xf<cluster_xf)
				{
					xf++;
					end++;
				}
				if(yf<cluster_yf)
				{
					yf++;
					end++;
				}
			}

		} while(end!=4 && proc==-1);

		if(proc == -1) return EMPTY;
		else return proc;
	}
	else return EMPTY;
}

int MapTask(int application, int task) {

	 int i, x, y, xo, yo, proc, mhop;
	 int xi, xf, yi, yf, left, right, top, bottom, end, bb, proc_free_slots, max_proc_free_slots;
	 unsigned long int min_hops, hops, min_load_total, chosen_load_total, first_min_load;
	DependencePackage current_dep;
	DependencePackage tasks[applications[application].tasks[task].dependences_number];

	 int mapped_deps = 0; //Store the number of already mapped dependences of the required task.

	if(proc_available != 0){
			for(i=0; i<applications[application].tasks[task].dependences_number; i++)
			{
				tasks[i].task = 0;
				current_dep = applications[application].tasks[task].dependences[i];

				if(applications[application].tasks[current_dep.task & 0xFF].proc != -1)
				{
						tasks[mapped_deps].task = applications[application].tasks[current_dep.task & 0xFF].proc; //Here, the task field of the structure tasks is used to store the proc where the dependence is mapped
						tasks[mapped_deps].flits = current_dep.flits;
						mapped_deps++;
				}
			}

			proc = -1;
			first_min_load = 1;
			min_load_total = 0;
			hops = 1;

			if(mapped_deps==1)
			{

				xo = tasks[0].task >> 8;
				yo = tasks[0].task & 0xFF;

				xi = xo-hops;
				xf = xo+hops;
				yi = yo-hops;
				yf = yo+hops;

				if(xi<cluster_xi) xi=cluster_xi;
				if(yi<cluster_yi) yi=cluster_yi;
				if(xf>cluster_xf) xf=cluster_xf;
				if(yf>cluster_yf) yf=cluster_yf;

				do
				{
					for(x=xi;x<=xf;x++)
					{
						for(y=yi;y<=yf;y++)
						{
							if(proc_free_pages[x][y]>0)
							{
								if(energySlavesAcc[x][y]<min_load_total)
								{
									proc=x*256+y;
									min_load_total = energySlavesAcc[x][y];
								}
								if(first_min_load==1)
								{
									proc=x*256+y;
									min_load_total = energySlavesAcc[x][y];
									first_min_load = 0;
								}
							}
						}
					}

					if(proc==-1)
					{
						hops++;
						if(xi>cluster_xi) xi--;
						if(yi>cluster_yi) yi--;
						if(xf<cluster_xf) xf++;
						if(yf<cluster_yf) yf++;
					}

				} while(hops<=(abs(cluster_xf-cluster_xi) + abs(cluster_yf-cluster_yi)) && (proc==-1));

			}
			else
			{
				xi = tasks[0].task >> 8;
				xf = tasks[0].task >> 8;
				yi = tasks[0].task & 0xFF;
				yf = tasks[0].task & 0xFF;

				for(i=1;i<mapped_deps;i++)
				{
					if((tasks[i].task >> 8)<xi) xi = tasks[i].task >> 8;
					if((tasks[i].task >> 8)>xf) xf = tasks[i].task >> 8;
					if((tasks[i].task & 0xFF)<yi) yi = tasks[i].task & 0xFF;
					if((tasks[i].task & 0xFF)>yf) yf = tasks[i].task & 0xFF;
				}

				xi = xi-hops;
				xf = xf+hops;
				yi = yi-hops;
				yf = yf+hops;

				if(xi<cluster_xi) xi=cluster_xi;
				if(yi<cluster_yi) yi=cluster_yi;
				if(xf>cluster_xf) xf=cluster_xf;
				if(yf>cluster_yf) yf=cluster_yf;

				end = 0;
				bb = 0;
				left = -1;
				right = -1;
				top = -1;
				bottom = -1;
				do
				{
					for(x=xi;x<=xf;x++)
						for(y=yi;y<=yf;y++)
						{
							if(bb==0 || (bb==1 && ((x==left && y!=-1) || (x==right && y!=-1) || (x!=-1 && y==bottom) || (x!=-1 && y==top))))
							{
								if(proc_free_pages[x][y]>0)
								{
									if(energySlavesAcc[x][y]<min_load_total)
									{
										proc=x*256+y;
										min_load_total = energySlavesAcc[x][y];
									}
									if(first_min_load==1)
									{
										proc=x*256+y;
										min_load_total = energySlavesAcc[x][y];
										first_min_load = 0;
									}
								}
							}
						}
					if(proc==-1)
					{
						end = 0;
						bb = 1;
						if(xi>cluster_xi)
						{
							xi--;
							left = xi;
						}
						else
						{
							end++;
							left = -1;
						}
						if(yi>cluster_yi)
						{
							yi--;
							bottom = yi;
						}
						else
						{
							end++;
							bottom = -1;
						}
						if(xf<cluster_xf)
						{
							xf++;
							right = xf;
						}
						else
						{
							end++;
							right = -1;
						}
						if(yf<cluster_yf)
						{
							yf++;
							top = yf;
						}
						else
						{
							end++;
							top = -1;
						}
					}
				} while(end!=4 && proc==-1);

			}

			if(proc == -1) return EMPTY;
			else return proc;
	}
	else return EMPTY;
}
#endif

#if defined(WithoutLoad) || defined(WithProfiler)
int SearchCluster(int app_task_number) {

	int selected_cluster = -1;
	int freest_cluster = 0;

	if (total_mpsoc_resources < app_task_number){
		return -1;
	}

	for (int i=0; i<CLUSTER_NUMBER; i++){

		if (i == clusterID) continue;

		if (cluster_info[i].free_resources > freest_cluster){
			selected_cluster = i;
			freest_cluster = cluster_info[i].free_resources;
		}
	}

	if (cluster_info[clusterID].free_resources > freest_cluster){
		selected_cluster = clusterID;
	}

	return selected_cluster;
}
#endif
#ifdef WithLoad
int SearchCluster(int app_task_number) {

	int freest_cluster = -1;
	int freest_cluster_all = -1;
	unsigned int min_cluster_load = 0xFFFFFFFF;
	unsigned int min_cluster_load_all = 0xFFFFFFFF;

	if (total_mpsoc_resources < app_task_number){
		return -1;
	}

	for(int i=0; i < CLUSTER_NUMBER; i++) {

		if (cluster_info[i].free_resources >= app_task_number){


			if (clusters_load[i] < min_cluster_load){

				freest_cluster = i;
				min_cluster_load = clusters_load[i];
			}

		}

		if (clusters_load[i] < min_cluster_load_all){

			freest_cluster_all = i;
			min_cluster_load_all = clusters_load[i];

		}
	}

	if (freest_cluster != -1) {
		return freest_cluster;
	}

	return freest_cluster_all;

}
#endif

#ifdef WithLoad_RealTime
int SearchCluster(int app_task_number) { 

	int freest_cluster = -1;
	int freest_cluster_all = -1;
	//unsigned int max_cluster_resources = 0;
	unsigned int min_cluster_load = 0xFFFFFFFF;
	unsigned int min_cluster_load_all = 0xFFFFFFFF;

	if (total_mpsoc_resources < app_task_number){
		return -1;
	}

	//Primeiro seleciona o cluster com mais recursos vazios, depois o cluster com
	for(int i=0; i < CLUSTER_NUMBER; i++) {

		if (cluster_info[i].free_resources >= app_task_number){

			//if (energyClustersAcc[i] == min_cluster_load){
			//	if (cluster_info[i].free_resources >= max_cluster_resources){
			//		freest_cluster = i;
			//		min_cluster_load = energyClustersAcc[i];
			//		max_cluster_resources = cluster_info[i].free_resources;
			//	}
				//puts("energyClustersAcc_free ");puts(itoa(i)); puts(" ");
				//puts(itoa(energyClustersAcc[i])); puts("\n");

			//}
			//else 
				if(energyClustersAcc[i] <= min_cluster_load){

				freest_cluster = i;
				min_cluster_load = energyClustersAcc[i];
				//max_cluster_resources = cluster_info[i].free_resources;
				//puts("energyClustersAcc_free ");puts(itoa(i)); puts(" ");
				//puts(itoa(energyClustersAcc[i])); puts("\n");

			}

		}
		//puts("energyClustersAcc_meio ");puts(itoa(i)); puts(" ");
		//puts(itoa(energyClustersAcc[i])); puts("\n");
		
		if (energyClustersAcc[i] <= min_cluster_load_all){

			//puts("energyClustersAcc ");puts(itoa(i)); puts(" ");
			//puts(itoa(energyClustersAcc[i])); puts("\n");
			
			freest_cluster_all = i;
			min_cluster_load_all = energyClustersAcc[i];
		}
	}

	//puts("freest_cluster "); puts(itoa(freest_cluster)); puts("\n");
	//puts("freest_cluster_all "); puts(itoa(freest_cluster_all)); puts("\n");

	if (freest_cluster != -1) {
		energyClustersAcc[freest_cluster]++;
		return freest_cluster;
	}

	energyClustersAcc[freest_cluster_all]++;
	return freest_cluster_all;

}
#endif

int loan_mapping(int taskID){
	int proc;

	taskID = taskID & 0xFF;

	for(int x = cluster_xi; x <= cluster_xf; x++){
		for (int y=cluster_yi; y<= cluster_yf; y++){

			proc = x << 8 | y;

			if (proc_free_pages[x][y] > 0){

				return proc;
			}
		}
	}
	//puts("return -1\n");
	return -1;
}
