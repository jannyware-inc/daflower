function sio_emit_create_room_request() {
	var eventName = "create_room_request";

#region packet	
		sio_emit(eventName, "");
#endregion
}
