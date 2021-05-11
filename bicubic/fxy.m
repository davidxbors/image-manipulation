function r = fxy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x si y a lui f in punctul (x, y).
    % =========================================================================
    % TODO: calculeaza derivata
    [m n nc] = size(f);

    if y == 1 || y == n
      r = 0;
    else
    r = (fy(f, x, y+1) - fy(f,x, y-1))/2;
    endif
endfunction
