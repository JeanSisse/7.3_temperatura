#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <strings.h>
#include <math.h>
#include coef.h

#define TAM 200
#define XX  3
#define YY  3
#define MAX_AMOSTRAS_ENTRADA 500
#define MAX_INERCIA_TERMICA 20

int separador(char car)
 {
  switch(car)
   { case ' ': case '\n': case '\t': case '\r': return 1;
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
 // ROTINA PARA LER UMA LINHA
/**********************************************************************/
int getline_file(char *word, int limit, FILE *p1)
{   int    i = 0;
    char   c;

    while ((c = getc(p1)) != '\n') {
        if (c == EOF)
            return 0;
        word[i] = c;
        if(++i==limit) 
             { 
               fflush(stdout);
               exit(1); 
             }
    }

    word[i] = 0x00;   // TIRA O \n  DA STRING

    return 1;
}



//-------------------------------------------------------------------------------
int main(int argc, char *argv[])
//-------------------------------------------------------------------------------
{
  FILE *fp[4];
  
  int idx, inercia_termica;
  
  float coeficientes[3][YY*XX][MAX_INERCIA_TERMICA];
   
  int  amostra, i,x,y;
  char line[TAM], wd[TAM];

	if (argc!=5) {
		puts("*******************************************************************************");
		puts("*         PROGRAMA QUE GERA O MODELO DE TEMPERATURA        ");
		printf("* %s <NOME_DO_ARQUIVO_COEFICIENTES_DIAGONAIS> <NOME_DO_ARQUIVO_COEFICIENTES_MEIO> <NOME_DO_ARQUIVO_COEFICIENTES_CENTROS_LATERAIS> <NOME_DO_ARQUIVO_ENTRADA_POWER>\n", argv[0]);
		puts("*******************************************************************************\n");
		return(0);
	}

	//
	// read four files
	// 
	if ((fp[0] = fopen( argv[1], "r")) == NULL)        { printf("Erro abrindo o arquivo  %s\n", argv[1]);  return 0; }
	if ((fp[1] = fopen( argv[2], "r")) == NULL)        { printf("Erro abrindo o arquivo  %s\n", argv[2]);  return 0; }   
	if ((fp[2] = fopen( argv[3], "r")) == NULL)        { printf("Erro abrindo o arquivo  %s\n", argv[3]);  return 0; }
	if ((fp[3] = fopen( argv[4], "r")) == NULL)        { printf("Erro abrindo o arquivo  %s\n", argv[3]);  return 0; }
  
	for(idx=0; idx<3; idx++){
		inercia_termica = 0;

		while (getline_file(line, TAM, fp[idx]))
	    { 	
		    for( y=0; y<YY; y++){ 
				i = 0; 
		      	for( x=0; x<XX; x++){
					search_word(line, &i, wd);
		      	   // sscanf(aux,"%.10f", &coeficientes[idx][x+y*YY][inercia_termica]);
					coeficientes[idx][x+y*YY][inercia_termica]=atof(wd);
					printf("coef %f %d\n",atof(wd),idx);

		      	  }
		      }
		   inercia_termica++;
			printf("NUMERO DE AMOSTARAS1 %f\n",coeficientes[0][8][1]);

		   //printf("NUMERO DE AMOSTARAS %d\n", inercia_termica);

		   if (inercia_termica>MAX_INERCIA_TERMICA) { printf("INERCIA TERMICA MAIOR QUE O PERMITIDO %d\n", inercia_termica);  return 0; } 
		 }

	}
 
 
   fclose(fp[1]);
   fclose(fp[2]);
   fclose(fp[3]);
      
}
