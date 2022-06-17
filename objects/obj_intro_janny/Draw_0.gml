var _spt = slidesarray[card_index].sprite;
if(_spt != noone){
	draw_sprite_ext(_spt, 0, CAM_W/2, CAM_H/2-30, 1, 1, 0, c_white, floor(image_alpha*4)/4);
}

draw_set_font(fnt_prstart);
draw_set_alpha(tooltip_alpha);
draw_set_halign(fa_middle);
draw_text(CAM_X + CAM_W/2, CAM_Y + CAM_H - 30, "Press space to skip...");
draw_set_alpha(1);
draw_set_halign(fa_left);
//draw_text_ext(x,y,count,0,-1);