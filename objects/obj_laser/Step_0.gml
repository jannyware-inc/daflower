if sprite_index == spr_laser && image_index == 4 {
    image_angle = 0;
    sprite_index = spr_laser_dir; 
    image_index = 0;
    
    if direction > 90{
        var secdir = direction % 90;
    }
    
    else{
        var secdir = direction;   
        image_index = (secdir/90)*60;
    }
    
    if direction > 90 {
        image_xscale = -1;
        image_index = 60-(secdir/90)*60;
    }
    if direction > 180 {
        image_yscale = -1;
        image_index = (secdir/90)*60;
    }
    if direction > 270 {
        image_xscale = 1;
        image_index = 60-(secdir/90)*60;
    }
    
    
    
}

if sprite_index = spr_laser_dir{
    image_angle = direction;
    var _player = instance_place(x, y, obj_player);
    image_angle = 0;
    
    if _player != noone{
 if(_player.invincibility_timer == 0 && !_player.fixes.invulnerable){
			_player.state = player_states.hitstun;
			_player.state_timeup = 0;
			var _playerdir = point_direction(x, y-4, _player.x, _player.y - 8);
			var _len = 10;
			instance_create_depth(x + lengthdir_x(_len, _playerdir), y - 4 + lengthdir_y(_len, _playerdir), depth - 1, obj_flash);
			screen_shake(8,4);
		}   
    }
}

if sprite_index == spr_laser{
    image_angle = direction;
    
    x -= lengthdir_x(speed, direction);
    y -= lengthdir_y(speed, direction);
    image_index += 0.5;
}

