function scr_remoteplayer_shoot(){
	with(instance_create_depth(x + 18*sign(image_xscale) + random_range(-2, 2), y - 9 + random_range(-2, 2), depth - 1, obj_water)){
		playerindex = other.playerindex;
		xvel = sign(other.image_xscale) * 1.25;
		if(sign(other.xvel) == sign(xvel)){
			xvel += other.xvel;
		}
		yvel = 1;
		xvel += random_range(-.5, .5);
		image_angle = point_direction(0, 0, xvel, yvel);

	}
	return sign(image_xscale);
}
