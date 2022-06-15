if(global.connected){
	if(!last_connected){
		//sio_emit_create_player();
	}
	if(ping_timeup%ping_timeup_max == 0){
		log("Ping!");
		sio_emit("ping", "");
	}
	ping_timeup++;
}
last_connected = global.connected;

if(mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, obj_button_host_room, false, false)){
	log("clicked request");
	sio_emit_create_room_request();
}

if(mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, obj_button_join_room, false, false)){
	var room_string = get_string("Enter your friend's room code:", "");
	sio_emit_join_room_request(room_string);
}