yvel += grav;

y += yvel;
x += xvel;

image_angle = point_direction(0, 0, xvel, yvel);

if(place_meeting(x, y, obj_flowertop)){

    if !audio_is_playing(snd_growing1){
        audio_play_sound(snd_growing1, 0, false);   
    }
	obj_flower.height += .55;
	instance_destroy();
}

if(y > camera_get_view_y(view_camera[0]) + 256){
	instance_destroy();
}