if(lifetime > 0){
	lifetime--;
} else if(lifetime == 0){
	instance_destroy();
}
if(lifetime < 0){
	if(y + 20 < CAM_Y){
		instance_destroy();
	}
}