%ALEXANDRU Ioana | 314CB
eps = 0.01;
A = zeros(2,6);
for i = 1:5
	A(1,i) = eval_interpolator_c(i, @f, eps);
	%A(2,i) = eval_interpolator_d(i, @f, eps);
endfor
A