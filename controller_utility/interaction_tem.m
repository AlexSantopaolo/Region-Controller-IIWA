function c_x=interaction_tem(interact_region, beta, sigma, f_h, s_x)
region=interact_region.region;
gamma=interact_region.gamma;
if(strcmp(region,'RR'))
    c_x=f_h;
 elseif(strcmp(region,'PR'))
     s_x=-s_x;
     s_x_beta=unit_vector_sx(f_h, s_x, gamma, beta);
     c_x= s_x_beta * norm(f_h) * cos( ( ( gamma - beta ) * pi ) / ( 2 * sigma ) );
elseif(strcmp(region,'CR'))
    c_x=zeros(3,1);
end