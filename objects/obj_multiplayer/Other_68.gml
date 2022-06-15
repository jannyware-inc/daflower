var etype = async_load[? "type"];
log("New network event event type: " + string(etype));
if(etype == network_type_non_blocking_connect){
	log("you connected");
	var succeeded = async_load[? "succeeded"];
	global.connected = true;
	log("Succ: " + string(succeeded));
} else if (etype == network_type_disconnect){
	log("you disconnected");
	global.connected = false;
} else if(etype == network_type_data){
	log("received data");
}
