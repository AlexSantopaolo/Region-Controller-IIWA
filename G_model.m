function G=G_model(q)
mm1=0;
mm2=mm1;
mm3=mm2;
mm4=mm3;
mm5=mm1;
mm6=mm2;
mm7=mm3;

ml1=3.4525;
ml2=3.4821;
ml3=4.05623;
ml4=3.4822;
ml5=2.1633;
ml6=2.3466;
ml7=3.129;
g0=9.81;
d0 = 0.340;
d3 = 0.400;
d5 = 0.400;
d7 = 0.126;

q1=q(1);
q2=q(2);
q3=q(3);
q4=q(4);
q5=q(5);
q6=q(6);
q7=q(7);

G=[                                                                                                                                                                                                                                                                                                                                                                                                  0;

- g0*ml7*(d3*sin(q2) + d5*cos(q4)*sin(q2) - d5*cos(q2)*cos(q3)*sin(q4) + (9*d7*cos(q4)*cos(q6)*sin(q2))/8 - (9*d7*cos(q2)*cos(q3)*cos(q6)*sin(q4))/8 - (9*d7*cos(q2)*sin(q3)*sin(q5)*sin(q6))/8 + (9*d7*cos(q5)*sin(q2)*sin(q4)*sin(q6))/8 + (9*d7*cos(q2)*cos(q3)*cos(q4)*cos(q5)*sin(q6))/8) - g0*ml6*(d3*sin(q2) + d5*cos(q4)*sin(q2) - d5*cos(q2)*cos(q3)*sin(q4)) - g0*ml4*(d3*sin(q2) + (d5*cos(q4)*sin(q2))/4 - (d5*cos(q2)*cos(q3)*sin(q4))/4) - g0*ml5*(d3*sin(q2) + (5*d5*cos(q4)*sin(q2))/4 - (5*d5*cos(q2)*cos(q3)*sin(q4))/4) - g0*mm6*(d3*sin(q2) + d5*cos(q4)*sin(q2) - d5*cos(q2)*cos(q3)*sin(q4)) - g0*mm7*(d3*sin(q2) + d5*cos(q4)*sin(q2) - d5*cos(q2)*cos(q3)*sin(q4)) - g0*mm5*(d3*sin(q2) + (d5*cos(q4)*sin(q2))/2 - (d5*cos(q2)*cos(q3)*sin(q4))/2) - (d3*g0*ml2*sin(q2))/4 - (5*d3*g0*ml3*sin(q2))/4 - (d3*g0*mm3*sin(q2))/2 - d3*g0*mm4*sin(q2);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  - (g0*ml7*sin(q2)*(8*d5*sin(q3)*sin(q4) + 9*d7*cos(q6)*sin(q3)*sin(q4) - 9*d7*cos(q3)*sin(q5)*sin(q6) - 9*d7*cos(q4)*cos(q5)*sin(q3)*sin(q6)))/8 - (d5*g0*ml4*sin(q2)*sin(q3)*sin(q4))/4 - (5*d5*g0*ml5*sin(q2)*sin(q3)*sin(q4))/4 - d5*g0*ml6*sin(q2)*sin(q3)*sin(q4) - (d5*g0*mm5*sin(q2)*sin(q3)*sin(q4))/2 - d5*g0*mm6*sin(q2)*sin(q3)*sin(q4) - d5*g0*mm7*sin(q2)*sin(q3)*sin(q4);
                                                                                                                                                                                                                                                             g0*ml7*(d5*cos(q3)*cos(q4)*sin(q2) - d5*cos(q2)*sin(q4) - (9*d7*cos(q2)*cos(q6)*sin(q4))/8 + (9*d7*cos(q3)*cos(q4)*cos(q6)*sin(q2))/8 + (9*d7*cos(q2)*cos(q4)*cos(q5)*sin(q6))/8 + (9*d7*cos(q3)*cos(q5)*sin(q2)*sin(q4)*sin(q6))/8) - g0*ml6*(d5*cos(q2)*sin(q4) - d5*cos(q3)*cos(q4)*sin(q2)) - g0*mm6*(d5*cos(q2)*sin(q4) - d5*cos(q3)*cos(q4)*sin(q2)) - g0*mm7*(d5*cos(q2)*sin(q4) - d5*cos(q3)*cos(q4)*sin(q2)) - (d5*g0*ml4*(cos(q2)*sin(q4) - cos(q3)*cos(q4)*sin(q2)))/4 - (5*d5*g0*ml5*(cos(q2)*sin(q4) - cos(q3)*cos(q4)*sin(q2)))/4 - (d5*g0*mm5*(cos(q2)*sin(q4) - cos(q3)*cos(q4)*sin(q2)))/2;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           (9*d7*g0*ml7*sin(q6)*(cos(q5)*sin(q2)*sin(q3) - cos(q2)*sin(q4)*sin(q5) + cos(q3)*cos(q4)*sin(q2)*sin(q5)))/8;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              -(9*d7*g0*ml7*(cos(q2)*cos(q4)*sin(q6) - cos(q2)*cos(q5)*cos(q6)*sin(q4) + cos(q3)*sin(q2)*sin(q4)*sin(q6) - cos(q6)*sin(q2)*sin(q3)*sin(q5) + cos(q3)*cos(q4)*cos(q5)*cos(q6)*sin(q2)))/8;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       0];
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            