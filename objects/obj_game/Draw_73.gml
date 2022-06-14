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
//scribble("Hello there").draw(_camx + _camw - 60, _camy + 10, typist);