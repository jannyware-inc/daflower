function gmcallback_sio_on_create_room_response() {
	var data = json_decode(argument[0]);
	
	//log("Create room response: " + string(data[? "new_room_id"]));
	if(instance_exists(obj_multiplayer) && ds_map_exists(data, "new_room_id")){
		with(obj_multiplayer){
			hosted_room_id = string(data[? "new_room_id"]);
		}
	}
	ds_map_destroy(data);
}
