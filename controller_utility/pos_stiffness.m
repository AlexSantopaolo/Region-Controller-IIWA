function k_p=pos_stiffness(delta_x, k_1, a, a_h, region)
if (strcmp(region,'SS-SR'))
    k_p=0;
else
a_h=a_h/2;
f_p= 1 - exp( -a*( norm(delta_x)^2 - a_h^2 ) );
k_p= k_1 * ( max(0,f_p)^2 ) * exp( -2*a*( norm(delta_x)^2 - a_h^2 ) );
%  
%  if ( norm( delta_x ) > a_i )
%      k_p = p;
%  end
end