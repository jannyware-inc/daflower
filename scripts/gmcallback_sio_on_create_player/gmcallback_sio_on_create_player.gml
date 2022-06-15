function gmcallback_sio_on_create_player() {
	var data = json_decode(argument[0]);
	log("Got create player back");
	/*
	with(instance_create_depth(data[? "x"], data[? "y"], 0, oPlayer)) {
		isLocalPlayer = true;
	
		playerId = data[? "id"];
		username = data[? "username"];
	}
	*/


}
