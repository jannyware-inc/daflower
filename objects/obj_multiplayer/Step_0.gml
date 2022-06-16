if(room == mp_lobby){
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
} else if(room == mp_game){
	if(instance_exists(obj_player)){
		if(send_pos_timeup == 0){
			sio_emit_position_update();
		}
		if(send_pos_timeup >= send_pos_timeup_max){
			send_pos_timeup = 0;
		} else {
			send_pos_timeup++;
		}
	}
	
	if(global.player_index == 0){
		if(instance_exists(obj_flower)){
			if(send_flower_timeup == 0){
				sio_emit_position_update();
			}
			if(send_flower_timeup >= send_flower_timeup_max){
				send_flower_timeup = 0;
			} else {
				send_flower_timeup++;
			}
		}
	}
}