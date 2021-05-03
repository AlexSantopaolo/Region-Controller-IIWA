function dw=derivate_w(Delta_x, d_Delta_x, region, a_r, a_t)
if (strcmp(region,'H-DR') || strcmp(region,'R-DR'))
    dw=0;
elseif (strcmp(region,'TS-SR'))
    ratio_art=(a_r)^2/(a_t)^2;
    dwdx1=(32*abs(Delta_x(1))*sign(Delta_x(1))*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^3*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^3)/(a_t^2*(ratio_art - 1)^16);
    dwdx2=(32*abs(Delta_x(2))*sign(Delta_x(2))*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^3*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^3)/(a_t^2*(ratio_art - 1)^16);
    dwdx3=(32*abs(Delta_x(3))*sign(Delta_x(3))*((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^3*((ratio_art - 1)^4 - ((abs(Delta_x(1))^2 + abs(Delta_x(2))^2 + abs(Delta_x(3))^2)/a_t^2 - 1)^4)^3)/(a_t^2*(ratio_art - 1)^16);
    dwdx=[dwdx1,dwdx2,dwdx3];
    dw=dwdx*d_Delta_x;
elseif (strcmp(region,'SS-SR'))
    dw=0;
end
