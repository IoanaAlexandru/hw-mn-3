%ALEXANDRU Ioana | 314CB
function y = f(x)
	a = 3;
	y = exp(a * cos(x)) / (2 * pi * besseli(0, a));
endfunction