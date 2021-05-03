function C_x=interaction_controller(mu_s, mu_x, c_x, f_h, region)

if (strcmp(region,'H-DR'))
    C_x = mu_s * c_x;
elseif(strcmp(region,'R-DR'))
    C_x = mu_s * mu_x * c_x;
else
    C_x = 0;
end

C_x = C_x + f_h;