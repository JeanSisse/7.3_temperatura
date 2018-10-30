/*
 * cons.c
 *
 *  Created on: 07/03/2013
 *      Author: mruaro
 */

#include <task.h>
#include <stdlib.h>


Message msg;

int main()
{

	int i;
	volatile int p;

	Echo("Inicio da aplicacao cons");
	Echo(itoa(GetTick()));

	for(i=0; i<SYNTHETIC_ITERATIONS; i++){

		Receive(&msg, prod);
	}


	Echo("Fim da aplicacao cons");
	Echo(itoa(GetTick()));

	exit();

}


