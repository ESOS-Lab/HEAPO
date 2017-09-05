#include "pos-lib.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char *argv[]) {
	{
	if(pos_create("FFT_obj") < 1){ 
		if(pos_map("FFT_obj") < 1){
			return 0;
		} 
	}
	}
	unsigned MAXSIZE;
	unsigned MAXWAVES;
	unsigned i,j;
	float *RealIn;
	float *ImagIn;
	float *RealOut;
	float *ImagOut;
	float *coeff;
	float *amp;
	int invfft=0;

	if (argc<3)
	{
		printf("Usage: fft <waves> <length> -i\n");
		printf("-i performs an inverse fft\n");
		printf("make <waves> random sinusoids");
		printf("<length> is the number of samples\n");
		exit(-1);
	}
	else if (argc==4)
		invfft = !strncmp(argv[3],"-i",2);
	MAXSIZE=atoi(argv[2]);
	MAXWAVES=atoi(argv[1]);
		
 srand(1);

 RealIn=(float*)malloc(sizeof(float)*MAXSIZE);
 ImagIn=(float*)malloc(sizeof(float)*MAXSIZE);
 RealOut=(float*)pos_malloc("FFT_obj", sizeof(float)*MAXSIZE);
 ImagOut=(float*)pos_malloc("FFT_obj", sizeof(float)*MAXSIZE);
 coeff=(float*)pos_malloc("FFT_obj", sizeof(float)*MAXWAVES);
 amp=(float*)pos_malloc("FFT_obj", sizeof(float)*MAXWAVES);

 /* Makes MAXWAVES waves of random amplitude and period */
	for(i=0;i<MAXWAVES;i++) 
	{
		coeff[i] = rand()%1000;
		amp[i] = rand()%1000;
	}
 for(i=0;i<MAXSIZE;i++) 
 {
   /*   RealIn[i]=rand();*/
	 RealIn[i]=0;
	 for(j=0;j<MAXWAVES;j++) 
	 {
		 /* randomly select sin or cos */
		 if (rand()%2)
		 {
		 		RealIn[i]+=coeff[j]*cos(amp[j]*i);
			}
		 else
		 {
		 	RealIn[i]+=coeff[j]*sin(amp[j]*i);
		 }
  	 ImagIn[i]=0;
	 }
 }

 /* regular*/
 fft_float (MAXSIZE,invfft,RealIn,ImagIn,RealOut,ImagOut);
 
 printf("RealOut:\n");
 for (i=0;i<MAXSIZE;i++)
   printf("%f \t", RealOut[i]);
 printf("\n");

printf("ImagOut:\n");
 for (i=0;i<MAXSIZE;i++)
   printf("%f \t", ImagOut[i]);
   printf("\n");

 	{
		if(RealIn < 0x7FFEF8000000 && RealIn >= 0x5FFEF8000000){
			pos_free("FFT_obj",RealIn);
		}else{
			free(RealIn);
		}
	}
 	{
		if(ImagIn < 0x7FFEF8000000 && ImagIn >= 0x5FFEF8000000){
			pos_free("FFT_obj",ImagIn);
		}else{
			free(ImagIn);
		}
	}
 	{
		if(RealOut < 0x7FFEF8000000 && RealOut >= 0x5FFEF8000000){
			pos_free("FFT_obj",RealOut);
		}else{
			free(RealOut);
		}
	}
 	{
		if(ImagOut < 0x7FFEF8000000 && ImagOut >= 0x5FFEF8000000){
			pos_free("FFT_obj",ImagOut);
		}else{
			free(ImagOut);
		}
	}
 	{
		if(coeff < 0x7FFEF8000000 && coeff >= 0x5FFEF8000000){
			pos_free("FFT_obj",coeff);
		}else{
			free(coeff);
		}
	}
 	{
		if(amp < 0x7FFEF8000000 && amp >= 0x5FFEF8000000){
			pos_free("FFT_obj",amp);
		}else{
			free(amp);
		}
	}
 exit(0);


}
