var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);
var _camw = camera_get_view_width(view_camera[0]);
var _camh = camera_get_view_height(view_camera[0]);
var _full_bar_length = 60;

if(playerindex == 0){
	draw_rectangle_color(10-1, _camy + 5 - 1, 15 + floor(_full_bar_length * 1) + 1, _camy + 25 + 1, c_black, c_black, c_black, c_black, false);
	if(water/max_water > 0){
		draw_rectangle_color(10, _camy + 10, 10 + floor(_full_bar_length * water/max_water), _camy + 25, c_blue, c_aqua, c_aqua, c_blue, false);
	}
} else if (playerindex == 1){
	draw_rectangle_color(_camw-70+1, _camy + 5 - 1, _camw - 70 + floor(_full_bar_length * 1) + 1, _camy + 25 + 1, c_black, c_black, c_black, c_black, false);
	if(water/max_water > 0){
		draw_rectangle_color(_camw - 70, _camy + 10, _camw - 70 + floor(_full_bar_length * water/max_water), _camy + 25, c_blue, c_aqua, c_aqua, c_blue, false);
	}
}