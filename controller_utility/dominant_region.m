function region=dominant_region(Delta_x,a_h,a_r,a_t)

if( norm(Delta_x)>=0 && norm(Delta_x)<=a_h )
    region='H-DR';
elseif (norm(Delta_x)>a_h && norm(Delta_x)<=a_r)
     region='R-DR';
elseif (norm(Delta_x)>a_r && norm(Delta_x)<=a_t)
    region='TS-SR';
else
    region='SS-SR';
end 