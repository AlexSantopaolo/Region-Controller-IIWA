#ifndef __MAIN_H__
#define __MAIN_H__

#include <windows.h>

/*  To use this exported function of dll, include this header
 *  in your project.
 */

#ifdef BUILD_DLL
    #define DLL_EXPORT __declspec(dllexport)
#else
    #define DLL_EXPORT __declspec(dllimport)
#endif


#ifdef __cplusplus
extern "C"
{
#endif

void DLL_EXPORT regressor_B(double *q, double *ddqr, double *Y_B);
void DLL_EXPORT regressor_G(double *q, double *Y_G);
void DLL_EXPORT regressor_C(double *q, double *dq, double *dqr, double *Y_C);
#ifdef __cplusplus
}
#endif

#endif // __MAIN_H__
