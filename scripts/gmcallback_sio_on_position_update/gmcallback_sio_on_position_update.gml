function gmcallback_sio_on_position_update() {
	var data = json_decode(argument[0]);
	//log("we got : " + string(argument[0]));
	with(obj_multiplayer){
		if(player_id != data[? "id"]){
			if(instance_exists(obj_player)){
				if(!instance_exists(obj_remoteplayer)){
					instance_create_depth(0, 0, obj_player.depth, obj_remoteplayer);
				}
				with(obj_remoteplayer) {
					from_x = last_x;
					from_y = last_y;
					to_x = data[? "x"];
					to_y = data[? "y"];
					image_xscale = data[? "image_xscale"];
					state = data[? "state"];
					water = data[? "water"];
					watering = data[? "watering"];
					interp_frame = 0;
				}
			} else {
				log("update pos there is no player");
			}
		}
	}
	ds_map_destroy(data);
}
