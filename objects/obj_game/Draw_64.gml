if(room != Room4) return;
if(global.debug){
	draw_text(10, 10, "Flower height: " + string(obj_flower.height));
	draw_text(10, 30, "Level: " + string(global.level));
	draw_text(10, 50, "Level index " + string(global.level_index));
}