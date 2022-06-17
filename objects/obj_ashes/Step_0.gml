yvel = min(yvel + grav, yvel_max);

x += xvel;
y += yvel;

if(y > CAM_Y + CAM_H + 20){
	instance_destroy();
}

if(random(1) < .02){
	with(instance_create_depth(x, y, depth, obj_smoke)){
		xvel = random_range(-1.5, 1.5);
		yvel = 0;
	}
}