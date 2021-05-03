function tau=region_controller(q,dq,xdes,dxdes,ddxdes,f_H,a_h,a_r,a_t,x_i,k_1,a,alpha,K_s,L,theta_,beta,sigma,w_s,iiwa)
% q joints position
% dq joints velocity
% xde position reference
% dxde velocity reference
% a_h H-DR radius
% a_r R-DR radius
% a_t TS-SS radius
% x_i time-invariant reference position
% k1,a positive constant in position dependent stiffness
% alpha sliding vector constant
% K_s sliding gain matrix
% theta dynamic parameter vector
% L positive non singular square matrix gain
% f_h interaction force
% beta,sigma interaction region defining constants [0,pi/2]
% w_s saturation term
T=iiwa.fkine(q');
xe=T.t ;                                                                   % forward kinematics
Delta_x=xe-xdes;                                                            % position error
norm(Delta_x)                                                           
region=dominant_region(Delta_x,a_h,a_r,a_t);                               % region evaluaion
w=weight_vector(Delta_x, region, a_r, a_t) ;                                % weighted vector  (10)
A=transition_matrix_A(xe, xdes, w , a_r, a_t)  ;                              % transition matrix A (7) 
x_d=x_i+eye(3)*w*(xdes-x_i)              ;                                    % weighted trajectory (5)
delta_x=xe-x_d;                                                               % weighted position error (4)
k_p=pos_stiffness(delta_x, k_1, a, a_h, region);                            % position dependent stiffness (17)
J=jacobiano(q);
J=J(1:3,:)                              ;                                    % Jacobian Rows number must be equal to  Operative space dimension 
dxe=J*dq                                   ;                                 % operation space velocity
d_Delta_x=dxe-dxdes;  
pinvJ=j_pseudoinverse(J);                                                   % velocity error
M=eye(7)-pinvJ*A*J      ;                                                  % Modifier Matrix (6)
dx_f=eye(3)*w*dxdes-A*dxdes;       
dqr=M\(pinvJ*dx_f-alpha*pinvJ*k_p*delta_x);                                 % derivate of virtual joint reference vector (8b)
s=dq-dqr;                                                                   % sliding vector (8)

s_x=J*s     ;                                                              % composite variable (20)
interact_region=force_diff(f_H, s_x, beta, sigma);                          % interaction region selctor
mu_s=saturation_func(s_x, w_s)  ;                                            % saturation function (23a)
mu_x=transition_smooth_func(region, a_r, a_h, Delta_x);                       % smooth transition function from HD and RD (23)
c_x=interaction_tem(interact_region, beta, sigma, f_H, s_x);                    %interaction term (22)
C_x=interaction_controller(mu_s, mu_x, c_x, f_H, region);                   % term of interaction controller (21)

%derivative terms
dj=derivate_jacobian(q,dq);
dj=dj(1:3,:);
djplus=derivate_Jplus(J,dj);
dA=derivate_A(Delta_x, d_Delta_x, xdes, dxdes, a_r, a_t, region);
d_delta_x = derivate_delta_x(dxe, dx_f, A);
d_inv_M=derivate_inv_M(M, J, djplus, A, dA, dj);
dk_p=derivate_kp(delta_x, d_delta_x, a_h, a, k_1, region);
dw=derivate_w(Delta_x, d_Delta_x, region, a_r, a_t);
dd_xf=derivate_dxf(w, dw, dxdes, ddxdes, A, dA);
ddqr=derivate_dqr(M,d_inv_M, delta_x,d_delta_x, pinvJ,djplus, dx_f, dd_xf ,alpha, k_p, dk_p);
Y_d=regressor(q, dq, dqr, ddqr);                                             %regressor matrix
dtheta=theta_estimate(Y_d, L, s);                                        % estimated dynamic parameter vector (9)
theta_cap=theta_+dtheta*0.001;
tau_m_a=-M'*J'*k_p*delta_x;                                                 % stiffnes controller (3a)
tau_m_b=-K_s*s ;                                                            % sliding controller (3b)
tau_m_c=Y_d*theta_ ;                                                         % sliding controller (3b)
global theta_
theta_=theta_cap;
tau_m=tau_m_a + tau_m_b + tau_m_c;                                              % motion-related controller (3)
tau_i=J'*C_x*0;                                                                 % interaction-related controller (19)

tau=tau_m+tau_i;                                                            % robot controller (2)