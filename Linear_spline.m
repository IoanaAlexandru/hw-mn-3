%ALEXANDRU Ioana | 314CB
function p = Linear_spline(x, y, val)
	n = length(x);
	for i = 1:n-1
		if (x(i) <= val && val <= x(i+1))
			if (x(i+1)-x(i) == 0)
				p = 0;
				return;
			endif
			a = (y(i+1)-y(i))/(x(i+1)-x(i));
			b = (x(i+1)*y(i)-x(i)*y(i+1))/(x(i+1)-x(i));
		endif
	endfor
	p = a*val+b;
endfunction