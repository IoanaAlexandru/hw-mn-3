function p = Fourier(x, y, val)
	n = length(x);
	m = floor(n/2);
	scos = 0; ssin = 0;
	for i = 1:m+1
		sa = 0; sb = 0;
		for j = 1:n
			sa += x(j)*cos(j*(2*j*pi)/n);
			sb += x(j)*sin(j*(2*j*pi)/n);
		endfor
		if (i == 1 || (i == m+1 && mod(n,2) == 0))
			sa = sa/2;
		endif
		scos += sa*(2/n)*cos(i*val);
		ssin += sb*(2/n)*sin(i*val);
	endfor
	p = scos + ssin;
endfunction