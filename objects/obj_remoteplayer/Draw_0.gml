

if(draw_player){
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0, c_white, 1);
	if(shadow_sprite != noone){
		draw_sprite_ext(shadow_sprite,image_index,x,y,image_xscale,image_yscale, 0, c_white, 0.175);
	}
}

if(watering) draw_line(x, y, x, y-15);

draw_text(x, y - 20, xvel);