var _spt = slidesarray[card_index].sprite;
if(_spt != noone){
	draw_sprite_ext(_spt, 0, CAM_W/2, CAM_H/2-30, 1, 1, 0, c_white, floor(image_alpha*4)/4);
}
//draw_text_ext(x,y,count,0,-1);