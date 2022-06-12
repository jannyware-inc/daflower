if(global.paused) exit;
if(global.level != floor(global.level) && state != player_states.level_transition){
	switch_state(player_states.level_transition);
	state_var_2 = floor(global.level+1)
	state_var_0 = x;
	state_var_1 = y - camera_get_view_y(view_camera[0]);
	log("Var 1: " + string(state_var_1));
}
if(keyboard_check_pressed(ord("I"))){
	z--;
}
if(keyboard_check_pressed(ord("O"))){
	z++;
}

/* Player controller inputs */
ctrl_left_check = keyboard_check(ord("A"));
ctrl_right_check = keyboard_check(ord("D"));

ctrl_up_check = keyboard_check(ord("W"));
ctrl_down_check = keyboard_check(ord("S"));

ctrl_jump_check = keyboard_check(vk_space);
ctrl_jump_press = keyboard_check_pressed(vk_space);

ctrl_action_check = keyboard_check(vk_shift);

ctrl_xaxis_check = ctrl_right_check - ctrl_left_check;
ctrl_yaxis_check = ctrl_down_check - ctrl_up_check;


/* Pre-step checks */
invincibility_timer = max(0, invincibility_timer-1);
grounded = (yvel >= 0 && place_meeting(x, y + 1, obj_wall));
if(!grounded){
	var _semifloor = noone;
	/* Find the semifloor that is closest under the player */
	var _list = ds_list_create();
	var _num = instance_place_list(x, y + 1, obj_semifloor, _list, false);
	if (_num > 0)
	{
	    for (var i = 0; i < _num; ++i)
	    {
			if(_semifloor == noone){
				_semifloor = _list[| i];
			} else if (_list[| i].bbox_top >= y && _list[| i].bbox_top > _semifloor.bbox_top){
				_semifloor = _list[| i];
			}
	    }
	}
	ds_list_destroy(_list); 
	grounded = (yvel >= 0 && _semifloor != noone && _semifloor.bbox_top >= y);
}

/* Slope grounded check */
grounded_slope_id = noone;
var _slope = collision_line(x, y+7, x, y-1, obj_slope, false, false);
if(_slope != noone && yvel >= 0){
	var percentX;
	if(_slope.image_xscale >= 0) {
		percentX = clamp((x + vxNew - _slope.bbox_left)/abs(_slope.image_xscale) * 1/8, 0, 1);
	} else {
		percentX = clamp((_slope.bbox_right - (x + vxNew))/abs(_slope.image_xscale) * 1/8, 0, 1);
	}
	var howFarUp = (_slope.bbox_bottom - _slope.bbox_top) * percentX;
	var proposed_y = _slope.bbox_bottom - howFarUp - 1;
	if(y >= proposed_y || grounded || last_grounded){
		grounded = true;
		grounded_slope_id = _slope;
	}
}

if(grounded)
{
	double_jumped = false;
	can_cancel_jump = false;
}

if (hp <= 0 && state != player_states.dead)
{
    alarm[0] = 180;
    state = player_states.dead;
}

switch(state){
	case player_states.normal: scr_player_normal(); break;
	case player_states.hitstun: scr_player_hitstun(); break;
	case player_states.level_transition: scr_player_level_transition(); break;
}

/* Apply movement speed by player input */
if(fixes.can_move && ctrl_xaxis_check != 0)
{
	if(grounded)
	{
		var _nextXvel = clamp(xvel + walk_xaccel * ctrl_xaxis_check, -xvel_max, xvel_max);
		/* If you're pushing the same direction you're moving, make sure 
			that you don't end up slowing yourself down */
		if(sign(ctrl_xaxis_check) != sign(xvel) || abs(_nextXvel) > abs(xvel)){
			xvel = _nextXvel;
		}
	} else {
		var _nextXvel = clamp(xvel + air_xaccel * ctrl_xaxis_check, -xvel_max, xvel_max);
		/* If you're pushing the same direction you're moving, make sure 
			that you don't end up slowing yourself down */
		if(sign(ctrl_xaxis_check) != sign(xvel) || abs(_nextXvel) > abs(xvel)){
			xvel = _nextXvel;
		}
	}
}
else if(fixes.can_deaccelerate)
{
	/* Converge movement to 0 */
	if(xvel > 0)
	{
		if(grounded)
		{
			xvel = max(0, xvel - walk_xdeaccel);
		} else {
			xvel = max(0, xvel - air_xdeaccel);
		}
	} else {
		if(grounded)
		{
			xvel = min(0, xvel + walk_xdeaccel);
		} else {
			xvel = min(0, xvel + air_xdeaccel);
		}
	}
}

if(fixes.can_jump && ctrl_jump_press && grounded){
    audio_play_sound(snd_jump,0,false);
	yvel = jump_yvel;
	can_cancel_jump = true;
}

/* The player will stop moving up once the jump key is not held */
if(can_cancel_jump && !ctrl_jump_check && yvel < 0){
	yvel = min(yvel + .35, 0);
}

/* Gravity on y axis */
if(fixes.can_gravity){
	yvel = min(yvel + grav, yvel_max);
}

xcollided = false;
ycollided = false;

/* Handle sub-pixel movement */
cx += xvel;
cy += yvel;
vxNew = round(cx);
vyNew = round(cy);
cx -= vxNew;
cy -= vyNew;

if(grounded_slope_id == noone){
	var _slope = collision_line(x + vxNew, y, x+vxNew, y+7, obj_slope, false, false);
	if(_slope == noone)
		_slope = collision_point(x + vxNew, y + vyNew, obj_slope, false, false);
} else {
	_slope = grounded_slope_id;
}
var moved_on_slope = false;
if(fixes.can_physics && _slope != noone){
	var percentX;
	if(_slope.image_xscale >= 0) {
		percentX = clamp((x + vxNew - _slope.bbox_left)/abs(_slope.image_xscale) * 1/8, 0, 1);
	} else {
		percentX = clamp((_slope.bbox_right - (x + vxNew))/abs(_slope.image_xscale) * 1/8, 0, 1);
	}
	var howFarUp = (_slope.bbox_bottom - _slope.bbox_top) * percentX;
	//log("PercentX: " + string(percentX) + " howFarUp: " + string(howFarUp));
	var proposed_y = _slope.bbox_bottom - howFarUp;
	if(y > proposed_y || (grounded_slope_id != noone && yvel >= 0)){
		y = proposed_y;
		if(vyNew < 0) y+= vyNew;
		else yvel = 0;
		vyNew = 0;
		/* Needs collision check here */
		x += vxNew;
		vxNew = 0;
		moved_on_slope = true;
	}
} 
if(fixes.can_physics && !moved_on_slope){
	/* Y axis collision code */
	if(!place_meeting(x, y, obj_wall) && place_meeting(x, y + vyNew, obj_wall))
	{
		ycollided = yvel;
		/*
		var _qblock = instance_place(x, y + vyNew, obj_questionblock);
		if(vyNew < 0 && _qblock != noone)
		{
			if(_qblock.state == qblock_states.not_hit)
				_qblock.state = qblock_states.hit;
		}
		*/
		while(!place_meeting(x, y + sign(vyNew), obj_wall))
		{
			y += sign(vyNew);
		}
		yvel = 0;
		vyNew = 0;
	}
	var _semifloor = noone;
	
	/* Find the semifloor that is closest under the player */
	var _list = ds_list_create();
	var _num = instance_place_list(x, y + vyNew, obj_semifloor, _list, false);
	if (_num > 0)
	{
	    for (var i = 0; i < _num; ++i)
	    {
			if(_semifloor == noone){
				_semifloor = _list[| i];
			} else if (_list[| i].bbox_top >= y && _list[| i].bbox_top > _semifloor.bbox_top){
				_semifloor = _list[| i];
			}
	    }
	}
	ds_list_destroy(_list); 
	
	if(_semifloor != noone && vyNew > 0 && y <= _semifloor.bbox_top){ //If moving down, check that your original height is above the bbox_top
		y = _semifloor.bbox_top;
		yvel = 0;
		vyNew = 0;
	}
	y += vyNew;

	/* X axis collision code */
	if(!place_meeting(x, y, obj_wall) && place_meeting(x + vxNew, y, obj_wall))
	{
		xcollided = xvel;
		while(!place_meeting(x + sign(vxNew), y, obj_wall))
		{
			x += sign(vxNew);
		}
		xvel = 0;
		vxNew = 0;
	}
	if(vxNew == 0 && place_meeting(x+sign(xvel), y, obj_wall)){
		xvel = 0;
	}
	x += vxNew;
}

last_grounded = grounded;

var shooting_dir = 0;
if(fixes.can_shoot)
{
	shooting_dir = scr_player_shoot();
}

/* Draw helper */
shadow_sprite = noone;
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
			if(abs(xvel) > 0.1){
				sprite_index = spr_walk;
				shadow_sprite = spr_walk_shadow;
				image_index += (1/5.99); //Using 1/6 causes a bug.
			} else {
				
				//sprite_index = spr_kirby_stand;	
				sprite_index = spr_standing;
				shadow_sprite = spr_standing_shadow;
				image_index += (1/5.99);
			}
		} else {
			sprite_index = spr_kirby_jump_up;
		}
		break;
}

/*
if(was_shooting == 0 && shooting_dir != 0)
{
	play_sfx(sfx_unzip);
	audio_play_sound(sfx_pee, 100, true);
} else if (was_shooting != 0 && shooting_dir == 0){
	play_sfx(sfx_zip);
	audio_stop_sound(sfx_pee);
}
*/
was_shooting = shooting_dir;


//hp stuff
hp = clamp(hp, 0, maxhp);
water = clamp(water, 0, max_water);

if(y > camera_get_view_y(view_camera[0]) + 256){
	y = camera_get_view_y(view_camera[0]) - 8;
}

if global.level = 6{
    grav = .0875   
}