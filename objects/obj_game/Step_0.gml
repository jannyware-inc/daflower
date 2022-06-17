global.level_index = ceil(global.level);
/*
if(global.bgm_id != noone){
	audio_sound_pitch(global.bgm_id, 1.05);
}*/
if(keyboard_check_pressed(vk_up)){
	obj_flower.height++;
}
if(room != Room4) return;
if(keyboard_check_pressed(vk_down)){
	obj_flower.height--;
}

if(keyboard_check_pressed(vk_left)){
	obj_flower.height -= 224;
	global.level--;
}
if(keyboard_check_pressed(vk_right)){
	//global.level++;
	obj_flower.height += 224;
	global.level++;
}

if(floor(global.level) != floor(global.level)){
	global.level += 1/200;
}

if(global.level_index != global.last_level_index){ //Called at start of transition
	audio_play_sound(snd_leveltransition, 0, false);
    
    //log("Loading track" + string(global.level_index));
	
	/* Switch BGM */
	if(!audio_is_playing(global.bgm_table[global.level_index])){
		audio_play_sound(sfx_advance, 100, false);
		var _track_pos = audio_sound_get_track_position(global.bgm_id);
		audio_stop_sound(global.bgm_id);
		global.bgm = global.bgm_table[global.level_index];
		global.bgm_id = audio_play_sound(global.bgm, 100, true);
		audio_sound_set_track_position(global.bgm_id, _track_pos);
	}
	
	/* Iterate thru last level's list, deactivate all, then activate all of this levels */
	var _last = floor(global.last_level_index);
	var _level = floor(global.level_index);
	
	for(var i = 0; i < ds_list_size(global.level_objects[_last]); i++){
		instance_deactivate_object(global.level_objects[_last][| i]);
	}
	for(var i = 0; i < ds_list_size(global.level_objects[_level]); i++){
		instance_activate_object(global.level_objects[_level][| i]);
	}
	
}
if(floor(global.level) > floor(last_level)){ //Called at end of transition
	
	
}

last_level = global.level;

