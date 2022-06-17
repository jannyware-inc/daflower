/// sio_init()
/*
function sio_init() {
	gml_pragma("global", "sio_init()");

#region macros
	#macro URL "http://localhost:3000"
#endregion

#region SocketIO
		sio_connect_by_url(URL);
#endregion

#region SocketIO:Events
		sio_addEvent("create_player");
		sio_addEvent("create_player_other");
		sio_addEvent("destroy_player");
		sio_addEvent("position_update");
		sio_addEvent("pong");
		sio_addEvent("create_room_response");
		sio_addEvent("join_room_response");
		sio_addEvent("room_start_game");
#endregion


}
