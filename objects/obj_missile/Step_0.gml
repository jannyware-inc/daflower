if(global.enemiespaused || global.paused || global.game_cutscene) return;
var _player = instance_place(x, y, obj_player);
if(_player != noone){
    if(_player.yvel > 0 && !_player.grounded && _player.state != player_states.hitstun && _player.y <= y){
			var _playerdir = point_direction(x, y-4, _player.x, _player.y - 8);
			var _len = 10;
			instance_create_depth(x + lengthdir_x(_len, _playerdir), y - 4 + lengthdir_y(_len, _playerdir), depth - 1, obj_flash);
			xvel = 0;
            dead = true;
            image_yscale = -1;
            direction = 270;
            image_angle = 0;
            spd = 2;
			_player.bounced = true;
			play_sfx(sfx_stomp);
			return;
    }
    if(_player.invincibility_timer == 0 && !_player.fixes.invulnerable) && !dead{
        _player.state = player_states.hitstun;
        _player.state_timeup = 0;
        var _playerdir = point_direction(x, y-4, _player.x, _player.y - 8);
        var _len = 10;
        instance_create_depth(x + lengthdir_x(_len, _playerdir), y - 4 + lengthdir_y(_len, _playerdir), depth - 1, obj_flash);
        screen_shake(8,4);
		instance_destroy();
    }
}
var _heli = instance_place(x,y, obj_helijanny);

if (_heli != noone){
    var _missile = id;
    
    if dead {
        with (_heli){
            
        var _playerdir = point_direction(x, y-4, _missile.x, _missile.y - 8);
        var _len = 10;
        instance_create_depth(x + lengthdir_x(_len, _playerdir), y - 4 + lengthdir_y(_len, _playerdir), depth - 1, obj_flash);
        state = enemy_states.dead;
        //_player.bounced = true;
        play_sfx(sfx_stomp);
        return;
        }
    }
}
if(x < -10 || x > 280 || y < CAM_Y - 20 || y > CAM_Y + CAM_H + 20){
	instance_destroy();
	return;
}
spd = min(spd+accel, spd_max);

xvel = lengthdir_x(spd, direction);
yvel = lengthdir_y(spd, direction);

if !dead{
    image_angle = direction-90;
}

x += xvel;
y += yvel;