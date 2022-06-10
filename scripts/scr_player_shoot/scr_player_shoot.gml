// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_shoot(){
	if(ctrl_action_check){
		with(instance_create_depth(x + 12*sign(image_xscale) + random_range(-2, 2), y - 7 + random_range(-2, 2), depth - 1, obj_water)){
			xvel = sign(other.image_xscale) * 1;
			if(sign(other.xvel) == sign(xvel)){
				xvel += other.xvel;
			}
			yvel = 1;
			xvel += random_range(-.2, .2);
			image_angle = point_direction(0, 0, xvel, yvel);
		}
		return sign(image_xscale);
	}
	return 0;
}