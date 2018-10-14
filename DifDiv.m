%ALEXANDRU Ioana | 314CB
function d = DifDiv(x, y)
	n = length(x);
	d = y;
	for i = 2:n
		for j = n:-1:i
			d(j) = (d(j)-d(j-1))/(x(j)-x(j-i+1));
		endfor
	endfor
endfunction