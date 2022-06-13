if (state == enemy_states.alive){
	var _player = instance_place(x, y, obj_player);
	if(_player != noone){
		if(_player.yvel > 0 && !_player.grounded && _player.state != player_states.hitstun && _player.y <= y){
			var _playerdir = point_direction(x, y-4, _player.x, _player.y - 8);
			var _len = 10;
			instance_create_depth(x + lengthdir_x(_len, _playerdir), y - 4 + lengthdir_y(_len, _playerdir), depth - 1, obj_flash);
			state = enemy_states.dead;
			_player.yvel = -4;
			_player.can_cancel_jump = true;
			play_sfx(sfx_stomp);
			return;
		} else if(_player.invincibility_timer == 0 && !_player.fixes.invulnerable){
			_player.state = player_states.hitstun;
			_player.state_timeup = 0;
			var _playerdir = point_direction(x, y-4, _player.x, _player.y - 8);
			var _len = 10;
			instance_create_depth(x + lengthdir_x(_len, _playerdir), y - 4 + lengthdir_y(_len, _playerdir), depth - 1, obj_flash);
			screen_shake(4,1);
		}
	}
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

    if(xcollided != 0) image_xscale = -image_xscale;
    xvel = movespd * image_xscale;


    yvel = min(yvel + grav, yvel_max);

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
    if(_slope != noone){
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
    if(!moved_on_slope){
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

    if(y > camera_get_view_y(view_camera[0]) + 256){
    	y = camera_get_view_y(view_camera[0]);
    	x = random_range(20, 204);
    }
    
    if hp <= 0 {
        xvel = 0;
        yvel = 0;
        dead = true;
        var anim = instance_create_layer(x , y, "animations", obj_flash);
    }
	
	/* Draw helper */
	sprite_index = spr_bee_fly;
} else if(state == enemy_states.dead) {
	if(state_timeup == 0){
		y -= sprite_height/2;
		yvel = -3;
		xvel = .5 * sign(image_xscale);
		scr_drop_water();
	}
	yvel += .2;
	y += yvel;
	x += xvel;
	image_speed = 0;
	image_yscale = -1;
	state_timeup++;
	if(state_timeup >= 160){
		state_timeup = 0;
		state = enemy_states.respawn;
		yvel = 0;
		xvel = 0;
		dead = false;
		y = camera_get_view_y(view_camera[0]) - 8;
    	x = random_range(20, 236);
		image_yscale = 1;
		image_speed = 1;
	}
	/*
    if deathcount <= 0 {
        scr_drop_water();
        instance_destroy();   
    }
    
    deathcount--;
	*/
	
} else if (state == enemy_states.respawn){
	/* Look for a place to respawn */
	if(state_timeup == 0){
		sprite_index = spr_bee_fly;
		var _place_found = false;
		var _camy = camera_get_view_y(view_camera[0]);
		while(!_place_found){
			var _to_x = random_range(8, 256 - 8);
			var _to_y = random_range(_camy, _camy + 200);
			if(!place_meeting(_to_x, _to_y, obj_wall) && !place_meeting(_to_x, _to_y, obj_no_spawn_zone)){
				x = _to_x;
				y = _to_y;
				_place_found = true;
			}
		}
	}
	visible = ((state_timeup % 4) < 2);
	if(state_timeup >= 60){
		visible = true;
		state_timeup = 0;
		state = enemy_states.alive;
		return;
	}
	state_timeup++;
}