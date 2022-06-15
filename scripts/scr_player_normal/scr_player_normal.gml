// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_normal(){
	fixes.can_move = true;
	fixes.can_gravity = true;
	fixes.can_jump = true;
	fixes.can_shoot = true;
	fixes.can_semifloor = true;
	fixes.invulnerable = false;
	fixes.can_deaccelerate = true;
	fixes.can_physics = true;
	if(state_timeup == 0){
		state_var_0 = 0;
	}
	if(grounded && abs(xvel) < 0.1){
		state_var_0++;
	} else {
		state_var_0 = 0;	
	}
	state_timeup++;
}