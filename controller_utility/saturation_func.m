function mu_s=saturation_func(s_x, w_s)

if( norm(s_x)>=w_s)
    mu_s=1;
elseif(norm(s_x)<w_s)
    mu_s= sin( norm(s_x) * pi / ( 2 * w_s ) )^2;
end