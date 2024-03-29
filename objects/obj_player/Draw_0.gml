//draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*0.75,image_yscale*0.75,0, c_white, 1);
//draw_sprite_ext(mask_index,image_index,x,y,image_xscale,image_yscale,0, c_white, 1);

if(draw_player){
	draw_sprite_ext(sprite_index,image_index, x+.5 * z, y + .5 * z,image_xscale,image_yscale,0, c_white, 1);
	/*
	if(shadow_sprite != noone){
		draw_sprite_ext(shadow_sprite,image_index,x,y,image_xscale,image_yscale, 0, c_white, 0.175);
	}
	*/

	if(ds_map_exists(global.player_shadow_map, sprite_index))
		draw_sprite_ext(global.player_shadow_map[? sprite_index], image_index, x+.5 * z, y + .5 * z,image_xscale,image_yscale, 0, c_white, 0.175);
	
	if(global.draw_darkness > 0){
	draw_sprite_ext(sprite_index,image_index,x+.5 * z, y + .5 * z,image_xscale,image_yscale,0, c_black, global.draw_darkness);
	}
    
    if distance_to_object(obj_portal) < 30{
        draw_sprite_ext(sprite_index,image_index,x+.5 * z, y + .5 * z,image_xscale,image_yscale,0, c_purple, 1 - (distance_to_object(obj_portal)/30));
    }
    
   // draw_text_transformed(x, y-16, instance_number(obj_inkblot), 0.25, 0.25, 0);
}

