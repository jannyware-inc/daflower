if(y > CAM_Y + CAM_H/2){
	sprite_index = spr_lv6_ufo1;
} else {
	sprite_index = spr_lv6_ufo2;
}

var _xvel = lengthdir_x(speed,direction);
image_xscale = sign(_xvel);
if(_xvel > 0 && x > 300){
	instance_destroy();
}

if(_xvel < 0 && x < -50){
	instance_destroy();
}