function ddxf=derivate_dxf(w, dw, dxdes, ddxdes, A, dA)

ddxf=dw * dxdes + eye(3)*w * ddxdes - dA * dxdes - A * ddxdes;