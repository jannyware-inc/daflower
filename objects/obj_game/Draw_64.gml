if(room != Room4) return;
if(global.debug){
	draw_text(10, 10, "Flower height: " + string(obj_flower.height));
	draw_text(10, 30, "Level: " + string(global.level));
	draw_text(10, 50, "Level index " + string(global.level_index));
}

//draw_sprite_ext(spr_waterGUI, 0 + ((32)* (obj_player.water / obj_player.max_water)  ), 64, 64, 4, 4, 0, c_white, 1);