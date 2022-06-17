if(collision_point(mouse_x, mouse_y, id, false, false)){
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale, 0, c_white, 1);
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale, 0, c_black, 0.3);
} else {
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale, 0, c_white, 1);
}
