/* Reliability Aware MicroProcessors (RAMP) Version 1.0
 * Developed by Jayanth Srinivasan (srinivsn@cs.uiuc.edu)
 * */


/* Run-time code to be inserted in file that provides regular power and
 * temperature samples*/

#include "reliability.h"


extern UnitRel *rel_unit;	/* Objects of the structures in the processor*/
extern double total_fits;	/* Total FITS of the processor*/
double total_inst;			/* Total number of instructions executed */
double EM_total;			/* Total EM FITS */
double SM_total;			/* Total SM FITS */
double TDDB_total;			/* Total TDDB FITS */
double TC_total;			/* Total TC FITS */
double NBTI_total;			/* Total NBTI FITS */

static double *unit_act;
double globalcountdown;

int structures;
int TOTAL_STRUCTURES =10; /* Our example processor has 10 structures */


unit_act = hotspot_vector(flp->n_units); /* EM activity factor vector*/


/* This is the maximum activity factor seen in each unit. At any other point,
 * the ratio of the current activity factor to this is taken. We use power
 * density of a  structure as a proxy for activity factor. The numbers below
 * are proportional to the maximum power consumption of each structure. Example
 * base activities for a processor with 10 structures is shown.*/

EM_base_activity[0] = 1.0;
EM_base_activity[1] = 2.0;
EM_base_activity[2] = 2.0;
EM_base_activity[3] = 3.5;
EM_base_activity[4] = 6.7;
EM_base_activity[5] = 0.5;
EM_base_activity[6] = 0.8;
EM_base_activity[7] = 1.7;
EM_base_activity[8] = 10.4;
EM_base_activity[9] = 6.0;


/* RAMP must be integrated with a power and temperature simulator (for e.g.,
 * Wattch (from Princeton) and HotSpot (from U.Virginia). These simulators will
 * provide temperature readings at fixed intervals for each structure. RAMP uses
 * the same interval to calculate reliability. The code that follows should be
 * used every time a new temperature sample is available */


for (each_new_temperature_measurement)
{

/* As explained earlier, activity factors are calculated based on a structures
 * power consumption.*/

for (structures=0;structures<TOTAL_STRUCTURES;structures++)
{
		power_consumption[structures]=energy_consumption[structures]/temperature_sampling_period;
		EM_act_ratio[structures] = power_consumption[structures]/EM_base_activity[structures];
}


/* For every structure on the processor, calculate FITS (time-average and
 * instantaneous) for each temperature sample (given by the temperature
 * simulator).  FITS are calculated at the same temporal granularity as
 * temperature. Also calculate total FIT values due to each failure mechanism.
 * The variable total_fits keeps track of the total processor FIT value over the
 * entire application. At the end of the application simulation, total_fits will
 * give processor MTTF. total_inst gives instantaneous processor FIT values for
 * each temperature sample.
 * */

for (structures=0;structures< TOTAL_STRUCTURES;structures++)
{

	/* Calculate FIT value by feeding in each structures temperature, activity
	 * factor, processor supply voltage, and processor frequency. */

	rel_unit[structures].allmodels(temperature[structures],EM_act_ratio[structures],Vdd,frequency);
	
	total_fits = total_fits+rel_unit[unitc].fits;		/*  Computes Total average FIT value of processor */
	total_inst =  total_inst + rel_unit[unitc].ind_inst;/*  Computes Total instantaneous FIT value of processor */
	EM_total = EM_total + rel_unit[unitc].EM_fits; 		/* Total average individual failure mech FIT value*/
	SM_total = SM_total + rel_unit[unitc].SM_fits; 
	TDDB_total = TDDB_total + rel_unit[unitc].TDDB_fits; 
	TC_total = TC_total + rel_unit[unitc].TC_fits; 
	NBTI_total = NBTI_total + rel_unit[unitc].NBTI_fits; 
	
	unit_act[unitc]=0;
}

} /* for each new temperature measurement*/


/* After application simulation, print out the simulation results of RAMP */

printf("Total Processor FIT value over entire application %f \n", total_fits);

printf("Total Processor EM FIT value over entire application %f \n", EM_total);
printf("Total Processor SM FIT value over entire application %f \n", SM_total);
printf("Total Processor TDDB FIT value over entire application %f \n", TDDB_total);
printf("Total Processor TC FIT value over entire application %f \n", TC_total);
printf("Total Processor NBTI FIT value over entire application %f \n", NBTI_total);

