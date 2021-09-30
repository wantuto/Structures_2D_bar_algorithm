function sig = stress_g(dim,x,Tn,mat,Tmat,Td,u)

sig = zeros(dim.nel,1);

for e = 1:dim.nel
    
    E = mat(Tmat(e),1);
    
    x1 = x(Tn(e,1),1);
    y1 = x(Tn(e,1),2);
    x2 = x(Tn(e,2),1);
    y2 = x(Tn(e,2),2);
    
    l = sqrt(((x2 - x1)^2) + ((y2 - y1)^2));
    
    s = ((y2 -y1)/l);
    c = ((x2 - x1)/l);
    
    Re = [
        c, s, 0, 0;
        -s, c, 0, 0;
        0, 0, c, s;
        0, 0, -s, c;
        ];
    for i = 1:dim.nne*dim.ni
        I = Td(e,i);
        ue(i,1) = u(I);
    end
    uep = Re*ue;
    eps(e,1) = 1/l *[-1 0 1 0]*uep;
    sig(e,1) = E*eps(e,1);
end


end