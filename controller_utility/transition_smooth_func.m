function mu_x=transition_smooth_func(region, a_r, a_h, Delta_x)

if (strcmp(region,'H-DR') || strcmp(region,'TS-SR') || strcmp(region,'SS-SR') )
    mu_x=1;
elseif (strcmp(region,'R-DR'))
    mu_x= sin( ( (a_r - norm(Delta_x)) * pi) / ( 2 * ( a_r - a_h ) ) )^2;
end
    