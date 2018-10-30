#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <strings.h>
#include <math.h>

#define TAM 300
#define XX  6
#define YY  6
#define MAX_AMOSTRAS 500

#define NME  4   ///  NUMERO  DE MESTRES NA ARQUITETURA

int separador(char car)
 {
  switch(car)
   { case ' ': case '.': case ',': case '\n': case '\t': case '\r': return 1;
     default: return 0;
   }
}

/***********************************
* Retorna uma string da linha lida *
***********************************/
int search_word(char *word, int *counter, char *token)
{
    int k = 0;

    while (separador(word[*counter]))
        (*counter)++;
    while (!separador(word[*counter]) && word[*counter] != '\0')
        token[k++] = word[(*counter)++];
    token[k] = '\0';
    return k;
}

/**********************************************************************/
 // ROTINA PARA LER UMA LINHA - BY MORAES
/**********************************************************************/
int getline_moraes(char *word, int limit, FILE *p1)
{   int    i = 0;
    char   c;

    while ((c = getc(p1)) != '\n') {
        if (c == EOF)
            return 0;
        word[i] = c;
        if(++i==limit) 
             { printf("\ERROR : line too large %s %d\n", word, (int)(strlen(word))); 
               fflush(stdout);
               exit(1); 
             }
    }

    word[i] = 0x00;   // TIRA O \n  DA STRING

    return 1;
}

//-------------------------------------------------------------------------------
//  ORDENA
//-------------------------------------------------------------------------------
void bubble_sort(int list[], int n)
{
  int c, d, t;
 
  for (c = 0 ; c < ( n - 1 ); c++)
  {
    for (d = 0 ; d < n - c - 1; d++)
    {
      if (list[d] < list[d+1])
      { t         = list[d];
        list[d]   = list[d+1];
        list[d+1] = t;
      }
    }
  }
}

     
//-------------------------------------------------------------------------------
int main(int argc, char *argv[])
//-------------------------------------------------------------------------------
{
  FILE *fp[3];
  
  int idx, free_processors[2], amostras[2];
  
  int instrucoes[2][MAX_AMOSTRAS][YY*XX];
  int inst_sort[2][MAX_AMOSTRAS][YY*XX]; 
   
  int  amostra, i,x,y, total_inst[2], totais[2][YY*XX], min[2], max[2], mediana[2], quart1[2], quart3[2], nb[2], somq3[2], somq1[2];
  int  media_quartil_1[2], media_quartil_3[2], media_mediana[2];
  char line[TAM], wd[TAM];
  float media[2], sum_deviation[2];

  if (argc!=3) {
     puts("*******************************************************************************");
     puts("*         PROGRAMA QUE LE OS ARQUIVOS DE CARGA        ");
     printf("* %s <NOME DO ARQUIVO_SC>   <NOME DO ARQUIVO_CC> \n", argv[0]);
     puts("*******************************************************************************\n");
     return(0);
  }

  //
  // read two files
  // 
  if ((fp[0] = fopen( argv[1], "r")) == NULL)        { printf("Erro abrindo o arquivo  %s\n", argv[1]);  return 0; }
  if ((fp[1] = fopen( argv[2], "r")) == NULL)        { printf("Erro abrindo o arquivo  %s\n", argv[2]);  return 0; }   
 
  for(idx=0; idx<2; idx++)            
  {	  amostras[idx] = 0;
 	  while (getline_moraes(line, TAM, fp[idx]))
	    { i = 0; 
	      search_word(line, &i, wd);
	      search_word(line, &i, wd);    // encontra PARTIAL
	      
	      if( !strcmp(wd,"PARTIAL") )
	      {	//getline_moraes(line, TAM, fp);     // linha em branco   	
		    for( y=0; y<YY; y++)
		      { i = 0; 
		      	getline_moraes(line, TAM, fp[idx]); 
		      	for( x=0; x<XX; x++)
		      	  {   search_word(line, &i, wd);
		      	      sscanf(wd,"%d", &instrucoes[idx][amostras[idx]][x+y*YY]);
		      	      sscanf(wd,"%d", &inst_sort[idx][amostras[idx]][x+y*YY]);
		      	  }
		      }
	       // ordena a carga dos processadores
	       bubble_sort(inst_sort[idx][amostras[idx]], XX*YY);       
		   amostras[idx]++;
		   if (amostras[idx]>MAX_AMOSTRAS) { printf("EXCESSO DE AMOSTRAS NO ARQUIVO DE DADOS %d\n", amostras[idx]);  return 0; } 
		 }
	    }
   }     
   fclose(fp[0]);
   fclose(fp[1]);
   

   // 
   //  DEFINE O MAIOR numero de amostras  
   //
   if (amostras[0]>amostras[1])  amostra=amostras[0];  else amostra=amostras[1];


   printf("NUMERO DE AMOSTARAS %d\n", amostra);
   

   // ZERA OS CONTADORES de total de instruções
   for( y=0; y<YY*XX; y++)    totais[0][y]=totais[1][y]=0;
   
  
   //
   // IMPRIME AS ESTATÍSTICAS POR AMOSTRA
   //	  
  fp[0] = fopen( "sem.txt", "w");
  fp[1] = fopen( "com.txt", "w");
  fp[2] = fopen( "stddev.txt", "w");


  ////  só calcula o somatório dos quartis, para ter a média destes na plotagem
 for(i=0; i<amostra; i++)
      { free_processors[0] = free_processors[1] = 0;
        
       // processadores free
       for(idx=0; idx<2; idx++)            
         for( y=0; y<XX*YY; y++) 
              if (!instrucoes[idx][i][y])  free_processors[idx]++;    // os free processors já consideram o mestre   ****IMPORTANTÍSSIMO - OS MESTRES DEVEM TER CARGA ZERO               
        
      for(idx=0; idx<2; idx++) 
          {   nb[idx] = XX*YY-free_processors[idx];                              // número de processadores utilizados
              media_mediana[idx] +=   inst_sort[idx][i][nb[idx]/2];
              quart1[idx] =    inst_sort[idx][i][3*nb[idx]/4];
              quart3[idx] =    inst_sort[idx][i][nb[idx]/4];
              somq3[idx]  +=   quart3[idx];
              somq1[idx]  +=   quart1[idx];
          }
       } 
   media_quartil_1[0] = somq1[0]/amostras[0];
   media_quartil_1[1] = somq1[1]/amostras[1];
   media_quartil_3[0] = somq3[0]/amostras[0];
   media_quartil_3[1] = somq3[1]/amostras[1];   
   media_mediana[0] = media_mediana[0]/amostras[0];
   media_mediana[1] = media_mediana[1]/amostras[1];

   fprintf(fp[0],"# Data columns: X Min 1stQuartile Median 3rdQuartile Max BoxWidth  media\n");   
   fprintf(fp[1],"# Data columns: X Min 1stQuartile Median 3rdQuartile Max BoxWidth  media\n");  


   for(i=0; i<amostra; i++)
      { media[0] = media[1] = 0.0;
        sum_deviation[0] = sum_deviation[1] = 0.0;
        free_processors[0] = free_processors[1] = 0;
        
       // acumula o total de instruções na amostragem para os 2 casos
       for(idx=0; idx<2; idx++)            
       for( y=0; y<XX*YY; y++) 
 	  	     {  totais[idx][y] += instrucoes[idx][i][y];
 	  	        media[idx]        += instrucoes[idx][i][y];
 	  	        if (!instrucoes[idx][i][y])  free_processors[idx]++;    // os free processors já consideram o mestre   ****IMPORTANTÍSSIMO - OS MESTRES DEVEM TER CARGA ZERO
 	  	     } 	
     	    	  	      
 	    media[0] = media[0] / (XX*YY-free_processors[0]) ;     /// a media desconsidera os mestres e os processadores livres
 	    media[1] = media[1] / (XX*YY-free_processors[1]) ;     /// a media desconsidera os mestres e os processadores livres
        
 	  	// calcula o desvio padrao
 	  	for(idx=0; idx<2; idx++) 
        for( y=0; y<XX*YY-4; y++)  // evita os PROCESSADORES COM CARGA ZERO
          if (instrucoes[idx][i][y])
          {   
              sum_deviation[idx] += (instrucoes[idx][i][y]-media[idx]) *  (instrucoes[idx][i][y]-media[idx]);
      
              nb[idx] = XX*YY-free_processors[idx];                              // número de processadores utilizados
              //nb[idx] = XX*YY - NME;  
              mediana[idx] =   inst_sort[idx][i][nb[idx]/2];
              min[idx] =       inst_sort[idx][i][nb[idx]-1];   
              max[idx] =       inst_sort[idx][i][0] ;                           
              quart1[idx] =    inst_sort[idx][i][3*nb[idx]/4];
              quart3[idx] =    inst_sort[idx][i][nb[idx]/4];
          }
      
      // if(i==1) { puts("\n");  for( y=0; y<YY; y++)   for( x=0; x<XX; x++)   printf("%d ", inst_sort[1][i][x+y*YY]); puts("\n"); }    // debug purposes

      // Data columns: X     Min   1stQuartile  Median      3rdQuartile   Max    BoxWidth 
      if(i<amostras[0])    
       fprintf(fp[0], "  %3d    %6d       %6d         %6d        %6d         %d    0.2  %.0f        %d                    %d                %d        %.2f\n",   
                         i,   min[0], quart1[0],  mediana[0],   quart3[0],  max[0], media[0], media_quartil_1[0], media_quartil_3[0], media_mediana[0], (float) sqrt(sum_deviation[0]/nb[0]));
                               
      if(i<amostras[1])    
       fprintf(fp[1], "  %3d    %6d       %6d         %6d        %6d         %d     0.2  %.0f       %d                    %d                %d        %.2f\n",   
                        i,   min[1], quart1[1],  mediana[1],   quart3[1],  max[1], media[1], media_quartil_1[1], media_quartil_3[1], media_mediana[1], (float) sqrt(sum_deviation[1]/nb[1]));


       fprintf(fp[2], " %d  ", i);
       if(i<amostras[0])   fprintf(fp[2], "%0.f ",  (float) sqrt(sum_deviation[0]/nb[0]));   else fprintf(fp[2], "0 ");
       if(i<amostras[1])   fprintf(fp[2], "%0.f\n",  (float) sqrt(sum_deviation[1]/nb[1]));  else fprintf(fp[2], "0\n");
        

      } 
    
   fclose(fp[0]);
   fclose(fp[1]);
   fclose(fp[2]);


    //
    // IMPRIME TOTAIS DE INSTRUÇÕES
    //	  
	printf("\n\nTOTAL INSTRUCTIONS\n");	
  	for(idx=0; idx<2; idx++) 
    {
	   total_inst[idx] = 0;
	   sum_deviation[idx] = 0.0;
	
	   if (!idx)     printf("\nSEM CARGA \n");   else    printf("\nCOM CARGA \n");

	   for( y=0; y<YY; y++) 
	 	  	{ for( x=0; x<XX; x++) 
	 	  	     { printf("%8d;", totais[idx][x+y*YY]);
	 	  	       total_inst[idx] += totais[idx][x+y*YY];
	 	  	     }
	 	  	   printf("\n");
	 	  	}
	 	  	
	  	media[idx] = total_inst[idx] / (XX*YY-NME) ;  	
	
	 	 // calcula o desvio padrao
	     for( y=0; y<YY; y++)
	         for( x=0; x<XX; x++) 
	               sum_deviation[idx] += (totais[idx][x+y*YY]-media[idx]) *  (totais[idx][x+y*YY]-media[idx]); 
	              
    }
    
    
	printf("\n\n;;;;total inst; agv inst; stddev inst.\n");               
	printf(";;;SEM;%d;%.0f;%.0f\n", total_inst[0], media[0], sqrt(sum_deviation[0]/(XX*YY-NME)));  	
	printf(";;;COM;%d;%.0f;%.0f\n", total_inst[1], media[1], sqrt(sum_deviation[1]/(XX*YY-NME)));  	
	
	return(1);
     

}
