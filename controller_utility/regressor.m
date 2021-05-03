function Y=regressor(q,dq,dqr,ddqr)
qIn = libpointer('doublePtr',zeros(1,7));
dqin = libpointer('doublePtr',zeros(1,7));
dqrin = libpointer('doublePtr',zeros(1,7));
ddqrin = libpointer('doublePtr',zeros(1,7));

YB_out = libpointer('doublePtr',zeros(1,7*63));
YG_out = libpointer('doublePtr',zeros(1,7*63));
YC_out = libpointer('doublePtr',zeros(1,7*63));

set(qIn,'Value',q);
set(dqin,'Value',dq);
set(dqrin,'Value',dqr);
set(ddqrin,'Value',ddqr);

calllib('Y_buona','regressor_B',qIn,ddqrin,YB_out);
YB(:) = get(YB_out,'Value');
calllib('Y_buona','regressor_G',qIn,YG_out);
YG(:) = get(YG_out,'Value');
calllib('Y_buona','regressor_C',qIn,dqin,dqrin,YC_out);
YC(:) = get(YC_out,'Value');
Ytemp=YB+YG+YC;
Y=reshape(Ytemp,[7,63]);