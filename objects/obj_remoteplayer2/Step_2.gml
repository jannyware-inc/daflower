if(state == player_states.level_transition){
	var _percent = min(1, (1 - (state_var_2 - global.level)) * 1);
	var _to_screen_y =  global.player_start_pos[state_var_2].y - global.cam_y_level[state_var_2];
	//log("To level, x, y: " + string(state_var_2) + ", " + string(global.player_start_pos[ceil(global.level)].x) + ", " + string(global.player_start_pos[ceil(global.level)].y));
	x = twerp(TwerpType.out_quad, state_var_0, global.player_start_pos[state_var_2].x,  _percent);
	y = camera_get_view_y(view_camera[0]) + twerp(TwerpType.out_quad, state_var_1, _to_screen_y, _percent);
}