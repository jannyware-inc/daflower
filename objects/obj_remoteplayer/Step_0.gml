interp_frame++;
x = lerp(from_x, to_x, min(interp_frame, interp_frame_max+1)/(interp_frame_max+1));
y = lerp(from_y, to_y, min(interp_frame, interp_frame_max+1)/(interp_frame_max+1));


xvel = x - last_x;
yvel = y - last_y;

grounded = place_meeting(x, y + 1, obj_wall);

var shooting_dir = watering;
shadow_sprite = noone;
var state_var_0 = 0;
var state_timeup = 0;
ctrl_xaxis_check = image_xscale;

draw_player = true;
if(watering != 0){
	scr_remoteplayer_shoot();
}
switch(state)
{
	case(player_states.normal):
		/* If player is pressing left or right on their keyboard, change xscale of image */
		if(shooting_dir != 0)
		{
			image_xscale = shooting_dir;
		} else if (ctrl_xaxis_check != 0) {
			image_xscale = ctrl_xaxis_check;
		}
		if(grounded)
		{			
			if(abs(xvel) > 0.05){
				sprite_index = spr_walk;
				shadow_sprite = spr_walk_shadow;
				image_index += (1/4); //Using 1/6 causes a bug.
			} else {
				if(shooting_dir != 0){
					sprite_index = spr_watering;
					shadow_sprite = spr_watering_shadow;
				} else {
					if(state_var_0 % 240 == 130) image_index = 0;
					if(state_var_0 % 240 >= 130){
						sprite_index = spr_looking_away;
						shadow_sprite = spr_looking_away_shadow;
						image_index += (1/5.99);
					} else {
						sprite_index = spr_standing;
						shadow_sprite = spr_standing_shadow;
						image_index += (1/5.99);
					}
				}
			}
		} else {
			if(yvel < 0){
				sprite_index = spr_jump;
				shadow_sprite = spr_jump_shadow;
				image_index = 1;
			} else {
				sprite_index = spr_jump;
				shadow_sprite = spr_jump_shadow;
				image_index = 2;
			}
		}
		break;
	case player_states.hitstun:
		if(state_timeup < 8) image_index = 0; else image_index = 1;
		sprite_index = spr_hurt;
		shadow_sprite = spr_hurt_shadow;
		break;
}

last_x = x;
last_y = y;