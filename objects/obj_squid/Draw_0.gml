if !charging{
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
}
else{
    draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, 0, c_white, 1);
}


//draw_text_transformed(x, y- 12, chargeTimer, 0.25, 0.25, 0);