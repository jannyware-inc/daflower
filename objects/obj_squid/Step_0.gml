if(global.enemiespaused || global.paused || global.game_cutscene) return;
var _player = instance_place(x, y, obj_player);
if(_player != noone) && state != enemy_states.dead{
    if(_player.yvel > 0 && !_player.grounded && _player.state != player_states.hitstun && _player.y <= y){
        var _playerdir = point_direction(x, y-4, _player.x, _player.y - 8);
        var _len = 10;
        instance_create_depth(x + lengthdir_x(_len, _playerdir), y - 4 + lengthdir_y(_len, _playerdir), depth - 1, obj_flash);
        state = enemy_states.dead;
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
    
    if count == 80{
        var inst = instance_create_layer(x,y-6,"instances", obj_inkblot);
        audio_play_sound(snd_fireink, 0, false);
        
        with (inst){
            direction = point_direction (x ,y, obj_player.x, obj_player.y-6);
            speed = 3;
        }
    }
    
    
    
    
    
    if chargeTimer == 0 && !charging{
        charging = true;
        
        xvel = 0;
        
    }
    
    if charging {
        if obj_player.y - y > 50 || abs(obj_player.x - x) < 10{
            
            chargeTimer = 0;
        }
    }
    
    if chargeTimer == 80 {
        yvel = -jumpHeight;
        charging = false;
        
        if x - obj_player.x < 0 {
            xvel = 2;   
        }
        else{
            xvel = -2;   
        }
    }
    
    if chargeTimer > 80 {
        xvel *= 0.95   
    }
    
    if abs(xvel) < .25{
        xvel  = 0;   
    }
    chargeTimer++;
    count ++;
    
    
    if count == 120 {
        count = 0;   
    }
    if chargeTimer == 120{
        chargeTimer = 0;
        
    }
    
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
    
    x+=vxNew;
    y+=vyNew;
    
	if(y > camera_get_view_y(view_camera[0]) + 256){
    	y = camera_get_view_y(view_camera[0]);
    	x = random_range(20, 204);
    }

}
if(state == enemy_states.dead) {
	if(state_timeup == 0){
		y -= sprite_height/2;
        x -= 5;
		yvel = -3;
		xvel = .5 * sign(image_xscale);
		scr_drop_water();
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
	/* Look for a place to respawn */
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
}