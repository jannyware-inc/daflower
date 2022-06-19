if(global.game_cutscene) exit;
if(global.enemiespaused || global.paused) return;
if (state == enemy_states.alive){
	var _player = instance_place(x, y, obj_player);
	if(_player != noone){
		if(_player.yvel > 0 && !_player.grounded && _player.state != player_states.hitstun && _player.y <= y){
			var _playerdir = point_direction(x, y-4, _player.x, _player.y - 8);
			var _len = 10;
			instance_create_depth(x + lengthdir_x(_len, _playerdir), y - 4 + lengthdir_y(_len, _playerdir), depth - 1, obj_flash);
			state = enemy_states.dead;
			_player.bounced = true;
			play_sfx(sfx_stomp);
			return;
		} else if(_player.invincibility_timer == 0 && !_player.fixes.invulnerable){
			_player.state = player_states.hitstun;
			_player.state_timeup = 0;
			var _playerdir = point_direction(x, y-4, _player.x, _player.y - 8);
			var _len = 10;
			instance_create_depth(x + lengthdir_x(_len, _playerdir), y - 4 + lengthdir_y(_len, _playerdir), depth - 1, obj_flash);
			screen_shake(8,4);
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
    		percentX = clamp((x - _slope.bbox_left)/abs(_slope.image_xscale) * 1/8, 0, 1);
    	} else {
    		percentX = clamp((_slope.bbox_right - (x))/abs(_slope.image_xscale) * 1/8, 0, 1);
    	}
    	var howFarUp = (_slope.bbox_bottom - _slope.bbox_top) * percentX;
    	var proposed_y = _slope.bbox_bottom - howFarUp - 1;
    	if(y >= proposed_y || grounded || last_grounded){
    		grounded = true;
    		grounded_slope_id = _slope;
    	}
    }
	
	switch(substate){
		case ufo_states.flying:
			if(substate_timeup == 0){
				/* Calculate random flying timeup max */
				substate_var_0 = random_range(160, 300);
			}
				
			if(substate_timeup >= substate_var_0){
				substate = ufo_states.shooting;
				substate_timeup = 0;
			} else {
				substate_timeup++;
			}
		
			var _propxvel = lengthdir_x(movelen, direction);
			var _propyvel = lengthdir_y(movelen, direction);
			if((x < 12 && sign(_propxvel) < 0 || x > 256 - 12 && sign(_propxvel) > 0) ||
				(y < CAM_Y + 12 && sign(_propyvel) < 0 || y > CAM_Y + CAM_H - 12 && sign(_propyvel) > 0)){
				direction += 180 + random_range(-160, 70);
			}
	
			xvel = lengthdir_x(movelen, direction);
			yvel = lengthdir_y(movelen, direction);
			break;
		case ufo_states.shooting:
			if(substate_timeup >= 60){
				substate = ufo_states.flying;
				substate_timeup = 0;
			} else {
				substate_timeup++;
			}
			if(substate_timeup == 40){
				with(instance_create_depth(x, y, depth - 1, obj_laser)){
					direction = point_direction(x, y, obj_player.x, obj_player.y - 6);
					//image_angle = direction-90;
                    speed = 4;
				}
			}
			xvel = 0;
			yvel = 0;
			break;		
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

	x += vxNew;
	y += vyNew;

    last_grounded = grounded;

    if(y > camera_get_view_y(view_camera[0]) + 256){
    	y = camera_get_view_y(view_camera[0]);
    	x = random_range(20, 204);
    }
	
	/* Draw helper */
	//sprite_index = spr_ufo;
	//if(abs(xvel) > 0.1){
	//	image_xscale = sign(xvel);
	//}
} else if(state == enemy_states.dead) {
	if(state_timeup == 0){
		instance_create_depth(x , y, depth-2, obj_flash);
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
} else if (state == enemy_states.respawn){
	/* Look for a place to respawn */
	if(state_timeup == 0){
		//sprite_index = spr_heli;
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
		substate = ufo_states.flying;
		substate_timeup = 0;
		return;
	}
	state_timeup++;
}

image_index += xvel*yvel;