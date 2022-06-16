if(room == RoomEndScreen){
	var time = global.final_time;
	var milliseconds = floor(time/60*1000)%1000;
	var seconds = floor(time/60)%60;
	var minutes = floor(time/60/60);

	draw_set_halign(fa_center);
	draw_set_font(fnt_prstart);
	draw_text(256/2, 180, "Your time: ");
	draw_text(256/2, 190, string_repeat("0", 2-string_length(string(minutes))) + string(minutes) + ":" 
				+ string_repeat("0", 2-string_length(string(seconds))) + string(seconds) + "."
				+ string_repeat("0", 3-string_length(string(milliseconds))) + string(milliseconds));
	draw_set_halign(fa_left);
}

