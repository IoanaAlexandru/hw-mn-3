%ALEXANDRU Ioana | 314CB
function b = Lagrange(x, y, a)
	n = length(x);
	b = 0;
	for i = 1:n
		prod = y(i);
		for j = 1:n
			if i ~= j
				prod = prod*(a-x(j))/(x(i)-x(j));
			endif
		endfor
		b = b+prod;
	endfor
endfunction