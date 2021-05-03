function ddqr=derivate_dqr(M,d_inv_M, delta_x,d_delta_x, Jplus,djplus, d_xf, dd_xf ,alpha, k_p,dk_p)

dot1= d_inv_M * (Jplus * d_xf) - d_inv_M * (alpha * Jplus * k_p * delta_x);
dot2=M\(djplus*d_xf) + M\(Jplus*dd_xf);
dot3= - M\(alpha * djplus * k_p * delta_x) - M\(alpha * Jplus * dk_p * delta_x) - M\(alpha * Jplus * k_p * d_delta_x);

ddqr=dot1+dot2+dot3;