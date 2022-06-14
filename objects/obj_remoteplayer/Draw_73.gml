var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);
var _camw = camera_get_view_width(view_camera[0]);
var _camh = camera_get_view_height(view_camera[0]);
var _full_bar_length = 60;
draw_rectangle_color(10-1, _camy + _camh - 20 - 1, 10 + floor(_full_bar_length * 1) + 1, _camy + _camh - 15 + 1, c_black, c_black, c_black, c_black, false);
if(water/max_water > 0){
	draw_rectangle_color(10, _camy + _camh - 20, 10 + floor(_full_bar_length * water/max_water), _camy + _camh - 15, c_blue, c_aqua, c_aqua, c_blue, false);
}