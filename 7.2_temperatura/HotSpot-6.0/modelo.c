#include <stdio.h>
#include <math.h>

#include "./coef.h"

#define TAM 200
#define XX  X-1
#define YY  X-1
#define MAX_AMOSTRAS_ENTRADA 500
#define MAX_INERCIA_TERMICA 20


int index = 0;  // tamanho da fila (numero de elementos)


//-------------------------------------------------------------------------------
int main(int argc, char *argv[])
//-------------------------------------------------------------------------------
{
   
    int  i, j, g;
    int  x_atual, y_atual;
    int  idx;
    int west, east, north, south, northeast, southeast, southwest, northwest, center;
 
	//for(i=0; i < tamanho_entrada; i++){
		
			
			j=0;											
			//	y_atual = floor((j / X));
				x_atual = j - (y_atual) * X;
				
				if (!y_atual) { 
					 if ( !x_atual)  idx=0;
					 else if (x_atual == XX) idx=1;
					 else idx= 2;
				 }
				else if (y_atual == YY){
						 if ( !x_atual)  idx=3;
						 else if (x_atual == XX) idx=4;
						 else idx= 5;
					}
				else{
					if ( !x_atual)  idx=6;
					else if (x_atual == XX) idx=7;
					else idx= 8;
				}


				west = j--;
				east = j++;
				north = j+X;
				south = j-X;
				northeast = j+X+1;
				southeast = j-X+1;
				southwest = j-X-1;
				northwest = j+X-1;
				center = j;

				
				g=0;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
				
						}
							g=1;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
					
						}
							g=2;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
										
						}
							g=3;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
							
							
						}
							g=4;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=5;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=6;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=7;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=8;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=9;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=10;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=11;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=12;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=13;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=14;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=15;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=16;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=17;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=18;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=19;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
			


			model_temperatura[j] = ((model_aux[index][j])/100000000) + model_temperatura[j];
			model_aux[index][j] = 0 ;			
			j=1;										
			//	y_atual = floor((j / X));
				x_atual = j - (y_atual) * X;
				
				if (!y_atual) { 
					 if ( !x_atual)  idx=0;
					 else if (x_atual == XX) idx=1;
					 else idx= 2;
				 }
				else if (y_atual == YY){
						 if ( !x_atual)  idx=3;
						 else if (x_atual == XX) idx=4;
						 else idx= 5;
					}
				else{
					if ( !x_atual)  idx=6;
					else if (x_atual == XX) idx=7;
					else idx= 8;
				}


				west = j--;
				east = j++;
				north = j+X;
				south = j-X;
				northeast = j+X+1;
				southeast = j-X+1;
				southwest = j-X-1;
				northwest = j+X-1;
				center = j;

				
				g=0;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
				
						}
							g=1;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
					
						}
							g=2;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
										
						}
							g=3;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
							
							
						}
							g=4;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=5;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=6;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=7;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=8;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=9;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=10;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=11;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=12;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=13;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=14;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=15;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=16;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=17;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=18;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=19;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
			


			model_temperatura[j] = ((model_aux[index][j])/100000000) + model_temperatura[j];
			model_aux[index][j] = 0 ;			
			j=2;										
			//	y_atual = floor((j / X));
				x_atual = j - (y_atual) * X;
				
				if (!y_atual) { 
					 if ( !x_atual)  idx=0;
					 else if (x_atual == XX) idx=1;
					 else idx= 2;
				 }
				else if (y_atual == YY){
						 if ( !x_atual)  idx=3;
						 else if (x_atual == XX) idx=4;
						 else idx= 5;
					}
				else{
					if ( !x_atual)  idx=6;
					else if (x_atual == XX) idx=7;
					else idx= 8;
				}


				west = j--;
				east = j++;
				north = j+X;
				south = j-X;
				northeast = j+X+1;
				southeast = j-X+1;
				southwest = j-X-1;
				northwest = j+X-1;
				center = j;

				
				g=0;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
				
						}
							g=1;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
					
						}
							g=2;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
										
						}
							g=3;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
							
							
						}
							g=4;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=5;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=6;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=7;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=8;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=9;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=10;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=11;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=12;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=13;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=14;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=15;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=16;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=17;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=18;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=19;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
			


			model_temperatura[j] = ((model_aux[index][j])/100000000) + model_temperatura[j];
			model_aux[index][j] = 0 ;			
			j=3;											
			//	y_atual = floor((j / X));
				x_atual = j - (y_atual) * X;
				
				if (!y_atual) { 
					 if ( !x_atual)  idx=0;
					 else if (x_atual == XX) idx=1;
					 else idx= 2;
				 }
				else if (y_atual == YY){
						 if ( !x_atual)  idx=3;
						 else if (x_atual == XX) idx=4;
						 else idx= 5;
					}
				else{
					if ( !x_atual)  idx=6;
					else if (x_atual == XX) idx=7;
					else idx= 8;
				}


				west = j--;
				east = j++;
				north = j+X;
				south = j-X;
				northeast = j+X+1;
				southeast = j-X+1;
				southwest = j-X-1;
				northwest = j+X-1;
				center = j;

				
				g=0;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
				
						}
							g=1;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
					
						}
							g=2;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
										
						}
							g=3;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
							
							
						}
							g=4;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=5;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=6;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=7;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=8;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=9;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=10;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=11;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=12;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=13;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=14;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=15;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=16;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=17;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=18;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=19;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
			


			model_temperatura[j] = ((model_aux[index][j])/100000000) + model_temperatura[j];
			model_aux[index][j] = 0 ;			
			j=4;											
			//	y_atual = floor((j / X));
				x_atual = j - (y_atual) * X;
				
				if (!y_atual) { 
					 if ( !x_atual)  idx=0;
					 else if (x_atual == XX) idx=1;
					 else idx= 2;
				 }
				else if (y_atual == YY){
						 if ( !x_atual)  idx=3;
						 else if (x_atual == XX) idx=4;
						 else idx= 5;
					}
				else{
					if ( !x_atual)  idx=6;
					else if (x_atual == XX) idx=7;
					else idx= 8;
				}


				west = j--;
				east = j++;
				north = j+X;
				south = j-X;
				northeast = j+X+1;
				southeast = j-X+1;
				southwest = j-X-1;
				northwest = j+X-1;
				center = j;

				
				g=0;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
				
						}
							g=1;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
					
						}
							g=2;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
										
						}
							g=3;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
							
							
						}
							g=4;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=5;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=6;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=7;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=8;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=9;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=10;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=11;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=12;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=13;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=14;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=15;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=16;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=17;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=18;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=19;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
			


			model_temperatura[j] = ((model_aux[index][j])/100000000) + model_temperatura[j];
			model_aux[index][j] = 0 ;			
			j=5;											
			//	y_atual = floor((j / X));
				x_atual = j - (y_atual) * X;
				
				if (!y_atual) { 
					 if ( !x_atual)  idx=0;
					 else if (x_atual == XX) idx=1;
					 else idx= 2;
				 }
				else if (y_atual == YY){
						 if ( !x_atual)  idx=3;
						 else if (x_atual == XX) idx=4;
						 else idx= 5;
					}
				else{
					if ( !x_atual)  idx=6;
					else if (x_atual == XX) idx=7;
					else idx= 8;
				}


				west = j--;
				east = j++;
				north = j+X;
				south = j-X;
				northeast = j+X+1;
				southeast = j-X+1;
				southwest = j-X-1;
				northwest = j+X-1;
				center = j;

				
				g=0;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
				
						}
							g=1;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
					
						}
							g=2;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
										
						}
							g=3;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
							
							
						}
							g=4;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=5;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=6;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=7;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=8;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=9;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=10;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=11;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=12;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=13;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=14;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=15;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=16;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=17;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=18;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=19;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
			


			model_temperatura[j] = ((model_aux[index][j])/100000000) + model_temperatura[j];
			model_aux[index][j] = 0 ;			
			j=6;											
			//	y_atual = floor((j / X));
				x_atual = j - (y_atual) * X;
				
				if (!y_atual) { 
					 if ( !x_atual)  idx=0;
					 else if (x_atual == XX) idx=1;
					 else idx= 2;
				 }
				else if (y_atual == YY){
						 if ( !x_atual)  idx=3;
						 else if (x_atual == XX) idx=4;
						 else idx= 5;
					}
				else{
					if ( !x_atual)  idx=6;
					else if (x_atual == XX) idx=7;
					else idx= 8;
				}


				west = j--;
				east = j++;
				north = j+X;
				south = j-X;
				northeast = j+X+1;
				southeast = j-X+1;
				southwest = j-X-1;
				northwest = j+X-1;
				center = j;

				
				g=0;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
				
						}
							g=1;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
					
						}
							g=2;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
										
						}
							g=3;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
							
							
						}
							g=4;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=5;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=6;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=7;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=8;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=9;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=10;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=11;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=12;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=13;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=14;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=15;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=16;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=17;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=18;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=19;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
			


			model_temperatura[j] = ((model_aux[index][j])/100000000) + model_temperatura[j];
			model_aux[index][j] = 0 ;			
			j=7;											
			//	y_atual = floor((j / X));
				x_atual = j - (y_atual) * X;
				
				if (!y_atual) { 
					 if ( !x_atual)  idx=0;
					 else if (x_atual == XX) idx=1;
					 else idx= 2;
				 }
				else if (y_atual == YY){
						 if ( !x_atual)  idx=3;
						 else if (x_atual == XX) idx=4;
						 else idx= 5;
					}
				else{
					if ( !x_atual)  idx=6;
					else if (x_atual == XX) idx=7;
					else idx= 8;
				}


				west = j--;
				east = j++;
				north = j+X;
				south = j-X;
				northeast = j+X+1;
				southeast = j-X+1;
				southwest = j-X-1;
				northwest = j+X-1;
				center = j;

				
				g=0;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
				
						}
							g=1;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
					
						}
							g=2;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
										
						}
							g=3;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
							
							
						}
							g=4;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=5;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=6;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=7;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=8;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=9;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=10;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=11;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=12;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=13;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=14;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=15;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=16;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=17;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=18;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=19;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
			


			model_temperatura[j] = ((model_aux[index][j])/100000000) + model_temperatura[j];
			model_aux[index][j] = 0 ;			
			j=8;										
			//	y_atual = floor((j / X));
				x_atual = j - (y_atual) * X;
				
				if (!y_atual) { 
					 if ( !x_atual)  idx=0;
					 else if (x_atual == XX) idx=1;
					 else idx= 2;
				 }
				else if (y_atual == YY){
						 if ( !x_atual)  idx=3;
						 else if (x_atual == XX) idx=4;
						 else idx= 5;
					}
				else{
					if ( !x_atual)  idx=6;
					else if (x_atual == XX) idx=7;
					else idx= 8;
				}


				west = j--;
				east = j++;
				north = j+X;
				south = j-X;
				northeast = j+X+1;
				southeast = j-X+1;
				southwest = j-X-1;
				northwest = j+X-1;
				center = j;

				
				g=0;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
				
						}
							g=1;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
					
						}
							g=2;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
										
						}
							g=3;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
							
							
						}
							g=4;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=5;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=6;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=7;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=8;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=9;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=10;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=11;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=12;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=13;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=14;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=15;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=16;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=17;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=18;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
							g=19;						
						switch(idx) {
							
							case 0:		
									
								model_aux[index][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[index][j];
								index = (index + 1 ) % MAX_INERCIA_TERMICA;

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
													}
			


			model_temperatura[j] = ((model_aux[index][j])/100000000) + model_temperatura[j];
			model_aux[index][j] = 0 ;
			//printf("%d index\n",index);

			

			//printf("%2.9f\t",model_temperatura[j]);

		
		//	index = (index + 1 ) % MAX_INERCIA_TERMICA;

			//printf ("\n");
	
	//}
}

