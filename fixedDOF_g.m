function [ur,vr,vl] = fixedDOF_g(dim,fixnod)

ur = zeros(size(fixnod,1),1)
for i = 1:size(fixnod,1)
    ur(i,1) = fixnod(i,3);
end

vr = zeros(size(fixnod,1),1)
for i = 1:size(fixnod,1)
    vr(i,1) = nod2dof(fixnod(i,1), fixnod(i,2), dim.ni)

end

vl = [1:dim.ndof]';
vl(vr) = [];

end