if(mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, obj_button_time_attack, false, false)){
	room_goto(Room4);
}
if(mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, obj_button_score_attack, false, false)){
	room_goto(mp_lobby);
}

if(mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, obj_button_credits, false, false)){
	cam_focus_timeup = 0;
	cam_focus_y = 224;
	cam_focus_y_from = CAM_Y;
}

if(mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, obj_button_back, false, false)){
	cam_focus_timeup = 0;
	cam_focus_y = 0;
	cam_focus_y_from = CAM_Y;
}

layer_x("Background_clouds", layer_get_x("Background_clouds") + 0.1);

cam_focus_timeup = min(cam_focus_timeup+1, cam_focus_timeup_max);
var _new_y = twerp(TwerpType.inout_quad, cam_focus_y_from, cam_focus_y, cam_focus_timeup/cam_focus_timeup_max);
camera_set_view_pos(view_camera[0], CAM_X, _new_y);