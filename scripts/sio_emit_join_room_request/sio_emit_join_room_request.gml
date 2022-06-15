function sio_emit_join_room_request(room_string) {
	var eventName = "join_room_request";

#region packet	
		var json = {
			join_room_id: room_string,
		}
		sio_emit(eventName, json_stringify(json));
#endregion


}
