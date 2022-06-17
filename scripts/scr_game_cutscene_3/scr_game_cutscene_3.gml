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
		if(cutscene_timeup == 0){
			cutscene_var_1 = audio_play_sound(snd_burnloop, 100, true);
		}
		if(cutscene_timeup >= cutscene_timeup_max){
			cutscene_state = 2;
			camera_set_view_pos(view_camera[0], CAM_X, global.starting_y);	
			cutscene_timeup = 0;
		} else {
			screen_shake(10, 3);
			camera_set_view_pos(view_camera[0], CAM_X, lerp(cutscene_var_0, global.starting_y, cutscene_timeup/cutscene_timeup_max));
			
			//spawn fire
			
			var spawn_x = CAM_X + CAM_W/2 + random_range(-20, 20);
			var spawn_y = obj_flower.bbox_top + (min((cutscene_timeup/(cutscene_timeup_max-5)),1)*(obj_flower.bbox_bottom+16 - obj_flower.bbox_top)) + random_range(-30, 20);
			
			if(collision_point(spawn_x, spawn_y, obj_flower, false, false)){
				with(instance_create_depth(spawn_x, spawn_y, depth - 4, obj_fire)){
					lifetime = -1;
				}
			}
			
			cutscene_timeup++;
		}
	} else if (cutscene_state == 2){
		camera_set_view_pos(view_camera[0], CAM_X, global.starting_y);	
		screen_shake(10, 3);
		if(cutscene_timeup >= 60){
			cutscene_timeup = 0;
			cutscene_state = 3;
		} else {
			cutscene_timeup++;
		}
	} else if (cutscene_state == 3){
		camera_set_view_pos(view_camera[0], CAM_X, global.starting_y);
		screen_shake(10, 3);
		var fire_climb_timeup = 200;
		
		if(cutscene_timeup >= 250){
			cutscene_timeup = 0;
			cutscene_state = 4;
		} else {
			var spawn_x = CAM_X + random_range(0, CAM_W);
			var spawn_y = CAM_Y + CAM_H - min(cutscene_timeup/fire_climb_timeup, 1) * CAM_H + random_range(-20, 20);
			
			for(var i = 0; i < 2; i++){
				with(instance_create_depth(spawn_x, spawn_y, depth - 11, obj_fire)){
					spits_particles = false;
					lifetime = -1;
				}
			}
		}
		cutscene_timeup++;
	} else if (cutscene_state == 4){
		camera_set_view_pos(view_camera[0], CAM_X, global.starting_y);
		if(cutscene_timeup >= 250){
			//GO TO NEXT ROOM
			audio_stop_sound(cutscene_var_1);
			room_goto(EndingRoomJanny);
		} else {			
			cutscene_timeup++;
			audio_sound_gain(cutscene_var_1, 1-cutscene_timeup/250, 1);
		}
	}
	
	//Screen shake
	var camx = camera_get_view_x(view_camera[0]);
	var camy = camera_get_view_y(view_camera[0]);
	var int = global.screen_shake_intensity;
	camera_set_view_pos(view_camera[0], camx + random_range(-int, int), camy + random_range(-int, int));
	
}

function scr_game_cutscene_3_draw(){
	if(cutscene_state == 0){
		draw_set_alpha(1 - min(cutscene_timeup/50, 1));
		var color = make_color_rgb(255, 255, 255);
		draw_rectangle_color(CAM_X-1, CAM_Y-1, CAM_X + CAM_W, CAM_Y + CAM_H, color, color, color, color, false);
		draw_set_alpha(1);
	}
	if(cutscene_state == 3){
		draw_set_alpha(min(cutscene_timeup/250, 1));
		
		var color = make_color_rgb(255, 90, 0);
		draw_rectangle_color(CAM_X-1, CAM_Y-1, CAM_X + CAM_W, CAM_Y + CAM_H, color, color, color, color, false);
		draw_set_alpha(1);
	} else if(cutscene_state == 4){
		var color = make_color_rgb(255, 90, 0);
		draw_rectangle_color(CAM_X-1, CAM_Y-1, CAM_X + CAM_W, CAM_Y + CAM_H, color, color, color, color, false);
		
		draw_set_alpha(min(cutscene_timeup/250, 1));
		
		var color = make_color_rgb(0, 0, 0);
		draw_rectangle_color(CAM_X-1, CAM_Y-1, CAM_X + CAM_W, CAM_Y + CAM_H, color, color, color, color, false);
		draw_set_alpha(1);
	}
}