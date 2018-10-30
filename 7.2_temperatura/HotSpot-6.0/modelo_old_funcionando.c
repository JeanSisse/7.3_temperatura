#include <stdio.h>
#include <math.h>

#include "./coef.h"

#define TAM 200
#define XX  X-1
#define YY  X-1
#define MAX_AMOSTRAS_ENTRADA 500
#define MAX_INERCIA_TERMICA 20


//-------------------------------------------------------------------------------
int main(int argc, char *argv[])
//-------------------------------------------------------------------------------
{
   
    int  i, j, g;
    int  x_atual, y_atual;
    int  idx;
    int west, east, north, south, northeast, southeast, southwest, northwest, center;
 
	for(i=0; i < tamanho_entrada; i++){
		
		for(j=0; j < n_processor; j++){
											
				y_atual = floor((j / X));
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


				for(g=0; g < inercia; g++){
						
						switch(idx) {
							
							case 0:		
							
											
								model_aux[g+i+1][j] = coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_meio[entrada[i][northeast]][g][0] + model_aux[g+i+1][j];

																									//  6  7  8	
																									//  3  4  5
																									// |0| 1  2
							break;							
							
							case 1:	
																
								model_aux[g+i+1][j] = coeficientes_lateral[entrada[i][west]][g][5] + coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_meio[entrada[i][northwest]][g][2] + coeficientes_lateral[entrada[i][north]][g][7] + model_aux[g+i+1][j];

																									//  6  7  8
						                                                                            //  3  4  5
						                                                                            //  0  1 |2|
							break;							
							
							case 2:		
							
								model_aux[g+i+1][j] = coeficientes_lateral[entrada[i][west]][g][3] + coeficientes_lateral[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][5] + coeficientes_lateral[entrada[i][northwest]][g][6] + coeficientes_lateral[entrada[i][north]][g][7] + coeficientes_lateral[entrada[i][northeast]][g][8] + model_aux[g+i+1][j];
																									
																									//  6  7  8
						                                                                            //  3  4  5
						                                                                            //  0 |1| 2
							break;							
							
							case 3:		

									model_aux[g+i+1][j] = coeficientes_lateral[entrada[i][south]][g][7] + coeficientes_meio[entrada[i][southeast]][g][6] + coeficientes_diagonal[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + model_aux[g+i+1][j];

																									// |6| 7  8
						                                                                            //  3  4  5	
                                                                                                    //  0  1  2
							break;		
												
							case 4:		

									model_aux[g+i+1][j] = coeficientes_meio[entrada[i][southwest]][g][0] + coeficientes_lateral[entrada[i][south]][g][1] + coeficientes_lateral[entrada[i][west]][g][3] + coeficientes_diagonal[entrada[i][center]][g][4] + model_aux[g+i+1][j];

																									//  6  7 |8|
						                                                                            //  3  4  5	
                                                                                                    //  0  1  2
							break;	
													
							case 5:		

									model_aux[g+i+1][j] = coeficientes_lateral[entrada[i][southwest]][g][8] + coeficientes_meio[entrada[i][south]][g][7] + coeficientes_lateral[entrada[i][southeast]][g][6] + coeficientes_diagonal[entrada[i][west]][g][5] + coeficientes_lateral[entrada[i][center]][g][4] + coeficientes_diagonal[entrada[i][east]][g][3] + model_aux[g+i+1][j];

																									//  6 |7| 8
						                                                                            //  3  4  5	
                                                                                                    //  0  1  2
							break;	
													
							case 6:		
					
								model_aux[g+i+1][j] = coeficientes_diagonal[entrada[i][south]][g][7] + coeficientes_lateral[entrada[i][southeast]][g][6] + coeficientes_lateral[entrada[i][center]][g][4] + coeficientes_meio[entrada[i][east]][g][3] + coeficientes_diagonal[entrada[i][north]][g][1] + coeficientes_lateral[entrada[i][northeast]][g][0] + model_aux[g+i+1][j];

																									//  6  7  8
						                                                                            // |3| 4  5
						                                                                            //  0  1  2
							break;	
													
							case 7:		
									model_aux[g+i+1][j] = coeficientes_lateral[entrada[i][southwest]][g][0] + coeficientes_lateral[entrada[i][south]][g][1] + coeficientes_lateral[entrada[i][west]][g][3] + coeficientes_lateral[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][northwest]][g][6] + coeficientes_lateral[entrada[i][north]][g][7] + model_aux[g+i+1][j];

																									//  6  7  8
						                                                                            //  3  4 |5|
						                                                                            //  0  1  2
							break;
														
							case 8:		//ARRUMAR
								model_aux[g+i+1][j] = coeficientes_diagonal[entrada[i][southwest]][g][8] + coeficientes_lateral[entrada[i][south]][g][7] + coeficientes_diagonal[entrada[i][southeast]][g][6] + coeficientes_lateral[entrada[i][west]][g][5] + coeficientes_meio[entrada[i][center]][g][4] + coeficientes_lateral[entrada[i][east]][g][3] + coeficientes_diagonal[entrada[i][northwest]][g][2] + coeficientes_lateral[entrada[i][north]][g][1] + coeficientes_diagonal[entrada[i][northeast]][g][0] + model_aux[g+i+1][j];

																									//  6  7  8
                                                                                                    //  3 |4| 5
                                                                                                    //  0  1  2
							break;							
						}
					}        			

			model_temperatura[j] = ((model_aux[i+1][j])/100000000) + model_temperatura[j];
			
			printf("%2.9f\t",model_temperatura[j]);

		}
			printf ("\n");
	
	}
}
