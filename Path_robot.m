t=linspace(0,40,20000);
% for i=1:20000
% x(i)=0.4 - 4e-5*t(i)^3 + 1.2e-6*t(i)^4 -9.6e-9*t(i)^5;
% end

x=0.2+0.2*cos(0.5*pi*t/t(end))';
y=0.06+0.3*sin(0.5*pi*t/t(end))';
z=0.614+0.3*sin(0.5*pi*t/t(end))';

dx=[diff(x)/0.001];
dy=[diff(y)/0.001];
dz=[diff(z)/0.001];


ddx=[diff(dx)/0.001];
ddy=[diff(dy)/0.001];
ddz=[diff(dz)/0.001];

dx=[dx;0];
dy=[dy;0];
dz=[dz;0];
 
ddx=[ddx;0;0];
ddy=[ddy;0;0];
ddz=[ddz;0;0];

pd=[x';y';z'];
vd=[dx';dy';dz'];
ad=[ddx';ddy';ddz'];

% f_h_x=0*abs(ad(1,:));
% f_h_y=10*abs(ad(2,:))/max(vd(2,:));
% f_h_z=10*abs(ad(3,:))/max(vd(3,:));
for i=1:length(vd(1,:))
f_h_x(i)=1*(vd(1,i))/norm(vd(:,i));
f_h_y(i)=1*(vd(2,i))/norm(vd(:,i));
f_h_z(i)=1*(vd(3,i))/norm(vd(:,i));
end
f_h=[f_h_x;f_h_y;f_h_z];
% plot3(dx,dy,dz)
% xlabel('x')
% ylabel('y')
% zlabel('z')

