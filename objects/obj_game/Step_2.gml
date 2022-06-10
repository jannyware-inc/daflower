if(floor((obj_flower.height-8)/224) != floor(global.level)){
	instance_destroy(obj_water);
	global.level = min(ceil(global.level+1), global.level+ 1/200);
	obj_flower.height = floor(obj_flower.height);
} else {
	global.level = floor(global.level);
}

camera_set_view_pos(view_camera[0], 0, 4000 - global.level*224);

if(last_room != room && room == Room4 && level_objects_done == false){
	level_objects_done = true;
	log("Storing level objects");
	for(var i = 0; i < 10; i++){
		global.cam_y_level[i] = global.starting_y - i * global.level_height;
		global.level_objects[i] = ds_list_create();
		with(obj_wall){
			if(y >= global.starting_y - i * global.level_height){
				ds_list_add(global.level_objects[i], id);
				instance_deactivate_object(id);
			}
		}
		with(obj_semifloor){
			if(object_index == obj_flower) break;
			if(y >= global.starting_y - i * global.level_height){
				ds_list_add(global.level_objects[i], id);
				instance_deactivate_object(id);
			}
		}
		with(obj_slope){
			if(y >= global.starting_y - i * global.level_height){
				ds_list_add(global.level_objects[i], id);
				instance_deactivate_object(id);
			}
		}
	}
}

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