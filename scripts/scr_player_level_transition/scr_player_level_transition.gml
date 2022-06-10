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
	
	var _percent = 1 - (state_var_2 - global.level);
	log("Percent: " +string(_percent));
	if(floor(global.level) == global.level){
		log("Done transistioning");
		x = global.player_start_pos[state_var_2].x;
		y = global.player_start_pos[state_var_2].y;
		switch_state(player_states.normal);
		return;
	}
	
	//log("To level, x, y: " + string(state_var_2) + ", " + string(global.player_start_pos[ceil(global.level)].x) + ", " + string(global.player_start_pos[ceil(global.level)].y));
	x = lerp(state_var_0, global.player_start_pos[state_var_2].x,  _percent);
	y = lerp(state_var_1, global.player_start_pos[state_var_2].y,  _percent);
}