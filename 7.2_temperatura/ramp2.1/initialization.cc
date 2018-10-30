/* Reliability Aware MicroProcessors (RAMP) Version 2.0
 * Developed by Jayanth Srinivasan (srinivsn@cs.uiuc.edu)
 * */


/* Initialization code to be inserted in startup file of performance simulator
 * */


#include "reliability.h"

UnitRel *rel_unit;		/* Class containing all reliability data*/
double total_struct_area;	/* Total processor die area*/
extern double total_fits;	/*  Total FITS (1/MTTF) of the entire processor*/
int rel_counter;
long double access_counter;
int unitc;					/* Unit counter*/
int TOTAL_STRUCTURES =10; /* Our sample processor has 10 structures */

total_fits = 0.0;	
total_struct_area=0.0;
access_counter = 0.0; 

/* Reliability objects and memory allocation*/
rel_unit=(UnitRel *)calloc(TOTAL_STRUCTURES,sizeof(UnitRel));	

if (!rel_unit)
	fprintf(simerr,"FAILURE DUE TO CALLOC OF RELIABILITY OBJECTS \n");


/* Reliability object initialization for every structure on the processor*/
for (unitc=0;unitc< TOTAL_STRUCTURES;unitc++)
{
	rel_unit[unitc].init(floorplan,unitc);	/* Initialize structures*/
	rel_unit[unitc].fitinit(unitc);		/* Initialize FITS for each structure*/
}
