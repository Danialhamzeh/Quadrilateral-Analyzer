 % project              "Danial Hamzeh"
 disp("This app is designed to compute the equation of the diameters,") 
 disp("the size of the sides and angles, height, area, and plot of ​​the famous geometric shapes,")
 disp("including the square, rectangle, rhombus, parallelogram, trapezium, from the equation of their sides.")
 disp("coefficients of each line get in the form of a row vector.")
 disp("for example: a(1)*x + a(2)*y = a(3)   -->   a = [a(1) a(2) a(3)]")

a = input("Coefficients of the first line ") 
b = input("Coefficients of the second line ") 
c = input("Coefficients of the third line ") 
d = input("Coefficients of the forth line ") 

% check if the lines are the same or not
% if yes, get inputs one more time
while 1
    if (a(1)/b(1) == a(2)/b(2))  &  (a(1)/b(1) == a(3)/b(3))
        disp("a and b are the same lines")
        disp("try one more time")
        a = input("Coefficients of the first line ") 
        b = input("Coefficients of the second line ") 
        c = input("Coefficients of the third line ") 
        d = input("Coefficients of the forth line ") 
    elseif (a(1)/c(1) == a(2)/c(2)) & (a(1)/c(1) == a(3)/c(3))
        disp("a and c are the same lines")
        disp("try one more time")
        a = input("Coefficients of the first line ") 
        b = input("Coefficients of the second line ") 
        c = input("Coefficients of the third line ") 
        d = input("Coefficients of the forth line ") 
    elseif (a(1)/d(1) == a(2)/d(2)) & (a(1)/d(1) == a(3)/d(3))
        disp("a and d are the same lines")
        disp("try one more time")
        a = input("Coefficients of the first line ") 
        b = input("Coefficients of the second line ") 
        c = input("Coefficients of the third line ") 
        d = input("Coefficients of the forth line ") 
    elseif (b(1)/c(1) == b(2)/c(2)) & (b(1)/c(1) == b(3)/c(3))
        disp("b and c are the same lines")
        disp("try one more time")
        a = input("Coefficients of the first line ") 
        b = input("Coefficients of the second line ") 
        c = input("Coefficients of the third line ") 
        d = input("Coefficients of the forth line ") 
    elseif (b(1)/d(1) == b(2)/d(2)) &  (b(1)/d(1) == b(3)/d(3))
        disp("b and d are the same lines")
        disp("try one more time")
        a = input("Coefficients of the first line ") 
        b = input("Coefficients of the second line ") 
        c = input("Coefficients of the third line ") 
        d = input("Coefficients of the forth line ") 
    elseif (c(1)/d(1) == c(2)/d(2)) &  (c(1)/d(1) == c(3)/d(3))
        disp("c and d the same are the same lines")
        disp("try one more time")
        a = input("Coefficients of the first line ")
        b = input("Coefficients of the second line ") 
        c = input("Coefficients of the third line ") 
        d = input("Coefficients of the forth line ") 
     else
        break
    end
end

% check at least two of lines must be parallel
while 1
    if (a(1)/b(1) == a(2)/b(2))  &  (a(1)/b(1) ~= a(3)/b(3))
        disp("a and b are bases")
        m = a
        n = b  
        r = c ;
        t = d ;
        break
   elseif (a(1)/c(1) == a(2)/c(2)) & (a(1)/c(1) ~= a(3)/c(3))
       disp("a and c are bases")
       m = a 
       n = c 
       r = b ;
       t = d ;
       break
   elseif (a(1)/d(1) == a(2)/d(2)) & (a(1)/d(1) ~= a(3)/d(3))
        disp("a and d are bases")
         m = a 
         n = d  
         r = b ;
         t = c ; 
         break
    elseif (b(1)/c(1) == b(2)/c(2)) & (b(1)/c(1) ~= b(3)/c(3))
        disp("b and c are bases")
        m = b 
        n = c 
        r = a ;
        t = d ;
        break
    elseif (b(1)/d(1) == b(2)/d(2)) &  (b(1)/d(1) ~= b(3)/d(3))
        disp("b and d are bases")
        m = b  
        n = d  
        r = a ;
        t = c ;
        break
    elseif (c(1)/d(1) == c(2)/d(2)) &  (c(1)/d(1) ~= c(3)/d(3))
        disp("c and d are bases")
        m = c
        n = d  
        r = a ;
        t = b ;
        k = 1 ;
        break
    else
        disp("try one more time")
        a = input("Coefficients of the first line ") 
        b = input("Coefficients of the second line ")
        c = input("Coefficients of the third line ") 
        d = input("Coefficients of the forth line ") 
        
    end
end
syms x y 
disp("eqn of each bases and legs: ")
L1 = m(1)*x + m(2)*y == m(3)  
L2 = n(1)*x + n(2)*y == n(3)  
L3 = r(1)*x + r(2)*y == r(3)  
L4 = t(1)*x + t(2)*y == t(3)


% length of bases and legs with Length function
Length(m,n,r,t)

% equation of diameters
% first diameter
a = solve(m(1)*x+m(2)*y==m(3),r(1)*x+r(2)*y==r(3)) ; 
mr_x = a.x ; 
mr_y = a.y ;
d = solve(n(1)*x+n(2)*y==n(3),t(1)*x+t(2)*y==t(3)) ;
nt_x = d.x ; 
nt_y = d.y ;
X = [mr_x nt_x] ;
Y = [mr_y nt_y] ;
X = double(X) ;                       % syms can't be used in polyfit so convert them to double
Y = double(Y) ;                       % syms can't be used in polyfit so convert them to double    
p = polyfit(X,Y,1) ;
disp("eqn of first diameter: ")
d1 = y == p(1)*x + p(2)



% second diameter      
b = solve(m(1)*x+m(2)*y==m(3),t(1)*x+t(2)*y==t(3)) ; 
mt_x = b.x ; 
mt_y = b.y ;
c = solve(n(1)*x+n(2)*y==n(3),r(1)*x+r(2)*y==r(3)) ; 
nr_x = c.x ; 
nr_y = c.y ;
X = [mt_x nr_x] ;
Y = [mt_y nr_y] ;
X = double(X) ;                      % syms can't be used in polyfit so convert them to double       
Y = double(Y) ;                      % syms can't be used in polyfit so convert them to double
p = polyfit(X,Y,1) ;                  
disp("eqn of second diameter: ")
d2 = y == p(1)*x + p(2)

   
% Area of shape

% calculating area(Area function)
Area(m,n,r,t)                          


% Angles of quadrilateral and shape
Angle_Shape(m,n,r,t)


% plot
mt = [mt_x mt_y] ; 
nt = [nt_x nt_y] ;
mr = [mr_x mr_y] ; 
nr = [nr_x nr_y] ;

% intersection of two legs can't be between bases.It must be more or less than them

if (r(1)/t(1) == r(2)/t(2)) & (r(1)/t(1) ~= r(3)/t(3))
    disp("The calculations are correct so the shape will be: ")
    x1 = linspace(mr(1),mt(1),10) ; 
    y1 = -(m(1)/m(2))*x1 + m(3)/m(2) ;
    plot(x1,y1)
    x2 = linspace(nt(1),nr(1),10) ;
    y2 = -(n(1)/n(2))*x2 + n(3)/n(2) ;
    hold on 
    plot(x2,y2)
    x3 = linspace(mr(1),nr(1),10) ;
    y3 = -(r(1)/r(2))*x3 + r(3)/r(2) ;
    hold on
    plot(x3,y3)
    x4 = linspace(nt(1),mt(1),10) ;
    y4 = -(t(1)/t(2))*x4 + t(3)/t(2) ;
    hold on
    grid on
    plot(x4,y4)
    title("Shape")
    xlabel('x','FontWeight','bold') ; 
    ylabel('y','FontWeight','bold') ;
    legend('m = first base','n = second base','r = first leg','t = second leg')
else
    k = solve(r(1)*x+r(2)*y==r(3),t(1)*x+t(2)*y==t(3)) ;
    rt_x = k.x ;
    rt_y = k.y ;
    rt = [rt_x rt_y] ;
    if (rt(2)>mt(2)) & (rt(2)>nt(2)) & (rt(2)>mr(2)) & (rt(2)>nr(2))
       disp("The calculations are correct so the shape will be: ")
       x1 = linspace(mr(1),mt(1),10) ; 
       y1 = -(m(1)/m(2))*x1 + m(3)/m(2) ;
       plot(x1,y1)
       x2 = linspace(nt(1),nr(1),10) ;
       y2 = -(n(1)/n(2))*x2 + n(3)/n(2) ;
       hold on 
       plot(x2,y2)
       x3 = linspace(mr(1),nr(1),10) ;
       y3 = -(r(1)/r(2))*x3 + r(3)/r(2) ;
       hold on
       plot(x3,y3)
       x4 = linspace(nt(1),mt(1),10) ;
       y4 = -(t(1)/t(2))*x4 + t(3)/t(2) ;
       hold on
       grid on
       plot(x4,y4)
       title("Shape")
       xlabel('x','FontWeight','bold') ; 
       ylabel('y','FontWeight','bold') ;
      legend('m = first base','n = second base','r = first leg','t = second leg')

   elseif (rt(2)<mt(2)) & (rt(2)<nt(2)) & (rt(2)<mr(2)) & (rt(2)<nr(2))
       disp("The calculations are correct so the shape will be: ")
       x1 = linspace(mr(1),mt(1),10) ; 
       y1 = -(m(1)/m(2))*x1 + m(3)/m(2) ;
       plot(x1,y1)
       x2 = linspace(nt(1),nr(1),10) ;
       y2 = -(n(1)/n(2))*x2 + n(3)/n(2) ;
       hold on 
       plot(x2,y2)
       x3 = linspace(mr(1),nr(1),10) ;
       y3 = -(r(1)/r(2))*x3 + r(3)/r(2) ;
       hold on
       plot(x3,y3)
       x4 = linspace(nt(1),mt(1),10) ;
       y4 = -(t(1)/t(2))*x4 + t(3)/t(2) ;
       hold on
       grid on
       plot(x4,y4)
       title("Shape")
       xlabel('x','FontWeight','bold') ; 
       ylabel('y','FontWeight','bold') ;
       legend('m = first base','n = second base','r = first leg','t = second leg')
    else
        disp("The calculations aren't correct so there is no figure because the intersection of two legs is between two bases")
    end
end
