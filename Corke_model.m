clear
%% 
d0 = 0.340;
d3 = 0.400;
d5 = 0.400;
d7 = 0.126;

m1=3.4525; r1=[0;-d0/3;0]; G1=150; Jm1=0.0001;
I1=[0.02183  ,0         ,        0;
    0        ,0.007703  ,-0.003887;
    0        ,-0.003887 ,  0.02083];
    

m2=3.4821; r2=[0;0;d3/4]; G2=150; Jm2=0.0001;
I2=[0.02076    ,0       ,-0.003626;
    0          ,0.02179 ,        0;
    -0.003626  ,0       ,  0.00779];

m3=4.05623; r3=[0;d3/4;0]; G3=150; Jm3=0.0001;
I3=[0.03204     ,0        ,0;
    0           ,0.00972  ,0.006227;
    0           ,0.006227 ,0.03042];

m4=3.4822; r4=[0;0;d5/4]; G4=150; Jm4=0.0001;
I4=[0.02178   ,0         ,0;
    0         ,0.02075   ,-0.003625;
    0         ,-0.003625 ,0.007785];

m5=2.1633; r5=[0;-d5/4;0]; G5=150; Jm5=0.0001;
I5=[0.01287    ,0         ,0;
    0          ,0.005708  ,-0.003946;
    0          ,-0.003946 ,0.01112];

m6=2.3466; r6=[0;0;0]; G6=150; Jm6=0.0001;
I6=[0.006509,     0        , 0;
    0,            0.006259 , 0.00031891;
    0,            0.00031891, 0.004527];

m7=3.129; r7=[0;0;d7/8]; G7=150; Jm7=0.0001;
I7=[0.01464    ,0.0005912    ,0;
    0.0005912  ,0.01465      ,0;
    0          ,0            ,0.002872];  

theta_true=[m1,I1(1,1),I1(1,2),I1(1,3),I1(2,2),I1(2,3),I1(3,3),0,Jm1, ...
    m2,I2(1,1),I2(1,2),I2(1,3),I2(2,2),I2(2,3),I2(3,3),0,Jm2, ... 
    m3,I3(1,1),I3(1,2),I3(1,3),I3(2,2),I3(2,3),I3(3,3),0,Jm3, ...
    m4,I4(1,1),I4(1,2),I4(1,3),I4(2,2),I4(2,3),I4(3,3),0,Jm4, ...
    m5,I5(1,1),I5(1,2),I5(1,3),I5(2,2),I5(2,3),I5(3,3),0,Jm5, ...
    m6,I6(1,1),I6(1,2),I6(1,3),I6(2,2),I6(2,3),I6(3,3),0,Jm6, ...
    m7,I7(1,1),I7(1,2),I7(1,3),I7(2,2),I7(2,3),I7(3,3),0,Jm7];
    
    
L(1) = Link('revolute', 'd', 0, 'a', 0, 'alpha', -pi/2,'m' ,m1, 'r', r1, 'I', I1, 'G', G1, 'Jm', Jm1);
L(2) = Link('revolute', 'd', 0, 'a', 0, 'alpha',  pi/2,'m' ,m2, 'r', r2, 'I', I2, 'G', G2, 'Jm', Jm2);
L(3) = Link('revolute', 'd', d3, 'a', 0, 'alpha', pi/2,'m' ,m3, 'r', r3, 'I', I3, 'G', G3, 'Jm', Jm3);
L(4) = Link('revolute', 'd', 0, 'a', 0, 'alpha', -pi/2,'m' ,m4, 'r', r4, 'I', I4, 'G', G4, 'Jm', Jm4);
L(5) = Link('revolute', 'd', d5, 'a', 0, 'alpha',-pi/2,'m' ,m5, 'r', r5, 'I', I5, 'G', G5, 'Jm', Jm5);
L(6) = Link('revolute', 'd', 0, 'a', 0, 'alpha',  pi/2,'m' ,m6, 'r', r6, 'I', I6, 'G', G6, 'Jm', Jm6);
L(7) = Link('revolute', 'd', d7, 'a', 0, 'alpha',    0,'m' ,m7, 'r', r7, 'I', I7, 'G', G7, 'Jm', Jm7);
iiwa = SerialLink(L,'name','iiwa');
iiwa.base = transl(0, 0, d0);
%iiwa.tool = transl(0, 0, d7);
% q=[0,0,0,pi/2,0,-pi/2,0];
% dq=ones(1,7);
% var1=0:0.1:pi/2+0.1;
% var2=0:0.1:pi/2+0.1;
% for i=1:length(var1)
% q=[0,0,0,var1(i),0,-var2(i),0];    
% iiwa.plot(q)
% % drawnow
% pause(0.5)
% end
% 


% iiwa.jacobe(q) %jacobian
%m = R.cinertia(q) 
% i = iiwa.inertia(q) %matrice inerzia
% C = iiwa.coriolis(q, dq)%matrie coriolis
% G = iiwa.gravload(q)   
% q = iiwa.ikcon(T) %cinematica inversa
% %r.payload(massa [posizione rispetto x,y,z]); roba per cambiare il le forze
% %di interazione
% iiwa.dyn %ottieni parametri dinamici
% fdyn %dinamica in avanti
% % qdd = R.accel(q, qd, torque); % dinamica in avanti utile
%   cg = CodeGenerator(iiwa);
% % cg.gencoriolis
% cg.genjacobian