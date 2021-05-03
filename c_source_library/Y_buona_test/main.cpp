#include <iostream>
#include <math.h>
//#include "C:\Users\pc\Desktop\mex_test\Da C a MATLAB\Roba per testare compilatori\create_YB\YB\static_lib.h"
#include "C:\Users\pc\Desktop\mex_test\Da C a MATLAB\Roba per testare compilatori\create_YB\Y_buona\main.h"
using namespace std;
//extern “C” void regressor_B(double* q, double* ddqr, double* Y_B) ;
int main()
{
double *q;
double *ddqr;
double *dq;
double *dqr;
double *Y_B;
double *Y_G;
double *Y_C;

double q_vec[7]={1,1,1,1,1,1,1};
double dq_vec[7]={1,1,1,1,1,1,1};
double dqr_vec[7]={1,1,1,1,1,1,1};
double ddqr_vec[7]={1,1,1,1,1,1,1};

double YB_vec[441];
double YC_vec[441];
double YG_vec[441];

Y_B=YB_vec;
Y_C=YC_vec;
Y_G=YG_vec;

q=q_vec;
dq=dq_vec;
dqr=dqr_vec;
ddqr=ddqr_vec;




regressor_B( q, ddqr, Y_B );
regressor_G( q, Y_G );
regressor_C( q, dq, dqr, Y_C);

for(int i=0;i<441;i++){
cout << "Y[" << i << "]=" << *(Y_B +i) << endl;
}



    return 0;
}


