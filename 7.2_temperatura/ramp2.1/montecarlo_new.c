/* Reliability Aware MicroProcessors (RAMP) Version 2.0
 * Developed by Jayanth Srinivasan (srinivsn@cs.uiuc.edu)
  * */


/* montecarlo.c: Monte-Carlo simulation for RAMP with MIN-MAX code for series-parallel failure
 * analysis*/


/* This file is used to calculate MTTF of series-parallel failure systems using
 * lognormal failure distributions. Details of the exact modeling methodology
 * can be found in:
 *
 * "Exploiting Structural Duplication for Lifetime Reliability Enhancement", J.
 * Srinivasan, S. V. Adve, P. Bose, J. A. Rivers, In the Proceedings of the 32nd
 * International Symposium on Computer Architecture (ISCA-2005), June 2005. */

/* The command line for using this file is 
 *
 * a.out FITFILE
 *
 * where FITFILE is obtained from RAMP. Generating the FITFILE is shown in
 * runtime.cc. The format of the FIT file is
 * FIT value due to EM for structure 1
 * FIT value due to SM for structure 1
 * FIT value due to TDDB for structure 1
 * FIT value due to TC for structure 1
 * FIT value due to NBTI for structure 1
 * FIT value due to EM for structure 2 ...
 *
 * A sample FIT file, SAMPLE_FITS, is provided for a processor with 10
 * structures and 5 failure mechanisms and will give a MTTF of around 30
 * years */




#include <stdio.h> 
#include <math.h> 
#include <stdlib.h> 
#include <time.h>
#include <string.h>

#define min(X, Y)  ((X) < (Y) ? (X) : (Y)) 
#define max(X, Y)  ((X) > (Y) ? (X) : (Y))

/* Variable initalization */

float expected_mttf[5][64];
float lognorm_lambda[5][64];
float lognorm_lifetime[5][64];
float structure_lifetime[64];
float fits[5][64];

float temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9;
float temp10,temp11,temp12,temp13,temp14,temp15,temp16,temp17,temp18,temp19;
float temp20,temp21,temp22,temp23,temp24,temp25,temp26,temp27,temp28,temp29;
float temp30,temp31,temp32,temp33,temp34,temp35,temp36,temp37,temp38,temp39;
float temp40,temp41,temp42,temp43,temp44,temp45,temp46,temp47,temp48,temp49;
float temp50,temp51,temp52,temp53,temp54,temp55,temp56,temp57,temp58,temp59;
float temp60,temp61,temp62,temp63,temp64,temp65;

float randomval;
float lifetime_lognorm;
float mttf_lognorm;
int totalruns=100000; /* This sets the number of iterations in the Monte-Carlo
analysis. We use a value of 10E7. The more the iterations, the more accurate the
result. However, this will also increase simulation time.*/

int runs;
float lognorm_correc;
int tempvar1;
int fail_count;
int structure_count;

float totallife;
float mttftotal=0.0;
float finalmttf;


/* Main Monte-Carlo function */
int main(int argc,char *argv[])
{

/* Reading of FIT values from FITFILE. The read_fits function can be found after
 * main() */

char *fitfile = argv[1];
strcpy(fitfile,argv[1]);
read_fits(fitfile);

/* The MTTF value of each structure due to each failure mechanism depends on its
 * FIT value. 1 FIT represents one failure in 10E9 operating hours. Therefore, a
 * FIT value of 3805.17503 gives an MTTF of 30 years. */

for (structure_count=0;structure_count<64;structure_count++)
	{
	for (fail_count=0;fail_count<5;fail_count++)
	{
		expected_mttf[fail_count][structure_count]=(10.0*11415.5251)/fits[fail_count][structure_count];
	}
}


srand((unsigned)time(NULL));

/* Generating lognormal correction factor. This is used to normalize the MTTF of
 * the lognormal distribution.*/

for (runs =0; runs < totalruns; runs++)
{
	randomval = (float)rand()/RAND_MAX;
	
	if ((-1.52245 - log(randomval/4.58344)) < 0.0)
		lifetime_lognorm = 0.0;	
	else
		lifetime_lognorm = pow(2.7182818,(-0.5 + sqrt(-1.52245 - log(randomval/4.58344)))) - pow(2.7182818,(-0.5));

	if (runs ==0)
		mttf_lognorm = lifetime_lognorm;		

	if (runs > 0)
		mttf_lognorm = ((mttf_lognorm/(runs+1))*runs)+((lifetime_lognorm)/(runs+1));
	
}

lognorm_correc = 1.0/mttf_lognorm; 

/* Based on the  MTTF of each structure due to each failure mecahnism, a lambda
 * in the lognormal equation is generated for each structure and failure
 * mechanism. */

for (structure_count=0;structure_count<64;structure_count++)
{
	for (fail_count=0;fail_count<5;fail_count++)
	{
		lognorm_lambda[fail_count][structure_count]=expected_mttf[fail_count][structure_count]/mttf_lognorm;
	}
}


/* This is the main Monte-Carlo simulation loop.*/

for (runs=0; runs<totalruns; runs++)
{
	
/* Random lifetimes are generated for each structure and failure mechanism based
 * on the structure and failure mechanism's MTTF. */

for (structure_count=0;structure_count<64;structure_count++)
{
	for (fail_count=0;fail_count<5;fail_count++)
	{
		randomval = (float)rand()/RAND_MAX;
	
		if ((-1.52245 - log(randomval/4.58344)) < 0.0)
		lognorm_lifetime[fail_count][structure_count] = 0.0;	
		else
		lognorm_lifetime[fail_count][structure_count] = lognorm_lambda[fail_count][structure_count]*(pow(2.7182818,(-0.5 + pow((-1.52245 - log(randomval/4.58344)),0.5))) - pow(2.7182818,(-0.5)))/0.92986;
	}
}

/* In order to calculate lifetime for a series-parallel failure system, we use
 * the MIN-MAX method. Simply put, the lifetime of two structures in series is
 * the minimum of the lifetime of the individual structures. Similarly, the
 * lifetime of two structures in parallel is the maximum of the lifetime of the
 * individual structures. */



/* Within each structure, the individual failure mechanisms act like a series
 * failure system. That is, the first failure due to any mechanism will cause
 * the entire structure to fail. 	structure_lifetime gives the lifetime of the
 * structure due to all mechanisms.*/

for (structure_count=0;structure_count<64;structure_count++)
{
	structure_lifetime[structure_count]=min(min(min(min(lognorm_lifetime[0][structure_count],lognorm_lifetime[1][structure_count]),lognorm_lifetime[2][structure_count]),lognorm_lifetime[3][structure_count]),lognorm_lifetime[4][structure_count]);

}


/* The next step is to calculate the lifetime of the entire series-parallel
 * processor using the MIN-MAX method. We assume a sample processor with 10
 * structures, with structures 0 and 1 in parallel, structures 2 and 3 in
 * parallel, and everything else in series. In other words, structures 0 and 1
 * are duplicates, structures 2 and 3 are duplicates, and everything else is
 * critical and not duplicated.*/



//temp0=max(structure_lifetime[0],structure_lifetime[1]); /* Max for structures 0
//and 1*/
//temp1=max(structure_lifetime[2],structure_lifetime[3]); /* Max for structures 2
//and 3*/
//temp2=min(structure_lifetime[4],structure_lifetime[5]); /* Min for all other
//structures */
temp0=max(structure_lifetime[0],structure_lifetime[1]);
temp1=max(structure_lifetime[2],structure_lifetime[3]);
temp2=max(structure_lifetime[4],structure_lifetime[5]);
temp3=max(structure_lifetime[6],structure_lifetime[7]);
temp4=max(structure_lifetime[8],structure_lifetime[9]);
temp5=max(structure_lifetime[10],structure_lifetime[11]);
temp6=max(structure_lifetime[12],structure_lifetime[13]);
temp7=max(structure_lifetime[14],structure_lifetime[15]);
temp8=max(structure_lifetime[16],structure_lifetime[17]);
temp9=max(structure_lifetime[18],structure_lifetime[19]);

temp10=max(structure_lifetime[20],structure_lifetime[21]);
temp11=max(structure_lifetime[22],structure_lifetime[23]);
temp12=max(structure_lifetime[24],structure_lifetime[25]);
temp13=max(structure_lifetime[26],structure_lifetime[27]);
temp14=max(structure_lifetime[28],structure_lifetime[29]);
temp15=max(structure_lifetime[30],structure_lifetime[31]);
temp16=max(structure_lifetime[32],structure_lifetime[33]);
temp17=max(structure_lifetime[34],structure_lifetime[35]);
temp18=max(structure_lifetime[36],structure_lifetime[37]);
temp19=max(structure_lifetime[38],structure_lifetime[39]);

temp20=max(structure_lifetime[40],structure_lifetime[41]);
temp21=max(structure_lifetime[42],structure_lifetime[43]);
temp22=max(structure_lifetime[44],structure_lifetime[45]);
temp23=max(structure_lifetime[46],structure_lifetime[47]);
temp24=max(structure_lifetime[48],structure_lifetime[49]);
temp25=max(structure_lifetime[50],structure_lifetime[51]);
temp26=max(structure_lifetime[52],structure_lifetime[53]);
temp27=max(structure_lifetime[54],structure_lifetime[55]);
temp28=max(structure_lifetime[56],structure_lifetime[57]);
temp29=max(structure_lifetime[58],structure_lifetime[59]);

temp30=max(structure_lifetime[60],structure_lifetime[61]);
temp31=max(structure_lifetime[62],structure_lifetime[63]);
temp32=max(structure_lifetime[64],structure_lifetime[65]);
temp33=max(structure_lifetime[66],structure_lifetime[67]);
temp34=max(structure_lifetime[68],structure_lifetime[69]);




temp35=max(temp0,temp1);
temp36=max(temp2,temp3);
temp37=max(temp4,temp5);
temp38=max(temp6,temp7);
temp39=max(temp10,temp11);
temp40=max(temp12,temp13);
temp41=max(temp14,temp15);
temp42=max(temp16,temp17);
temp43=max(temp18,temp19);

temp44=max(temp20,temp21);
temp45=max(temp22,temp23);
temp46=max(temp24,temp25);
temp47=max(temp26,temp27);
temp48=max(temp28,temp29);

temp49=max(temp30,temp31);
temp50=max(temp32,temp33);
temp51=max(temp34,temp35);
temp52=max(temp36,temp37);
temp53=max(temp38,temp39);

temp54=max(temp40,temp41);
temp55=max(temp42,temp43);
temp56=max(temp44,temp45);
temp57=max(temp46,temp47);
temp58=max(temp48,temp49);

temp59=max(temp50,temp51);
temp60=max(temp52,temp53);
temp61=max(temp54,temp55);
temp62=max(temp56,temp57);
temp63=max(temp58,temp59);
temp64=max(temp60,temp61);
temp65=max(temp62,temp63);

//

temp0=max(temp35,temp36);
temp1=max(temp37,temp38);
temp2=max(temp39,temp40);
temp3=max(temp41,temp42);
temp4=max(temp43,temp44);
temp5=max(temp45,temp46);
temp6=max(temp47,temp48);

temp7=max(temp49,temp50);
temp8=max(temp51,temp52);
temp9=max(temp53,temp54);
temp10=max(temp55,temp56);
temp11=max(temp57,temp58);

temp12=max(temp59,temp60);
temp13=max(temp61,temp62);
temp14=max(temp63,temp64);

//
temp35=max(temp0,temp1);
temp36=max(temp2,temp3);
temp37=max(temp4,temp5);
temp38=max(temp6,temp7);
temp39=max(temp10,temp11);
temp40=max(temp12,temp13);
temp41=max(temp65,temp14);
//

temp52=max(temp36,temp37);
//
temp53=max(temp38,temp39);
temp54=max(temp40,temp41);
//
temp55=max(temp35,temp52);
temp56=max(temp53,temp54);



totallife=max(temp55,temp56); /* This is the final lifetime of the processor for
this iteration of the Monte-Carlo algorithm. */

mttftotal+=totallife;	

//printf("mttf %f\n",totallife);

} /* end Monte-Carlo iterations */

finalmttf=mttftotal/totalruns; /* The average across all iterations of the
Monte-Carlo algorithm give the final MTTF of the processor. */ 

printf("Lognormal MTTF of the series-parallel processor with FIT values from %s is %f\n",fitfile,finalmttf);

} /* end main()*/


int read_fits(char *fitfile)
{
        int tempvar=0;
        int structure_count=0; /* Variable to keep track of structures */
        int fail_count=0; 	   /* Variable to keep track of failure mechs */
        float tempfit=0.0;
        char s[100];

        FILE *fp = fopen(fitfile,"r");	/* Open file containing FIT values from
		RAMP */


        if(!fp)
        {
                printf("ERROR - Can't open FIT file %s \n",fitfile);
        }

        for (fail_count=0;fail_count<5;fail_count++)
        {
        for (structure_count=0;structure_count<64;structure_count++)
        {
                fgets(s,1000,fp);
                tempvar =   sscanf(s,"%f",&tempfit);
                fits[fail_count][structure_count]=tempfit;
        }
        }

        fclose(fp);
        return 0;
}















