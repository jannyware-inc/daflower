


//y += 0.1;





if(global.enemiespaused || global.paused || global.game_cutscene) return;
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

    
    if count >= turnpoint && !stall{
        

        stall = true;
        xvel = 0;
        token *= -1;
        image_xscale = token;
        count = 0;
        x += token;
        y = starty;
        count2 = 0;
        //y -= ((CAM_W*2)*3)*(0.1);
    }
    
    if stall {
        xvel = 0;
        
        if count2 == 240{
            stall = false;
            
            count2 = 0;
        }
        count2++;
        
        
    }
    else{
    
        if count > 200 {
            y -= .25;  
        }
        else{
            y += .25;   
        }
        count+=3;
        image_index += 0.25;
        xvel = 3;
        x += xvel*token;
    
        if count == 201-9{
        
            var _fireball = instance_create_layer(x+50*image_xscale, y-16, "Instances_back", obj_fireball);
            
            
                audio_play_sound(snd_firespit, 0, false);
        
                with (_fireball){
                    direction = point_direction(x,y,obj_player.x,obj_player.y);
                    speed = 4;
                    image_angle = direction;
                }
                count4 = 15;
                count3 = 0;
        }
        
        
        count4--;
        count3++;
        if count4 <= 0{
            count4 = -1;   
        }
        
        if image_index == 3 {
            
            audio_play_sound(snd_flap, 0, false);   
        }
    
    }
}
else if(state == enemy_states.dead) {
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
		//sprite_index = spr_ladybug_fly;
		var _place_found = false;
		var _camy = camera_get_view_y(view_camera[0]);
		while(!_place_found){
			var _to_x = random_range(8, 256 - 8);
			var _to_y = random_range(_camy, _camy + 200);
			if(!place_meeting(_to_x, _to_y, obj_wall) && !place_meeting(_to_x, _to_y, obj_no_spawn_zone)){
				x = _to_x;
				y = _to_y;
                y = starty;
                x = startx;
                token = 1;
                count = 0;
                count2 = 0;
                stall = false;
                image_xscale = token;
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

