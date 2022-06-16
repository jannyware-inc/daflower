function sio_emit_position_update() {
	var eventName = "position_update";

#region packet
		if(!instance_exists(obj_player)) return;
		var data = ds_map_create();
			data[? "x"] = obj_player.x;
			data[? "y"] = obj_player.y;
			data[? "state"] = obj_player.state;
			data[? "image_xscale"] = obj_player.image_xscale;
			data[? "water"] = obj_player.water;
			data[? "watering"] = obj_player.was_shooting;
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}
