%ALEXANDRU Ioana | 314CB
function N = eval_interpolator_d(tip, eps)
	A = load('sunspot.dat');
	x = A(:,1);
	y = A(:,2);
	switch(tip)
		case 1
			p = @Lagrange;
		case 2
			p = @Newton;
		case 3
			p = @Linear_spline;
		case 4
			p = @Natural;
		case 5
			p = @Cubic_spline;
		case 6
			p = @Fourier;
		otherwise
			printf("%d is an invalid type\n", tip);
	endswitch
endfunction