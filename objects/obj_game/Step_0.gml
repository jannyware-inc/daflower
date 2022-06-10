if(keyboard_check_pressed(vk_up)){
	obj_flower.height++;
}
if(keyboard_check_pressed(vk_down)){
	obj_flower.height--;
}

if(keyboard_check_pressed(vk_left)){
	global.level--;
}
if(keyboard_check_pressed(vk_right)){
	global.level++;
}

if(floor(global.level) != floor(global.level)){
	global.level += 1/200;
}

if(floor(global.level) > floor(last_level)){
	/* Iterate thru last level's list, deactivate all, then activate all of this levels */
	var _last = floor(last_level);
	var _level = floor(global.level);
	
	for(var i = 0; i < ds_list_size(global.level_objects[_last]); i++){
		instance_deactivate_object(global.level_objects[_last][| i]);
	}
	for(var i = 0; i < ds_list_size(global.level_objects[_level]); i++){
		instance_activate_object(global.level_objects[_level][| i]);
	}
}
last_level = global.level;
