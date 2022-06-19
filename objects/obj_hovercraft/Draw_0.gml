draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
if(substate == ufo_states.shooting){
	if(abs(substate_timeup - 40) < 4){
		gpu_set_fog(true, c_white, 0, 1000);
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
		gpu_set_fog(false, c_white,0,1000);
	}
}

/*
if !dead{
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
}
else{
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, (deathcount/150));
}
*/