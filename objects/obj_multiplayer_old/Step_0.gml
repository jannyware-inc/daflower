//Attempt to connect to the master server
if(!global.connected){
	if(connect_timeup%connect_timeup_max == 0){
		log("Connect attempt");
		network_connect_raw_async(client, serverIp, port);
	}
	connect_timeup++;
}

if(global.connected){
	if(ping_timeup%ping_timeup_max == 0){
		log("Sending....");
		var t_buffer = buffer_create(16384, buffer_fixed, 2);
		
		
		var _contents =
		{
		    version : "1.0.0",
		};
		var json_string = json_stringify(_contents);
		
		buffer_seek(t_buffer, buffer_text, json_string);
		network_send_packet(socket, t_buffer, buffer_get_size(buff));
		buffer_delete(buffer);
	}
}