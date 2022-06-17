// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_game_cutscene_3(){
	if(cutscene_state == 0){
		if(cutscene_timeup == 0){
			audio_stop_all();
		}
		
		if(cutscene_timeup >= 120){
			cutscene_state = 1;
			cutscene_var_0 = CAM_Y;
			cutscene_timeup = 0;
		} else {
			screen_shake(10, 3);
			cutscene_timeup++;
		}
	} else if (cutscene_state == 1){
		var cutscene_timeup_max = 900;
		
		if(cutscene_timeup >= cutscene_timeup_max){
			cutscene_state = 2;
			camera_set_view_pos(view_camera[0], CAM_X, global.starting_y);	
			cutscene_timeup = 0;
		} else {
			screen_shake(10, 3);
			camera_set_view_pos(view_camera[0], CAM_X, lerp(cutscene_var_0, global.starting_y, cutscene_timeup/cutscene_timeup_max));
			
			//spawn fire
			
			var spawn_x = CAM_X + CAM_H/2 + random_range(-20, 20);
			var spawn_y = obj_flower.bbox_top + ((cutscene_timeup/cutscene_timeup_max)*(obj_flower.bbox_bottom - obj_flower.bbox_top)) + random_range(-30, 10);
			
			if(collision_point(spawn_x, spawn_y, obj_flower, false, false)){
				instance_create_depth(spawn_x, spawn_y, depth - 4, obj_fire){
					lifetime = -1;
				}
			}
			
			cutscene_timeup++;
		}
	} else if (cutscene_state == 2){
		camera_set_view_pos(view_camera[0], CAM_X, global.starting_y);	
		screen_shake(10, 3);
	}
	
	//Screen shake
	var camx = camera_get_view_x(view_camera[0]);
	var camy = camera_get_view_y(view_camera[0]);
	var int = global.screen_shake_intensity;
	camera_set_view_pos(view_camera[0], camx + random_range(-int, int), camy + random_range(-int, int));
	
}

function scr_game_cutscene_3_draw(){
	
}