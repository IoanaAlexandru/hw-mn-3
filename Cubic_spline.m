%ALEXANDRU Ioana | 314CB
function p = Cubic_spline(x, y, val)
	n = length(x);
	h(1:n-1) = x(2:n)-x(1:n-1);
	a = y;
	%formez cei 4 vectori specifici sistemului tridiagonal
	Aa = h; Aa(n-1) = 0;
	Ab(2:n-1) = 2*(h(1:n-2)+h(2:n-1)); Ab(1) = 2*h(1); Ab(n) = 2*h(n-1);
	Ac = h; Ac(1) = 0;
	Ad(2:n-1) = 3*(a(3:n)-a(2:n-1))./h(2:n-1) - 3*(a(2:n-1)-a(1:n-2))./h(1:n-2);
	Ad(1) = (y(2)-y(1))/(x(2)-x(1)); Ad(n) = (y(n)-y(n-1))/(x(n)-x(n-1));
	%rezolv sistemul tridiagonal folosind metoda Thomas
	c = Thomas(Aa, Ab, Ac, Ad);
	c = c';
	d(1:n-1) = (c(2:n)-c(1:n-1))./(3*h(1:n-1));
	b(1:n-1) = (a(2:n)-a(1:n-1))./h(1:n-1) - (1/3)*h(1:n-1).*(2*c(1:n-1)+c(2:n));
	for i = 1:n-1
		if (x(i) <= val && val <= x(i+1))
			if (x(i+1)-x(i) == 0)
				p = 0;
				return;
			endif
			p = a(i)+(val-x(i))*b(i)+(val-x(i))^2*c(i)+(val-x(i))^3*d(i);
		endif
	endfor
endfunction
	