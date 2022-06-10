// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_level_transition(){
	fixes.can_move = true;
	fixes.can_gravity = true;
	fixes.can_jump = true;
	fixes.can_shoot = true;
	fixes.can_semifloor = true;
	fixes.invulnerable = false;
	fixes.can_deaccelerate = true;
	fixes.can_physics = false;
	
	var _percent = min(1, (1 - (state_var_2 - global.level)) * 1);
	log("Percent: " + string(_percent));
	if(floor(global.level) == global.level){
		log("Done transistioning");
		x = global.player_start_pos[state_var_2].x;
		y = global.player_start_pos[state_var_2].y;
		image_xscale = sign(global.player_start_pos[state_var_2].dir);
		switch_state(player_states.normal);
		return;
	}
	
	var _to_screen_y =  global.player_start_pos[state_var_2].y - global.cam_y_level[state_var_2];
	log("to screen y: " + string(_to_screen_y));
	//log("To level, x, y: " + string(state_var_2) + ", " + string(global.player_start_pos[ceil(global.level)].x) + ", " + string(global.player_start_pos[ceil(global.level)].y));
	x = twerp(TwerpType.inout_quad, state_var_0, global.player_start_pos[state_var_2].x,  _percent);
	y = camera_get_view_y(view_camera[0]) + twerp(TwerpType.inout_quad, state_var_1, _to_screen_y, _percent);
}