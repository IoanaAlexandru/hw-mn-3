%ALEXANDRU Ioana | 314CB
eps = 0.1;
N = 1000;
x = linspace(-pi, pi, N + 1);
y = f(x);
subplot(2,1,1);
plot(x,y,"color","blue");
hold on;
Nk = eval_interpolator_c(1,eps);
xx = linspace(-pi, pi, Nk + 1);
yy = f(xx);
for i = 1:N+1
	y(i) = Lagrange(xx, yy, x(i));
endfor
plot(x,y, "color","black");
hold on;
%Newton
Nk = eval_interpolator_c(2,eps);
xx = linspace(-pi, pi, Nk + 1);
yy = f(xx);
for i = 1:N+1
	y(i) = Newton(xx, yy, x(i));
endfor
plot(x,y,"color","cyan");
hold on;
%Linear_spline
Nk = eval_interpolator_c(3,eps);
xx = linspace(-pi, pi, Nk + 1);
yy = f(xx);
for i = 1:N+1
	y(i) = Linear_spline(xx, yy, x(i));
endfor
plot(x,y,"color","green");
hold on;
%Natural
Nk = eval_interpolator_c(4,eps);
xx = linspace(-pi, pi, Nk + 1);
yy = f(xx);
for i = 1:N+1
	y(i) = Natural(xx, yy, x(i));
endfor
plot(x,y,"color","magenta");
hold on;
%Cubic_spline
Nk = eval_interpolator_c(5,eps);
xx = linspace(-pi, pi, Nk + 1);
yy = f(xx);
for i = 1:N+1
	y(i) = Cubic_spline(xx, yy, x(i));
endfor
plot(x,y,"color","red");
hold on;
legend("f","Lagrange","Newton","Linear spline","Natural","Cubic spline");

A = load('sunspot.dat');
subplot(2,1,2);
plot(A(:,1),A(:,2));