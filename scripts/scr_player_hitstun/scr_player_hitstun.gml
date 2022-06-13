// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_hitstun(){
	fixes.can_move = false;
	fixes.can_gravity = true;
	fixes.can_jump = true;
	fixes.can_shoot = false;
	fixes.can_semifloor = true;
	fixes.invulnerable = true;
	fixes.can_deaccelerate = false;
	fixes.can_physics = true;
	
	if(state_timeup == 0){
		yvel = -2;
	}
	if(state_timeup == 7){
		for(var i = 0; i < 30; i++){
			if(water > 0){
				water--;
			} else {
				break;
			}
			with(instance_create_depth(x - 3*sign(image_xscale) + random_range(-2, 2), y - 16 + random_range(-2, 2), depth - 1, obj_water)){
				xvel = -sign(other.image_xscale) * .75;
				if(sign(other.xvel) == sign(xvel)){
					xvel += other.xvel;
				}
				yvel = -2 + random_range(-0.25, .25);
				xvel += random_range(-.5, .5);
				image_angle = point_direction(0, 0, xvel, yvel);
			}
		}
		water = 0;
	}
	xvel = 1 * -sign(image_xscale);
	if(state_timeup >= 25){
		invincibility_timer = invincibility_timer_max;

		state_timeup = 0;
		state = player_states.normal;
		return;
	}
	
	state_timeup++;
}