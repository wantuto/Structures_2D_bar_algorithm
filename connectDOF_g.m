function Td = connectDOF_g(dim,Tn)


Td = zeros(dim.nel,dim.nne*dim.ni);

for e=1:dim.nel
    for i=1:dim.nne
        for j=1:dim.ni
            I = nod2dof(i,j,dim.ni);
            Td(e,I) = nod2dof(Tn(e,i),j,dim.ni);
        end
    end   
end
end