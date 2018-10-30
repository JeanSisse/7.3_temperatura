/* Reliability Aware MicroProcessors (RAMP) Version 1.0
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

total_fits = 0.0;	
total_struct_area=0.0;
access_counter = 0.0; 

/* Reliability objects and memory allocation*/
rel_unit=(UnitRel *)calloc(flp->n_units,sizeof(UnitRel));	

if (!rel_unit)
	fprintf(simerr,"FAILURE DUE TO CALLOC OF RELIABILITY OBJECTS \n");


/* Reliability object initialization for every structure on the processor*/
for (unitc=0;unitc< flp->n_units;unitc++)
{
	rel_unit[unitc].init(flp,unitc);	/* Initialize structures*/
	rel_unit[unitc].fitinit(unitc);		/* Initialize FITS for each structure*/
}
