function out = bicubic_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img a.i. aceasta sa fie de dimensiune p x q.
    % Imaginea img este colorata.
    % Practic, apeleaza de 3 ori functia nn pe fiecare canal al imaginii.
    % =========================================================================

    % TODO: extrage canalul rosu al imaginii
    red_ch = img(:,:,1);
    % TODO: extrage canalul verde al imaginii
    green_ch = img(:,:,2);
    % TODO: extrace canalul albastru al imaginii
    blue_ch = img(:,:,3);

    % TODO: aplica functia nn pe cele 3 canale ale imaginii
    red = bicubic_resize(red_ch, p, q);
    green = bicubic_resize(green_ch, p, q);
    blue = bicubic_resize(blue_ch, p ,q);

    % TODO: formeaza imaginea finala cu cele 3 canale de culori
    % Hint: functia cat
    out = cat(3, red, green, blue);
endfunction
