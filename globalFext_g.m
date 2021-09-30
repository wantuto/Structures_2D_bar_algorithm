function Fext = globalFext_g(dim,fdata)

Fext = zeros(dim.ndof,1);
for i = 1:size(fdata,1)
    I = nod2dof(fdata(i,1),fdata(i,2),dim.ni);
    Fext(I,1) =  Fext(I,1) + fdata(i,3);
end
end