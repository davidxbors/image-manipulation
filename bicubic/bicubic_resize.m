function R = bicubic_resize(I, p, q)
    % =========================================================================
    % Upscaling de imagine folosind algoritmul de interpolare bicubica
    % Transforma imaginea I din dimensiune m x n in dimensiune p x q
    % =========================================================================

    [m n nr_colors] = size(I);

    % initializeaza matricea finala
    R = zeros(p, q);

    % daca imaginea e alb negru, ignora
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va
    % deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % si s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul de la 0 la n - 1!


    % TODO: calculeaza factorii de scalare
    % Obs: daca se lucreaza cu indici in intervalul [0, n - 1], ultimul
    % pixel al imaginii se va deplasa de la (m - 1, n - 1) la (p, q).
    % s_x nu va fi q ./ n
    sx = (q-1)./(n-1);
    sy = (p-1)./(m-1);

    % TODO: defineste matricea de transformare pentru redimensionare
    T = [sx 0; 0 sy];

    % TODO: calculeaza inversa transformarii
    invT = inv(T);

    % TODO: precalculeaza derivatele
    [Ix Iy Ixy] = precalc_d(I);

    % parcurge fiecare pixel din imagine
    % foloseste coordonate de la 0 la n - 1
    for y = 0 : p - 1
        for x = 0 : q - 1
            % TODO: aplica transformarea inversa asupra (x, y) si calculeaza
            % x_p si y_p din spatiul imaginii initiale
            transform = [x y] * inv(T);
            % xp = transform(1);
            % yp = transform(2);
            xp = x ./ sx;
            yp = y ./ sy;

            % TODO: trece (xp, yp) din sistemul de coordonate de la 0 la n - 1 in
            % sistemul de coordonate de la 1 la n pentru a aplica interpolarea
            xp = xp + 1;
            yp = yp + 1;

            % TODO: gaseste cele 4 puncte ce inconjoara punctul x, y
            x1 = floor(xp);
            x2 = x1+1;
            y1 = floor(yp);
            y2 = y1+1;
            x2(x2 > n) = (n - 1);
            y2(y2 > m) = (m - 1);

            % TODO: calculeaza coeficientii de interpolare A
            coef = bicubic_coef(I, Ix, Iy, Ixy, x1, y1, x2, y2);

            % TODO: trece coordonatele (xp, yp) in patratul unitate, scazand (x1, y1)
            xp = xp - x1;
            yp = yp - y1;

            % TODO: calculeaza valoarea interpolata a pixelului (x, y)
            % Obs: pentru scrierea in imagine, x si y sunt in coordonate de
            % la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n
            R(y+1, x+1) = [1 xp xp^2 xp^3] * coef * [1; yp; yp^2; yp^3];
        endfor
    endfor

    % TODO: transforma matricea rezultat in uint8 pentru a fi o imagine valida
    R = uint8(R);
endfunction
