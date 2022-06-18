if(global.enemiespaused || global.paused || global.game_cutscene) return;
if !ismoving{
if count1 % 30 == 0 {
    y += sign(token)  
    token *= -1;
}

var _player = instance_place(x, y, obj_player);
if(_player != noone) && state != enemy_states.dead{
    if(_player.yvel > 0 && !_player.grounded && _player.state != player_states.hitstun && _player.y <= y){
        var _playerdir = point_direction(x, y-4, _player.x, _player.y - 8);
        var _len = 10;
        instance_create_depth(x + lengthdir_x(_len, _playerdir), y - 4 + lengthdir_y(_len, _playerdir), depth - 1, obj_flash);
        if !bubble{
            state = enemy_states.dead;
        }
        else{
            bubble = false;   
        }
        _player.bounced = true;
        play_sfx(sfx_stomp);
        return;
    } 
    else if(_player.invincibility_timer == 0 && !_player.fixes.invulnerable){
        _player.state = player_states.hitstun;
        _player.state_timeup = 0;
        var _playerdir = point_direction(x, y-4, _player.x, _player.y - 8);
        var _len = 10;
        instance_create_depth(x + lengthdir_x(_len, _playerdir), y - 4 + lengthdir_y(_len, _playerdir), depth - 1, obj_flash);
        screen_shake(8,4);
    }
}

if state = enemy_states.alive{
    
    tpdelay--;
    count3 += 0.5;
    count2++;
    count1++;

    if firedcount % 2 == 0 && !tpdelay{
        count2 = 0;
        tpdelay = 200;
    
        var newx, newy, foundspot;
    
        foundspot = false;
    
        newx = obj_player.x + random_range(20, 70)*sign(random_range(-1.1,1));
        newy = obj_player.y + random_range(20, 70)*sign(random_range(-1.1,1));
    
        if place_meeting(newx,newy,obj_wall){
    
        while !foundspot{
            newx = random_range(CAM_X, CAM_W);
            newy = random_range(CAM_Y, CAM_H);
        
            if !place_meeting(newx, newy, obj_wall){
                foundspot = true;   
            }
        }
    
        }
    
        targetx = newx;
        targety = newy;
        
        ismoving = true;
    }

    if count3 > 79{
        image_index = (count3 - 74)/4;   
    }

    if count3 == 108{
    
        var las = instance_create_layer(x-2,y-12,"animations", obj_laser);
        firedcount++;
        //tpdelay = 30;
    
        with (las){
            direction = point_direction(x,y,obj_player.x,obj_player.y-12);
            speed = 6;
        
        }
    }

    if count3 == 123{
        image_index = 0;
        count3 = 0;
    }

}
if(state == enemy_states.dead) {
	if(state_timeup == 0){
		y -= sprite_height/2;
        x -= 5;
		yvel = -3;
		xvel = .5 * sign(image_xscale);
		scr_drop_water_number(2);
	}
	yvel += .2;
	y += yvel;
	x += xvel;
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
	}
	/*
    if deathcount <= 0 {
        scr_drop_water();
        instance_destroy();   
    }
    
    deathcount--;
	*/
	
}
if (state == enemy_states.respawn){
	/* Look for a place to respawn 
	if(state_timeup == 0){
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
    
    */
    //global.bgm = global.bgm_table[10];
    instance_destroy();
}
}
else{
    if x != targetx{
        x += lengthdir_x(4,point_direction(x,y,targetx,targety));
    }
    if y != targety{
        y += lengthdir_y(4,point_direction(x,y,targetx,targety));
    }
    
    if distance_to_point(targetx, targety) < 4{
     ismoving = false;
     x = targetx;
     y = targety;
    }
}