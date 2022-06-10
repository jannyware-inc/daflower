with(obj_player){
	draw_sprite_ext(sprite_index, image_index, x + 2 - z*.5, y + 2 - z*.5, image_xscale*0.75, image_yscale*0.75, image_angle, c_black, 0.5);
}
with(obj_wall){
	draw_sprite_ext(sprite_index, image_index, x + 2, y + 2, image_xscale, image_yscale, image_angle, c_black, 0.5);
}