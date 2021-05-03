function dA=derivate_A(Delta_x, d_Delta_x, xdes, dxdes, a_r, a_t, region)
ratio_art=(a_r^2)/(a_t^2);
if (strcmp(region,'H-DR') || strcmp(region,'R-DR') || strcmp(region,'SS-SR'))
    dA=zeros(3,3);
else
dwdx1=(32*abs(Delta_x(1))*sign(Delta_x(1))*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^3*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^3)/(a_t^2*(ratio_art - 1)^16);
d2wdx11=(32*sign(Delta_x(1))^2*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^3*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^3)/(a_t^2*(ratio_art - 1)^16) + (192*abs(Delta_x(1))^2*sign(Delta_x(1))^2*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^2*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^3)/(a_t^4*(ratio_art - 1)^16) - (768*abs(Delta_x(1))^2*sign(Delta_x(1))^2*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^6*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^2)/(a_t^4*(ratio_art - 1)^16) + (64*abs(Delta_x(1))*dirac(Delta_x(1))*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^3*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^3)/(a_t^2*(ratio_art - 1)^16);
d2wdx12=(192*abs(Delta_x(1))*abs(Delta_x(2))*sign(Delta_x(1))*sign(Delta_x(2))*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^2*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^3)/(a_t^4*(ratio_art - 1)^16) - (768*abs(Delta_x(1))*abs(Delta_x(2))*sign(Delta_x(1))*sign(Delta_x(2))*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^6*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^2)/(a_t^4*(ratio_art - 1)^16);
d2wdx13=(192*abs(Delta_x(1))*abs(Delta_x(3))*sign(Delta_x(1))*sign(Delta_x(3))*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^2*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^3)/(a_t^4*(ratio_art - 1)^16) - (768*abs(Delta_x(1))*abs(Delta_x(3))*sign(Delta_x(1))*sign(Delta_x(3))*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^6*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^2)/(a_t^4*(ratio_art - 1)^16);
dw1dt=[d2wdx11,d2wdx12,d2wdx13];

dwdx2=(32*abs(Delta_x(2))*sign(Delta_x(2))*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^3*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^3)/(a_t^2*(ratio_art - 1)^16);
d2wdx22=(32*sign(Delta_x(2))^2*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^3*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^3)/(a_t^2*(ratio_art - 1)^16) + (192*abs(Delta_x(2))^2*sign(Delta_x(2))^2*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^2*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^3)/(a_t^4*(ratio_art - 1)^16) - (768*abs(Delta_x(2))^2*sign(Delta_x(2))^2*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^6*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^2)/(a_t^4*(ratio_art - 1)^16) + (64*abs(Delta_x(2))*dirac(Delta_x(2))*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^3*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^3)/(a_t^2*(ratio_art - 1)^16);
d2wdx21=d2wdx12;
d2wdx23=(192*abs(Delta_x(2))*abs(Delta_x(3))*sign(Delta_x(2))*sign(Delta_x(3))*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^2*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^3)/(a_t^4*(ratio_art - 1)^16) - (768*abs(Delta_x(2))*abs(Delta_x(3))*sign(Delta_x(2))*sign(Delta_x(3))*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^6*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^2)/(a_t^4*(ratio_art - 1)^16);
dw2dt=[d2wdx21,d2wdx22,d2wdx23];
 
dwdx3=(32*abs(Delta_x(3))*sign(Delta_x(3))*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^3*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^3)/(a_t^2*(ratio_art - 1)^16);
d2wdx31=d2wdx13;
d2wdx32=d2wdx23;
d2wdx33=(32*sign(Delta_x(3))^2*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^3*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^3)/(a_t^2*(ratio_art - 1)^16) + (192*abs(Delta_x(3))^2*sign(Delta_x(3))^2*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^2*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^3)/(a_t^4*(ratio_art - 1)^16) - (768*abs(Delta_x(3))^2*sign(Delta_x(3))^2*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^6*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^2)/(a_t^4*(ratio_art - 1)^16) + (64*abs(Delta_x(3))*dirac(Delta_x(3))*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^3*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^3)/(a_t^2*(ratio_art - 1)^16);
dw3dt=[d2wdx31,d2wdx32,d2wdx33];

dA1dt=dw1dt * d_Delta_x;
dA2dt=dw2dt * d_Delta_x;
dA3dt=dw3dt * d_Delta_x;

dA(:,1)=dA1dt * xdes + dwdx1 * dxdes;
dA(:,2)=dA2dt * xdes + dwdx2 * dxdes;
dA(:,3)=dA3dt * xdes + dwdx3 * dxdes;

for i=1:length(dA(:,1))
    for j=1:length(dA(1,:))
    if(isnan(dA(i,j)))
       dA(i,j)=0;
    end
    end
end
   

end
 

