function [M,N,R,T] = Length(m,n,r,t)
syms x y 
% intersection of first ghaede(m) with two legs(r,t)
a = solve(m(1)*x+m(2)*y==m(3),r(1)*x+r(2)*y==r(3)) ; 
mr_x = a.x ; 
mr_y = a.y ;
b = solve(m(1)*x+m(2)*y==m(3),t(1)*x+t(2)*y==t(3)) ; 
mt_x = b.x ; 
mt_y = b.y ;

% length of first base(m)
MMat = [mt_x-mr_x mt_y-mr_y] ; 
disp("first base: ")
M = eval(norm(MMat,2))


% intersection of second base(n) with two legs(r,t)
c = solve(n(1)*x+n(2)*y==n(3),r(1)*x+r(2)*y==r(3)) ; 
nr_x = c.x ; 
nr_y = c.y ;
d = solve(n(1)*x+n(2)*y==n(3),t(1)*x+t(2)*y==t(3)) ;
nt_x = d.x ; 
nt_y = d.y ;

% length of second base(n)
NMat = [nt_x-nr_x nt_y-nr_y] ;
disp("second base: ")
N = eval(norm(NMat,2))


% length of first leg(r)
RMat = [mr_x-nr_x mr_y-nr_y] ; 
disp("first leg: ")
R = eval(norm(RMat))


% length of second leg(t)
TMat = [nt_x-mt_x nt_y-mt_y] ;
disp("second leg: ")
T = eval(norm(TMat))

end