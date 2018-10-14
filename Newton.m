%ALEXANDRU Ioana | 314CB
function b = Newton(x, y, a)
	n = length(x);
	d = DifDiv(x, y);
	b = d(n);
	for i = n-1:-1:1
		b = (a-x(i))*b+d(i);
	endfor
endfunction