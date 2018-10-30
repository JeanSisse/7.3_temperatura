#include "coef.h"

#define TAM 200
#define XX  X-1
#define YY  X-1
#define MAX_AMOSTRAS_ENTRADA 500
#define MAX_INERCIA_TERMICA 20


int index = 0;  // tamanho da fila (numero de elementos)
int aux_temperatura = 0;

//-------------------------------------------------------------------------------
void temperature()
//-------------------------------------------------------------------------------
{
   
    int  i, j, g, index_aux;
    int  x_atual, y_atual;
    int  idx;
    int west1, east1, north1, south1, north1east1, south1east1, south1west1, north1west1, center;

	for(j=1; j < n_processor; j++){
			
		y_atual = (unsigned int)((j / X));
		x_atual = j - (y_atual) * X;
		
		if (!y_atual){ 
			if (!x_atual) 
			 	idx=0;
			else if (x_atual == XX)
			 	idx=1;
			else idx= 2;
		}
		else if (y_atual == YY){
				if (!x_atual)  idx=3;
				else if (x_atual == XX) idx=4;
				else idx= 5;
		}
		else{
			if ( !x_atual)  idx=6;
			else if (x_atual == XX) idx=7;
			else idx= 8;
		}

		west1 = x_atual  - 1;
		east1 = x_atual  + 1;
		north1 = y_atual + 1;
		south1 = y_atual - 1;

		for(g=0; g < inercia-1; g++){

			switch(idx) {
							
				case 0:						
					model_aux[index][j] = coeficientes_diagonal[energySlavesAcc_discretizado[x_atual][y_atual]][g][4] + coeficientes_lateral[energySlavesAcc_discretizado[east1][y_atual]][g][3] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][north1]][g][1] + coeficientes_meio[energySlavesAcc_discretizado[east1][north1]][g][0] + model_aux[index][j];
					index = (index + 1 ) % MAX_INERCIA_TERMICA;
					break;														
				case 1:											
					model_aux[index][j] = coeficientes_lateral[energySlavesAcc_discretizado[west1][y_atual]][g][5] + coeficientes_diagonal[energySlavesAcc_discretizado[x_atual][y_atual]][g][4] + coeficientes_meio[energySlavesAcc_discretizado[west1][north1]][g][2] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][north1]][g][7] + model_aux[index][j];
					index = (index + 1 ) % MAX_INERCIA_TERMICA;
					break;								
				case 2:		
					model_aux[index][j] = coeficientes_lateral[energySlavesAcc_discretizado[west1][y_atual]][g][3] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][y_atual]][g][4] + coeficientes_lateral[energySlavesAcc_discretizado[east1][y_atual]][g][5] + coeficientes_lateral[energySlavesAcc_discretizado[west1][north1]][g][6] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][north1]][g][7] + coeficientes_lateral[energySlavesAcc_discretizado[east1][north1]][g][8] + model_aux[index][j];
					index = (index + 1 ) % MAX_INERCIA_TERMICA;
					break;
				case 3:		
					model_aux[index][j] = coeficientes_lateral[energySlavesAcc_discretizado[x_atual][south1]][g][7] + coeficientes_meio[energySlavesAcc_discretizado[east1][south1]][g][6] + coeficientes_diagonal[energySlavesAcc_discretizado[x_atual][y_atual]][g][4] + coeficientes_lateral[energySlavesAcc_discretizado[east1][y_atual]][g][3] + model_aux[index][j];
					index = (index + 1 ) % MAX_INERCIA_TERMICA;                             //  0  1  2
					break;
				case 4:
					model_aux[index][j] = coeficientes_meio[energySlavesAcc_discretizado[west1][south1]][g][0] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][south1]][g][1] + coeficientes_lateral[energySlavesAcc_discretizado[west1][y_atual]][g][3] + coeficientes_diagonal[energySlavesAcc_discretizado[x_atual][y_atual]][g][4] + model_aux[index][j];
					index = (index + 1 ) % MAX_INERCIA_TERMICA;
					break;														
				case 5:
					model_aux[index][j] = coeficientes_lateral[energySlavesAcc_discretizado[west1][south1]][g][8] + coeficientes_meio[energySlavesAcc_discretizado[x_atual][south1]][g][7] + coeficientes_lateral[energySlavesAcc_discretizado[east1][south1]][g][6] + coeficientes_diagonal[energySlavesAcc_discretizado[west1][y_atual]][g][5] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][y_atual]][g][4] + coeficientes_diagonal[energySlavesAcc_discretizado[east1][y_atual]][g][3] + model_aux[index][j];
					index = (index + 1 ) % MAX_INERCIA_TERMICA;                                                                        //  0  1  2
					break;	
				case 6:		
					model_aux[index][j] = coeficientes_diagonal[energySlavesAcc_discretizado[x_atual][south1]][g][7] + coeficientes_lateral[energySlavesAcc_discretizado[east1][south1]][g][6] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][y_atual]][g][4] + coeficientes_meio[energySlavesAcc_discretizado[east1][y_atual]][g][3] + coeficientes_diagonal[energySlavesAcc_discretizado[x_atual][north1]][g][1] + coeficientes_lateral[energySlavesAcc_discretizado[east1][north1]][g][0] + model_aux[index][j];
					index = (index + 1 ) % MAX_INERCIA_TERMICA;
					break;							
				case 7:		
					model_aux[index][j] = coeficientes_lateral[energySlavesAcc_discretizado[west1][south1]][g][0] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][south1]][g][1] + coeficientes_lateral[energySlavesAcc_discretizado[west1][y_atual]][g][3] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][y_atual]][g][4] + coeficientes_lateral[energySlavesAcc_discretizado[west1][north1]][g][6] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][north1]][g][7] + model_aux[index][j];
					index = (index + 1 ) % MAX_INERCIA_TERMICA;
					break;
					case 8:		//ARRUMAR
					model_aux[index][j] = coeficientes_diagonal[energySlavesAcc_discretizado[west1][south1]][g][8] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][south1]][g][7] + coeficientes_diagonal[energySlavesAcc_discretizado[east1][south1]][g][6] + coeficientes_lateral[energySlavesAcc_discretizado[west1][y_atual]][g][5] + coeficientes_meio[energySlavesAcc_discretizado[x_atual][y_atual]][g][4] + coeficientes_lateral[energySlavesAcc_discretizado[east1][y_atual]][g][3] + coeficientes_diagonal[energySlavesAcc_discretizado[west1][north1]][g][2] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][north1]][g][1] + coeficientes_diagonal[energySlavesAcc_discretizado[east1][north1]][g][0] + model_aux[index][j];
					index = (index + 1 ) % MAX_INERCIA_TERMICA;
					break;							
			}
		}
		
		switch(idx) {
					
			case 0:					
				temperatura_restante[index][j] = coeficientes_diagonal[energySlavesAcc_discretizado[x_atual][y_atual]][inercia-1][4] + coeficientes_lateral[energySlavesAcc_discretizado[east1][y_atual]][inercia-1][3] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][north1]][inercia-1][1] + coeficientes_meio[energySlavesAcc_discretizado[east1][north1]][inercia-1][0] + temperatura_restante[index][j];
				index = (index + 1 ) % MAX_INERCIA_TERMICA;
				break;								
			case 1:									
				temperatura_restante[index][j] = coeficientes_lateral[energySlavesAcc_discretizado[west1][y_atual]][inercia-1][5] + coeficientes_diagonal[energySlavesAcc_discretizado[x_atual][y_atual]][inercia-1][4] + coeficientes_meio[energySlavesAcc_discretizado[west1][north1]][inercia-1][2] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][north1]][inercia-1][7] + temperatura_restante[index][j];
				index = (index + 1 ) % MAX_INERCIA_TERMICA;
				break;	
			case 2:				
				temperatura_restante[index][j] = coeficientes_lateral[energySlavesAcc_discretizado[west1][y_atual]][inercia-1][3] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][y_atual]][inercia-1][4] + coeficientes_lateral[energySlavesAcc_discretizado[east1][y_atual]][inercia-1][5] + coeficientes_lateral[energySlavesAcc_discretizado[west1][north1]][inercia-1][6] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][north1]][inercia-1][7] + coeficientes_lateral[energySlavesAcc_discretizado[east1][north1]][inercia-1][8] + temperatura_restante[index][j];
				index = (index + 1 ) % MAX_INERCIA_TERMICA;
				break;								
			case 3:
				temperatura_restante[index][j] = coeficientes_lateral[energySlavesAcc_discretizado[x_atual][south1]][inercia-1][7] + coeficientes_meio[energySlavesAcc_discretizado[east1][south1]][inercia-1][6] + coeficientes_diagonal[energySlavesAcc_discretizado[x_atual][y_atual]][inercia-1][4] + coeficientes_lateral[energySlavesAcc_discretizado[east1][y_atual]][inercia-1][3] + temperatura_restante[index][j];
				index = (index + 1 ) % MAX_INERCIA_TERMICA;
				break;								
			case 4:		
				temperatura_restante[index][j] = coeficientes_meio[energySlavesAcc_discretizado[west1][south1]][inercia-1][0] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][south1]][inercia-1][1] + coeficientes_lateral[energySlavesAcc_discretizado[west1][y_atual]][inercia-1][3] + coeficientes_diagonal[energySlavesAcc_discretizado[x_atual][y_atual]][inercia-1][4] + temperatura_restante[index][j];
				index = (index + 1 ) % MAX_INERCIA_TERMICA;
				break;
			case 5:
				temperatura_restante[index][j] = coeficientes_lateral[energySlavesAcc_discretizado[west1][south1]][inercia-1][8] + coeficientes_meio[energySlavesAcc_discretizado[x_atual][south1]][inercia-1][7] + coeficientes_lateral[energySlavesAcc_discretizado[east1][south1]][inercia-1][6] + coeficientes_diagonal[energySlavesAcc_discretizado[west1][y_atual]][inercia-1][5] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][y_atual]][inercia-1][4] + coeficientes_diagonal[energySlavesAcc_discretizado[east1][y_atual]][inercia-1][3] + temperatura_restante[index][j];
				index = (index + 1 ) % MAX_INERCIA_TERMICA;
				break;								
			case 6:
				temperatura_restante[index][j] = coeficientes_diagonal[energySlavesAcc_discretizado[x_atual][south1]][inercia-1][7] + coeficientes_lateral[energySlavesAcc_discretizado[east1][south1]][inercia-1][6] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][y_atual]][inercia-1][4] + coeficientes_meio[energySlavesAcc_discretizado[east1][y_atual]][inercia-1][3] + coeficientes_diagonal[energySlavesAcc_discretizado[x_atual][north1]][inercia-1][1] + coeficientes_lateral[energySlavesAcc_discretizado[east1][north1]][inercia-1][0] + temperatura_restante[index][j];
				index = (index + 1 ) % MAX_INERCIA_TERMICA;
				break;	
			case 7:
				temperatura_restante[index][j] = coeficientes_lateral[energySlavesAcc_discretizado[west1][south1]][inercia-1][0] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][south1]][inercia-1][1] + coeficientes_lateral[energySlavesAcc_discretizado[west1][y_atual]][inercia-1][3] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][y_atual]][inercia-1][4] + coeficientes_lateral[energySlavesAcc_discretizado[west1][north1]][inercia-1][6] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][north1]][inercia-1][7] + temperatura_restante[index][j];
				index = (index + 1 ) % MAX_INERCIA_TERMICA;
				break;								
			case 8:		//ARRUMAR
				temperatura_restante[index][j] = coeficientes_diagonal[energySlavesAcc_discretizado[west1][south1]][inercia-1][8] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][south1]][inercia-1][7] + coeficientes_diagonal[energySlavesAcc_discretizado[east1][south1]][inercia-1][6] + coeficientes_lateral[energySlavesAcc_discretizado[west1][y_atual]][inercia-1][5] + coeficientes_meio[energySlavesAcc_discretizado[x_atual][y_atual]][inercia-1][4] + coeficientes_lateral[energySlavesAcc_discretizado[east1][y_atual]][inercia-1][3] + coeficientes_diagonal[energySlavesAcc_discretizado[west1][north1]][inercia-1][2] + coeficientes_lateral[energySlavesAcc_discretizado[x_atual][north1]][inercia-1][1] + coeficientes_diagonal[energySlavesAcc_discretizado[east1][north1]][inercia-1][0] + temperatura_restante[index][j];
				index = (index + 1 ) % MAX_INERCIA_TERMICA;
				break;							
		}
		aux_temperatura = temperatura_restante[index][j] / 60;
		model_temperatura[j] = (model_aux[index][j] + aux_temperatura)/10 + model_temperatura[j];
		model_aux[index][j] = 0 ;
		index_aux = (index + 1 ) % MAX_INERCIA_TERMICA;
		temperatura_restante[index_aux][j] = temperatura_restante[index_aux][j] + temperatura_restante[index][j] - aux_temperatura;
		temperatura_restante[index][j]=0;

		puts("temperatura : "); puts(itoa(j)); puts(" "); puts(itoa(model_temperatura[j])); puts("\n");
	}
	index = (index + 1 ) % MAX_INERCIA_TERMICA;
}