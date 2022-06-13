// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_level_transition(){
	fixes.can_move = true;
	fixes.can_gravity = true;
	fixes.can_jump = true;
	fixes.can_shoot = false;
	fixes.can_semifloor = true;
	fixes.invulnerable = true;
	fixes.can_deaccelerate = true;
	fixes.can_physics = false;
	
	var _percent = min(1, (1 - (state_var_2 - global.level)) * 1);
	if(_percent > .5) image_xscale = sign(global.player_start_pos[state_var_2].dir);
	if(floor(global.level) == global.level){
		x = global.player_start_pos[state_var_2].x;
		y = global.player_start_pos[state_var_2].y;
		
		switch_state(player_states.normal);
		return;
	}
	var _to_screen_y =  global.player_start_pos[state_var_2].y - global.cam_y_level[state_var_2];
	//log("To level, x, y: " + string(state_var_2) + ", " + string(global.player_start_pos[ceil(global.level)].x) + ", " + string(global.player_start_pos[ceil(global.level)].y));
	x = twerp(TwerpType.out_quad, state_var_0, global.player_start_pos[state_var_2].x,  _percent);
	y = camera_get_view_y(view_camera[0]) + twerp(TwerpType.out_quad, state_var_1, _to_screen_y, _percent);
	z = -12*2*(.5 - abs(_percent - .5))
}