% Begore launch, Run Path_robot and Corke_model
%%
addpath('controller_utility');
addpath('c_source_library/Y_buona');
addpath('c_source_library/Y_buona/bin/Debug');
loadlibrary('Y_buona','main.h')
%% Parametri
clc
a_h=0.05;
a_r=0.1;
a_t=0.2;
k_1=5;
omega=0.1;
a=100;
alpha=0.5;
K_s=50*eye(7);
beta=pi/6;
sigma=pi/2;
w_s=0.01;
L=eye(63)*30;

q=[0,0,0,-pi/2,0,pi/2,0]';
dq=zeros(7,1);
ddq=zeros(7,1);
iiwa.nofriction();

e=zeros(3,length(t));

theta_true=[3.45250000000000,0.0218300000000000,0,0,0.00770300000000000,-0.00388700000000000,0.0208300000000000,0,0.000100000000000000,3.48210000000000,0.0207600000000000,0,-0.00362600000000000,0.0217900000000000,0,0.00779000000000000,0,0.000100000000000000,4.05623000000000,0.0320400000000000,0,0,0.00972000000000000,0.00622700000000000,0.0304200000000000,0,0.000100000000000000,3.48220000000000,0.0217800000000000,0,0,0.0207500000000000,-0.00362500000000000,0.00778500000000000,0,0.000100000000000000,2.16330000000000,0.0128700000000000,0,0,0.00570800000000000,-0.00394600000000000,0.0111200000000000,0,0.000100000000000000,2.34660000000000,0.00650900000000000,0,0,0.00625900000000000,0.000318910000000000,0.00452700000000000,0,0.000100000000000000,3.12900000000000,0.0146400000000000,0.000591200000000000,0,0.0146500000000000,0,0.00287200000000000,0,0.000100000000000000]';
global theta_;
%theta_=zeros(63,1);
theta_=[3.45250000000000,0.0218300000000000,0,0,0.00770300000000000,-0.00388700000000000,0.0208300000000000,0,0.000100000000000000,3.48210000000000,0.0207600000000000,0,-0.00362600000000000,0.0217900000000000,0,0.00779000000000000,0,0.000100000000000000,4.05623000000000,0.0320400000000000,0,0,0.00972000000000000,0.00622700000000000,0.0304200000000000,0,0.000100000000000000,3.48220000000000,0.0217800000000000,0,0,0.0207500000000000,-0.00362500000000000,0.00778500000000000,0,0.000100000000000000,2.16330000000000,0.0128700000000000,0,0,0.00570800000000000,-0.00394600000000000,0.0111200000000000,0,0.000100000000000000,2.34660000000000,0.00650900000000000,0,0,0.00625900000000000,0.000318910000000000,0.00452700000000000,0,0.000100000000000000,3.12900000000000,0.0146400000000000,0.000591200000000000,0,0.0146500000000000,0,0.00287200000000000,0,0.000100000000000000]';


%% controllore

for i=1:length(pd(1,:))
    
xdes=pd(1:3,i);
dxdes=vd(1:3,i);
ddxdes=ad(1:3,i);
x_i=pd(:,i);
f_H=f_h(1:3,i);

tau=region_controller(q,dq,xdes,dxdes,ddxdes,f_H,a_h,a_r,a_t,x_i,k_1,a,alpha,K_s,L,theta_,beta,sigma,w_s,iiwa);

  
  B=B_model(q);
  C=C_model(q,dq);
  G=G_model(q);
  J=jacobiano(q);
  J=J(1:3,:);
  ddq=B\( - C*dq - G + tau  );%- J'*f_h(1:3,i) %No force interaction
  dq=dq+ddq*0.001;
  q=q+dq*0.001;
  T=iiwa.fkine(q);
  e(:,i)=pd(1:3,i)-T.t;

end
%%
plot(t,norm_e)
xlabel('t[s]')
ylabel('norm(e)')