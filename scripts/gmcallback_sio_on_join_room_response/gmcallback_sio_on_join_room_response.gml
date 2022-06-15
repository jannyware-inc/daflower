function gmcallback_sio_on_join_room_response() {
	var data = json_decode(argument[0]);
	
	//log("Create room response: " + string(data[? "new_room_id"]));
	if(instance_exists(obj_multiplayer) && ds_map_exists(data, "response_code")){
		if(data[? "response_code"] == 0){
			with(obj_multiplayer){
				hosted_room_id = noone;
				log("Joining room returns success");
			}
		} else {
			log("Joined room response returned: " + string(data[? "response_code"]));
		}
	}
	ds_map_destroy(data);
}
