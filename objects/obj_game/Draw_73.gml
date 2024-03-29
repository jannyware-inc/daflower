if(room != Room4) return;
var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);
var _camw = camera_get_view_width(view_camera[0]);
var _camh = camera_get_view_height(view_camera[0]);

var milliseconds = floor(time/60*1000)%1000;
var seconds = floor(time/60)%60;
var minutes = floor(time/60/60);

draw_set_halign(fa_center);
draw_set_font(fnt_prstart);
draw_text(256/2, _camy + 10, string_repeat("0", 2-string_length(string(minutes))) + string(minutes) + ":" 
			+ string_repeat("0", 2-string_length(string(seconds))) + string(seconds) + "."
			+ string_repeat("0", 3-string_length(string(milliseconds))) + string(milliseconds));
draw_set_halign(fa_left);

if(global.game_cutscene != 2 && global.game_cutscene != 3){
	draw_set_halign(fa_right);
	if(global.level_index == 9){
		draw_text(256 - 10, CAM_Y + 10, "Home :)");
	} else {
		draw_text(256 - 10, CAM_Y + 10, "Lv. " + string(global.level_index + 1) + "/9");
	}
	draw_set_halign(fa_left);
}

/*Draw pause screen */
if(global.paused){
	draw_set_color(c_black);
	draw_set_alpha(0.2);
	draw_rectangle(CAM_X - 1, CAM_Y - 1, CAM_X + CAM_W, CAM_Y + CAM_H, false);
	draw_set_halign(fa_center);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_text(CAM_X + CAM_W/2, CAM_Y+CAM_H/2 - 10, "Game is paused.\n(P to unpause)");
	draw_set_halign(fa_left);
}

switch(global.game_cutscene){
	case 1: scr_game_cutscene_1_draw(); break;
	case 2: scr_game_cutscene_2_draw(); break;
	case 3: scr_game_cutscene_3_draw(); break;
}
//scribble("Hello there").draw(_camx + _camw - 60, _camy + 10, typist);