function Kel = stiffnessBars_g(dim,x,Tn,mat,Tmat)

Kel = zeros(dim.nne*dim.ni,dim.nne*dim.ni,dim.nel);
for e = 1:dim.nel
    
    A = mat(Tmat(e),2);
    E = mat(Tmat(e),1);

    x1= x(Tn(e,1),1);
    y1= x(Tn(e,1),2);
    x2= x(Tn(e,2),1);
    y2= x(Tn(e,2),2);
    
    l = sqrt((x2-x1)^2 + (y2-y1)^2);
    
    c = (x2-x1)/l;
    s = (y2-y1)/l;
        
    K= ((E*A)/l)*[   
        c^2, c*s, -c^2, -c*s;
        c*s, s^2, -c*s, -s^2;
        -c^2, -c*s, c^2, c*s;
        -c*s, -s^2, c*s, s^2;
        ];

    for r = 1:dim.nne*dim.ni
        for w = 1:dim.nne*dim.ni
            Kel(r,w,e) = K(r,w);  
        end
    end 
end
end