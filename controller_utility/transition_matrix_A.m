function A=transition_matrix_A(xe,xdes,w,a_r,a_t)
if (w==0 || w==1)
    A=zeros(3,3);
else
    ratio_art=(a_r)^2/(a_t)^2;
    %derivate simboliche della w rispetto alle componenti di Delta_x,
    %dubbio sulla derivata
    dwdx1=(32*abs(xe(1) - xdes(1))*sign(xe(1) - xdes(1))*((abs(xe(1) - xdes(1))^2 + abs(xe(2) - xdes(2))^2 + abs(xe(3) - xdes(3))^2)/a_t^2 - 1)^3*((ratio_art - 1)^4 - ((abs(xe(1) - xdes(1))^2 + abs(xe(2) - xdes(2))^2 + abs(xe(3) - xdes(3))^2)/a_t^2 - 1)^4)^3)/(a_t^2*(ratio_art - 1)^16);
    dwdx2=(32*abs(xe(2) - xdes(2))*sign(xe(2) - xdes(2))*((abs(xe(1) - xdes(1))^2 + abs(xe(2) - xdes(2))^2 + abs(xe(3) - xdes(3))^2)/a_t^2 - 1)^3*((ratio_art - 1)^4 - ((abs(xe(1) - xdes(1))^2 + abs(xe(2) - xdes(2))^2 + abs(xe(3) - xdes(3))^2)/a_t^2 - 1)^4)^3)/(a_t^2*(ratio_art - 1)^16);
    dwdx3=(32*abs(xe(3) - xdes(3))*sign(xe(3) - xdes(3))*((abs(xe(1) - xdes(1))^2 + abs(xe(2) - xdes(2))^2 + abs(xe(3) - xdes(3))^2)/a_t^2 - 1)^3*((ratio_art - 1)^4 - ((abs(xe(1) - xdes(1))^2 + abs(xe(2) - xdes(2))^2 + abs(xe(3) - xdes(3))^2)/a_t^2 - 1)^4)^3)/(a_t^2*(ratio_art - 1)^16);
    dw=[dwdx1,dwdx2,dwdx3];
    A=[dw*xdes(1);
       dw*xdes(2);
       dw*xdes(3)];
end