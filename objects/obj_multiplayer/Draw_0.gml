if(hosted_room_id != noone){
	draw_text(x + 30, y + 10, "Your room code: " + string(hosted_room_id));
} else {
	draw_text(x + 30, y + 10, "You are not hosting a room");
}