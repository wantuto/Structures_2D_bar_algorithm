function KG = assemblyK_g(dim,Kel,Td) 

KG = zeros(dim.ndof,dim.ndof);
for e=1:dim.nel
    for i=1:dim.nne*dim.ni
        I = Td(e,i);
        for j = 1:dim.nne*dim.ni
            J = Td(e,j);                        % degree of freedom, global
            KG(I,J) = KG(I,J) + Kel(i,j,e);
        end
    end
end
end