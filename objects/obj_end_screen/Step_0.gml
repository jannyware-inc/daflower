if(mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, obj_button_lb_back, false, false)){
	global.final_time = 0;
	global.game_cutscene = 0;
	global.draw_darkness = 0;
	room_goto(RoomMainMenu);
}

if(mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, obj_button_submit, false, false) && !submitted != 0){
	submitted = true;
	username = get_string("Enter your name (15 char max)", "Cool grower");

	var str = "name=" + string(username) + "&time=" + string(final_time);
	post_id = http_post_string("https://jannycorp.net:5005/sunflower/savescores", str);
}