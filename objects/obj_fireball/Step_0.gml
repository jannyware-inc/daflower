//var _wall = instance_place(x,y,obj_wall);


//if _wall != noone {
  //  instance_destroy();   
//}
var _player = instance_place(x, y, obj_player);
    
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

if(x < -10 || x > 280 || y < CAM_Y - 20 || y > CAM_Y + CAM_H + 20){
	instance_destroy();
	return;
}

image_index += .25;