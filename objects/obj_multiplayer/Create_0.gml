var any_other_obj = false;
with(obj_multiplayer){
	if(id != other.id){
		any_other_obj = true;
	}
}
if(any_other_obj) {
	instance_destroy(id);
	return;
}
log("MP object loaded!");
global.connected = false;
ping_timeup = 0;
ping_timeup_max = 60*6; //Attempt to connect every 6 seconds

last_connected = false;

hosted_room_id = noone;