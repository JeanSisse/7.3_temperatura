//------------------------------------------------------------------------------------------------
//
//  DISTRIBUTED HEMPS -  5.0
//
//  Research group: GAPH-PUCRS    -    contact   fernando.moraes@pucrs.br
//
//  Distribution:  September 2013
//
//  Source name:  ram_generator.c
//
//  Brief description:  This source receives parametrizable memory and creates the files related to memory
//
//------------------------------------------------------------------------------------------------

#include <stdio.h>

int main(int argc, char* argv[])
{
    unsigned char c1, c2, c3, c4;
    
	FILE *fp;
	fp = fopen(argv[1],"rb");
	if(fp==NULL){
		printf("Cannot open %s file",argv[1]);
	}
	
    if (argc < 2){
        printf("// memory data file (do not edit the following line - required for mem load use)\n");
        printf("// format=hex addressradix=h dataradix=h version=1.0 wordsperline=1\n");
        printf("@00000000\n");
    }
    while (!feof(fp)) {
		
		//fread(&c1,1,2,fp);
		//fread(&c2,1,2,fp);
		//fread(&c3,1,2,fp);
		//fread(&c4,1,2,fp);
        c1 = fgetc(fp) & 0x0ff;
        c2 = fgetc(fp) & 0x0ff;
        c3 = fgetc(fp) & 0x0ff;
        c4 = fgetc(fp) & 0x0ff;
        printf ("%.2x%.2x%.2x%.2x\n", c1, c2, c3, c4);
    }
    return 0;
}

