function jplus=j_pseudoinverse(j)
k=0.0000;
jplus=j'/(j*j'+eye(3)*k);