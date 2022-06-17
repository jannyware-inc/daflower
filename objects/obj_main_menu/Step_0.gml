if(mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, obj_button_time_attack, false, false)){
	room_goto(Room4);
    audio_stop_sound(mus_mainmenu);
}
if(mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, obj_button_score_attack, false, false)){
	room_goto(mp_lobby);
}