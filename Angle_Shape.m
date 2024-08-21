function [teta1,teta2,teta3,teta4] = Angle_Shape(m,n,r,t)

% calc h,R and T like Length function
n = (m(1)/n(1))* n ;
h = abs((m(3)-n(3))/sqrt(m(1)^2+m(2)^2)) ;
syms x y
a = solve(m(1)*x+m(2)*y==m(3),r(1)*x+r(2)*y==r(3)) ; 
mr_x = a.x ; 
mr_y = a.y ;
b = solve(m(1)*x+m(2)*y==m(3),t(1)*x+t(2)*y==t(3)) ; 
mt_x = b.x ; 
mt_y = b.y ;
c = solve(n(1)*x+n(2)*y==n(3),r(1)*x+r(2)*y==r(3)) ; 
nr_x = c.x ; 
nr_y = c.y ;
d = solve(n(1)*x+n(2)*y==n(3),t(1)*x+t(2)*y==t(3)) ;
nt_x = d.x ; 
nt_y = d.y ;
RMat = [mr_x-nr_x mr_y-nr_y] ; 
R = norm(RMat) ; 
TMat = [nt_x-mt_x nt_y-mt_y] ;
T = norm(TMat) ;
MMat = [mt_x-mr_x mt_y-mr_y] ; 
M = norm(MMat,2) ; 
NMat = [nt_x-nr_x nt_y-nr_y] ;
N = norm(NMat,2) ; 

% Angles
teta1 = rad2deg(eval(asin(h/R)))
teta2 = 180-teta1
teta3 = rad2deg(eval(asin(h/T)))
teta4 = 180-teta3
Teta1 = floor(teta1) ; 


if M == N
    if (R == T) & (M == R)
        if Teta1 == 90
            disp("Shape is Square")
        else
            disp("Shape is Rhombus")
        end
    else
        if Teta1 == 90
            disp("Shape is Rectangle")
        else 
            disp("Shape is Parallelogram")
        end
    end        
else
    if (R == T)
       disp("Shape is Isosceles Trapezoid")
    else
        disp("Shape is Tranpezium")
    end
end