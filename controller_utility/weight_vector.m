function w=weight_vector(Delta_x, region, a_r, a_t)

if (strcmp(region,'H-DR') || strcmp(region,'R-DR'))
    w=1;
elseif (strcmp(region,'TS-SR'))
    ratio_art=(a_r)^2/(a_t)^2;
    w=1-( ( ( norm(Delta_x)^2 / (a_t)^2 - 1)^4 - ( ratio_art - 1 )^4 )^4 )...
        / ( ratio_art - 1 )^16;
elseif (strcmp(region,'SS-SR'))
    w=0;
end
