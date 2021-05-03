function d_inv_M=derivate_inv_M(M, j, dJplus, A, dA, dj)
Jplus=j_pseudoinverse(j);
dM=-dJplus * A * j - Jplus * dA * j - Jplus * A * dj;
d_inv_M=-M\dM/M;