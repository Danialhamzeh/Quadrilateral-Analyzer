function [S,h] = Area(m,n,r,t)

%  calculating the area

n = (m(1)/n(1))* n ;
disp("Shape Height")
h = abs((m(3)-n(3))/sqrt(m(1)^2+m(2)^2))
syms x y 
% length of both bases

% intersection of m and r
m(1)*x+m(2)*y==m(3) ;
r(1)*x+r(2)*y==r(3) ;
mr_x = (r(2)*m(3)-r(3)*m(2))/(r(2)*m(1)-r(1)*m(2)) ; 
mr_y = (r(3)-r(1)*mr_x)/r(2) ;

% intersection of m and t
m(1)*x+m(2)*y==m(3) ; 
t(1)*x+t(2)*y==t(3) ; 
mt_x = (t(2)*m(3)-t(3)*m(2))/(r(2)*m(1)-t(1)*m(2)) ;
mt_y = (t(3)-t(1)*mt_x)/t(2) ;

% length of first base(m)
M = sqrt((mt_x-mr_x)^2+(mt_y-mr_y)^2) ;

% intersection of n and r
n(1)*x+n(2)*y==n(3) ;
r(1)*x+r(2)*y==r(3) ;
nr_y = (r(1)*n(3)-r(3)*n(1))/(r(1)*n(2)-r(2)*n(1)) ;
nr_x = (n(3)-n(2)*nr_y)/n(1) ;

% intersection of n and t
n(1)*x+n(2)*y==n(3) ; 
t(1)*x+t(2)*y==t(3) ;
nt_y = (t(1)*n(3)-t(3)*n(1))/(t(1)*n(2)-t(2)*n(1)) ; 
nt_x = (n(3)-n(2)*nt_y)/n(1) ;

% length of second base(n)
N = sqrt((nt_x-nr_x)^2+(nt_y-nr_y)^2) ;

% Area
disp("Shape Area: ")
S = (M+N)*h/2
end

