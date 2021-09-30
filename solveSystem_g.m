function [u,R] = solveSystem_g(dim,KG,Fext,ur,vr,vl)

KLL = KG(vl,vl);
KLR = KG(vl,vr);
KRL = KG(vr,vl);
KRR = KG(vr,vr);
FL = Fext(vl,1);
FR = Fext(vr,1);

ul = KLL\(FL-KLR*ur);
R = KRR*ur + KRL*ul - FR;

u(vl,1)=ul;
u(vr,1)=ur;
end
