if count > 12 {
    global.volume += dir*2;   
}

if global.volume > 100{
 global.volume = 100;   
}

if global.volume < 0 {
    global.volume = 0;   
}

if(collision_point(mouse_x, mouse_y, id, false, false) && mouse_check_button(mb_left)){
	count++;
} else {
	count = 0;
}

if(collision_point(mouse_x, mouse_y, id, false, false) && mouse_check_button_pressed(mb_left)){
	if dir{
	    if global.volume < 100 {
	        global.volume = min(100, global.volume + 4);   
	    }
	}

	else{
	    if global.volume > 0 {
	        global.volume = max(0, global.volume - 4);   
	    }
	}
}

audio_group_set_gain(audiogroup_default, global.volume*0.01, 0);