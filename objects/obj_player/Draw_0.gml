//draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*0.75,image_yscale*0.75,0, c_white, 1);
//draw_sprite_ext(mask_index,image_index,x,y,image_xscale,image_yscale,0, c_white, 1);

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0, c_white, 1);
if(shadow_sprite != noone){
	draw_sprite_ext(shadow_sprite,image_index,x,y,image_xscale,image_yscale, 0, c_white, 0.175);
}