function mass = total_mass_g(dim,x,Tn,mat,Tmat)
mass = 0;


for e = 1:dim.nel
    
    A = mat(Tmat(e),2);
    rho = mat(Tmat(e),3);
    
    x1 = x(Tn(e,1),1);
    y1 = x(Tn(e,1),2);
    x2 = x(Tn(e,2),1);
    y2 = x(Tn(e,2),2);
    
    l = sqrt(((x2 - x1)^2) + ((y2 - y1)^2));
    
    massb = l*A*rho;
    mass = mass + massb;
end

end