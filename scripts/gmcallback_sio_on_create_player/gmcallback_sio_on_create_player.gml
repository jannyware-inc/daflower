function gmcallback_sio_on_create_player() {
	var data = json_decode(argument[0]);
	log("You are player id: " + string(data[? "id"]));
	if(instance_exists(obj_multiplayer)){
		obj_multiplayer.player_id = data[? "id"];
	}
	log("Got create player back");
}