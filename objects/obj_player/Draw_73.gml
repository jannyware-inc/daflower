var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);
var _camw = camera_get_view_width(view_camera[0]);
var _camh = camera_get_view_height(view_camera[0]);

if(playerindex == 0){
	var _bar_length = 60;
	var _bar_height = 6;
	var origin_x = 40;
	var origin_y = 10;
} else {
	var _bar_length = 60;
	var _bar_height = 6;
	var origin_x = _camw - 40;
	var origin_y = 10;
}

if(global.game_cutscene == 0){
	draw_rectangle_color(origin_x - _bar_length/2 - 1, _camy + origin_y - _bar_height/2 - 1 , origin_x + _bar_length/2 + 1, _camy + origin_y + _bar_height/2 + 1, c_black, c_black, c_black, c_black, false);
	if(water/max_water > 0){
		draw_rectangle_color(origin_x - _bar_length/2, _camy + origin_y - _bar_height/2, origin_x - _bar_length/2 + floor(water/max_water * _bar_length), _camy + origin_y + _bar_height/2, c_aqua, c_aqua, c_aqua, c_aqua, false);
	}
}