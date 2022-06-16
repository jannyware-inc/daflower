function gmcallback_sio_on_room_start_game() {
	log("Room is starting");
	
	if(instance_exists(obj_multiplayer)){
		if(obj_multiplayer.hosted_room_id == noone){
			global.player_index = 1; //Joined
		} else {
			global.player_index = 0; //Host
		}
		room_goto(mp_game);
	}
}
