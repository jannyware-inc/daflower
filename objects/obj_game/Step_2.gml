if(room != Room4) return;
/* This code is in charge of panning the camera (by changing global.level)
to match the correct room that corresponds with the height of the flower.*/
if(floor((obj_flower.height-8)/224) != floor(global.level)){
	global.enemiespaused = true;
	instance_destroy(obj_water);
	obj_flower.height = floor(obj_flower.height);
	global.level = global.level+ 1/150;
	if(floor((obj_flower.height-8)/224) == floor(global.level)){
		global.level = floor(global.level);
	}
} else {
	global.enemiespaused = false;
	global.level = floor(global.level);
}
time++;
global.last_level_index = global.level_index;

camera_set_view_pos(view_camera[0], 0, round(global.starting_y - global.level*224));

/*hacky player code to avoid camera shake on transition!!*/
with(obj_player){
	if(state == player_states.level_transition){
		var _percent = min(1, (1 - (state_var_2 - global.level)) * 1);
		var _to_screen_y =  global.player_start_pos[state_var_2].y - global.cam_y_level[state_var_2];
		//log("To level, x, y: " + string(state_var_2) + ", " + string(global.player_start_pos[ceil(global.level)].x) + ", " + string(global.player_start_pos[ceil(global.level)].y));
		x = twerp(TwerpType.out_quad, state_var_0, global.player_start_pos[state_var_2].x,  _percent);
		y = camera_get_view_y(view_camera[0]) + twerp(TwerpType.out_quad, state_var_1, _to_screen_y, _percent);
	}
}


if(global.screen_shake_frames > 0){
	global.screen_shake_frames--;
	var camx = camera_get_view_x(view_camera[0]);
	var camy = camera_get_view_y(view_camera[0]);
	var int = global.screen_shake_intensity;
	camera_set_view_pos(view_camera[0], camx + random_range(-int, int), camy + random_range(-int, int));
}
/* This code runs at the start of the game once. It looks at all the instances
in room4, and puts them all into an array of lists - constructing each list
of all the objects in a certain y range, then deactivates them */
if((room == Room4 || room == mp_game) && level_objects_done == false){
	level_objects_done = true;
	for(var i = 0; i < 10; i++){
		global.cam_y_level[i] = global.starting_y - i * global.level_height;
		global.level_objects[i] = ds_list_create();
		with(obj_wall){
			if(!permanent){
				if(y >= global.starting_y - i * global.level_height){
					ds_list_add(global.level_objects[i], id);
					instance_deactivate_object(id);
				}
			}
		}
		with(obj_semifloor){
			if(object_index != obj_flower){
				if(y >= global.starting_y - i * global.level_height){
					ds_list_add(global.level_objects[i], id);
					instance_deactivate_object(id);
				}
			}
		}
		with(obj_slope){
			if(y >= global.starting_y - i * global.level_height){
				ds_list_add(global.level_objects[i], id);
				instance_deactivate_object(id);
			}
		}
		with(obj_enemyparent){
			if(y >= global.starting_y - i * global.level_height){
				ds_list_add(global.level_objects[i], id);
				instance_deactivate_object(id);
			}
		}
	}
}

/* This code loads all the instances at the first/bottom level */
if(!loaded_first_level){
	loaded_first_level = true;
	var _level = global.level;
	for(var i = 0; i < ds_list_size(global.level_objects[_level]); i++){
		instance_activate_object(global.level_objects[_level][| i]);
	}
	
	/* Save positions of level start in order */
	with(obj_player_start){
		global.player_start_pos[level] = id;
	}
}

switch(global.level_index){
	case 0:
		break;
	case 1:
		break;
	case 2:
		break;
	case 3:
		layer_x("bg_right", (layer_get_x("bg_right")+.25)%256);
		break;
	case 4:
		layer_x("bg_left", -(-layer_get_x("bg_left")+.125)%256);
		global.draw_darkness = min(global.draw_darkness + 0.005, 0.10);
		break;
	case 5:
		var _newx = (layer_get_x("bg_right")+3)%256;
		layer_x("bg_right", _newx);
		layer_y("bg_right", 20* cos((_newx/256)*2*pi * 1));
		global.draw_darkness = min(global.draw_darkness + 0.005, 0.25);
		break;
	case 6:
		layer_x("bg_left", -(-layer_get_x("bg_left")+.125)%256);
		global.draw_darkness = min(global.draw_darkness + 0.005, 0.40);
		break;
	case 7:
		global.draw_darkness = min(global.draw_darkness + 0.005, 0.70);
		break;
	case 8:
		global.draw_darkness = min(global.draw_darkness + 0.005, 1);
		break;
	case 9:
		global.draw_darkness = max(global.draw_darkness - 0.005, .85);
		break;
}

/* Parallax bg */
/*
layer_y("Background", lerp(264, 1984, global.level/10));
*/