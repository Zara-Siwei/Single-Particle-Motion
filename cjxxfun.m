function yp=cjxxfun(t,y,flag,q,m,R,B0)

B=mag_field([y(1) y(2) y(3)],R,B0);
yp=[y(4);
y(5);
y(6);
q/m*(y(5).*B(3)-y(6).*B(2));
q/m*(y(6).*B(1)-y(4).*B(3));
q/m*(y(4).*B(2)-y(5).*B(1));];



end









