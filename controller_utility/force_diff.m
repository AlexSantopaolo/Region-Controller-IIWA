function interact_region=force_diff(f_h, s_x, beta, sigma)
neg_sx=-s_x;
den=norm(neg_sx)*norm(f_h);
if(den==0) den=1; end
gamma=acos( (neg_sx' * f_h) / ( den ) );

if(gamma<=beta)
       region='RR';
    elseif(gamma>beta && gamma<=( sigma + beta ) )
        region='PR';
      elseif (gamma>( sigma + beta ) && gamma<=pi )
          region='CR';
end

interact_region.gamma=gamma;
interact_region.region=region;