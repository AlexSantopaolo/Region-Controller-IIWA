function d_delta_x = derivate_delta_x(dxe, d_xf, A)
d_delta_x= dxe - A*dxe - d_xf;