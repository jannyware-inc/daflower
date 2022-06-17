var drawy = min(CAM_Y + CAM_H + 30, bbox_bottom);
var sheight = sprite_get_height(spr_flowerstem);
while(drawy >= bbox_top - 4){
	draw_sprite(spr_flowerstem, 0, x, drawy);
	if(global.draw_darkness > 0){
		draw_sprite_ext(spr_flowerstem,0,x, drawy, 1, 1, 0, c_black, global.draw_darkness);
	}
	drawy -= sheight;
}

//draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0, c_white, 1);
draw_sprite(spr_flower_gfx, 0, x, bbox_top);
if(global.draw_darkness > 0){
	draw_sprite_ext(spr_flower_gfx,0,x, bbox_top, 1, 1, 0, c_black, global.draw_darkness);
}