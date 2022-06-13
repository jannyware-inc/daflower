/* This code is in charge of panning the camera (by changing global.level)
to match the correct room that corresponds with the height of the flower.*/
if(floor((obj_flower.height-8)/224) != floor(global.level)){
	instance_destroy(obj_water);
	obj_flower.height = floor(obj_flower.height);
	global.level = global.level+ 1/150;
	if(floor((obj_flower.height-8)/224) == floor(global.level)){
		global.level = floor(global.level);
	}
} else {
	global.level = floor(global.level);
}
global.last_level_index = global.level_index;

camera_set_view_pos(view_camera[0], 0, 4000 - global.level*224);
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
if(room == Room4 && level_objects_done == false){
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

/* Parallax bg */
layer_y("Background", lerp(264, 1984, global.level/10));