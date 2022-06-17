yvel += grav;

y += yvel;
x += xvel;

image_angle = point_direction(0, 0, xvel, yvel);

if(place_meeting(x, y, obj_flowertop)){
	if(global.player_index == 0){
		obj_flower.height += .55;
		//obj_flower.height += 2;
		obj_flower.last_growth = 0;
	}
	instance_destroy();
}

if(y > camera_get_view_y(view_camera[0]) + 256){
	instance_destroy();
}