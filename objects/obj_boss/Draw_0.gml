if !ismoving{
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
}
else{
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_silver, 0.25);
}

if bubble && state != enemy_states.dead{
    draw_sprite_ext(spr_bubble, 0, x, y-7, 1, 1, 0, c_white, 0.5);   
}