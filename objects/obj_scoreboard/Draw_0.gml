draw_set_font(fnt_prstart);
draw_set_halign(fa_center);
draw_text(CAM_W/2, 10, "TOP SCORES:");
draw_set_halign(fa_left);
for(var i = 0; i < 10; i++){
	if(scores[i] != noone){
		var time = scores[i].time;
		var milliseconds = floor(time/60*1000)%1000;
		var seconds = floor(time/60)%60;
		var minutes = floor(time/60/60);
		var time_string = string_repeat("0", 2-string_length(string(minutes))) + string(minutes) + ":" 
		+ string_repeat("0", 2-string_length(string(seconds))) + string(seconds) + "." 
		+ string_repeat("0", 3-string_length(string(milliseconds))) + string(milliseconds);
		
		draw_text(20, 30 + 10*i, string(i+1) + ". " + string(scores[i].name));
		draw_set_halign(fa_right);
		draw_text(CAM_W-20, 30+10*i, string(time_string));
		draw_set_halign(fa_left);
	}
}