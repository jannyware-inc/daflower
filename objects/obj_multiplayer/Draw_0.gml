if(room == mp_lobby){
	draw_set_font(fnt_prstart);
	if(hosted_room_id != noone){
		draw_text(x + 30, y + 10, "Your room code: " + string(hosted_room_id));
	} else {
		draw_text(x + 30, y + 10, "You are not hosting a room");
	}
	draw_text(x + 30, y + 120, "Your player id: " + string(player_id));
}

