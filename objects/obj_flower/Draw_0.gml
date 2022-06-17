
var sheight = sprite_get_height(spr_flowerstem);

//Draws flower stem
var drawy = min(CAM_Y + CAM_H + 30  + (CAM_Y+CAM_H%sheight), bbox_bottom);
while(drawy >= bbox_top - 4){
	draw_sprite(spr_flowerstem, 0, x, drawy);
	if(global.draw_darkness > 0){
		draw_sprite_ext(spr_flowerstem,0,x, drawy, 1, 1, 0, c_black, global.draw_darkness);
	}
	drawy -= sheight;
}

//Draws flower head
draw_sprite(spr_flower_gfx, 0, x, bbox_top);
if(global.draw_darkness > 0){
	draw_sprite_ext(spr_flower_gfx,0,x, bbox_top, 1, 1, 0, c_black, global.draw_darkness);
}