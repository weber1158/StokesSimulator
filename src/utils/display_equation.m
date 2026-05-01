function s = display_equation(x,y)
%Display equation string
xLog = log10(x);
yLog = log10(y);
C = polyfit(xLog,yLog,1);
m = C(1);
b = C(2);
s = sprintf('Velocity(diameter) ≈ diameter^%g * 10^(%0.3f)',m,b);

end