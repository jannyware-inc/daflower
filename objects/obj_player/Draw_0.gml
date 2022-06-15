//draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*0.75,image_yscale*0.75,0, c_white, 1);
//draw_sprite_ext(mask_index,image_index,x,y,image_xscale,image_yscale,0, c_white, 1);

if(draw_player){
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0, c_white, 1);
	if(shadow_sprite != noone){
		draw_sprite_ext(shadow_sprite,image_index,x,y,image_xscale,image_yscale, 0, c_white, 0.175);
	}
}

if(keyboard_check(ord("J"))) global.draw_darkness = min(draw_darkness+0.01, 1); 
if(keyboard_check(ord("H"))) global.draw_darkness = max(draw_darkness-0.01, 0); 
if(global.draw_darkness > 0){
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0, c_black, global.draw_darkness);
}