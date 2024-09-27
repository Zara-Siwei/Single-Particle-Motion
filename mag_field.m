function output=mag_field(position,R,B0)
x=position(:,1);
y=position(:,2);
z=position(:,3);
r=sqrt(x.^2+y.^2+z.^2);
output=-B0*R^3./r.^5.*[3*x.*z,3*y.*z,(2*z.^2-x.^2-y.^2)];
end