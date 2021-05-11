function out = nn_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare nearest neighbour pe imaginea 2x2 img cu puncte
    % intermediare echidistante.
    % img este o imagine colorata RGB.
    % =========================================================================

    % TODO: extrage canalul rosu al imaginii
    red_ch = img(:,:,1);
    % TODO: extrage canalul verde al imaginii
    green_ch = img(:,:,2);
    % TODO: extrace canalul albastru al imaginii
    blue_ch = img(:,:,3);

    % TODO: aplica functia nn pe cele 3 canale ale imaginii
    nn_red_ch = nn_2x2(red_ch, STEP);
    nn_green_ch = nn_2x2(green_ch, STEP);
    nn_blue_ch = nn_2x2(blue_ch, STEP);

    % TODO: formeaza imaginea finala cu cele 3 canale de culori
    % Hint: functia cat
    out = cat(3, nn_red_ch, nn_green_ch, nn_blue_ch);

endfunction
