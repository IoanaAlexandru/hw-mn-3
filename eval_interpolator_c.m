%ALEXANDRU Ioana | 314CB
function N = eval_interpolator_c(tip, eps)
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
	N = 1000;
	x = linspace(-pi, pi, N + 1);
	y = f(x);
	k = 2;
	h = 2*pi/(N+1);
	E = 0;
	pasi = 5;
	while (pasi)
		Eant = E;
		Nk = 2^k;
		xk = linspace(-pi, pi, Nk + 1);
		yk = f(xk);
		s = 0;
		for i = 1:N+1
			s += abs(f(x(i))-p(xk, yk, x(i)))^2;
		endfor
		E = (h*s)^(1/2);
		if ((Eant != 0) && (E - Eant > 0)) %dacă este cresc
			N = inf;
			return;
		elseif (abs(E - Eant) < eps)
			N = Nk;
			return;
		endif
		k++;
		pasi--;
	endwhile
	N = inf;
endfunction