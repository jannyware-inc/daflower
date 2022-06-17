if(floor(height) != floor(last_height)){	
	var _player_pre_collide = place_meeting(x, y, obj_player);
	var _enemy_pre_collide = instance_place(x, y, obj_enemyparent);
	image_yscale = floor(height);
	var _player_post_collide = place_meeting(x, y, obj_player);
	obj_flowertop.y = other.bbox_top;
	if(!_player_pre_collide && _player_post_collide){
		with(obj_player){
			if(!place_meeting(x, other.bbox_top, obj_wall)){
				y = other.bbox_top;
			}
		}
	}
	if(_enemy_pre_collide = noone && _enemy_pre_collide != noone){
		with(_enemy_pre_collide){
			if(!place_meeting(x, other.bbox_top, obj_wall)){
				y = other.bbox_top;
			}
		}
	}
}

image_yscale = floor(height);
obj_flowertop.x = (bbox_left + bbox_right)/2;
obj_flowertop.y = bbox_top;
if(height > global.winning_height) height = global.winning_height;

/*Play growing sfx if last watered 3 frames ago*/
if(last_growth < 3){
	if(!audio_is_playing(snd_grow)){
		growsound = audio_play_sound(snd_grow, 100, true);
	}
	var _percent = (height-8)/224 % 1;
	//log("percent sound: " + string(_percent));
	audio_sound_pitch(growsound, lerp(.5, 3, _percent));
} else if(growsound != noone){
	audio_stop_sound(growsound);
}

last_growth++;