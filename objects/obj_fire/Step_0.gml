if(lifetime > 0){
	lifetime--;
} else if(lifetime == 0){
	instance_destroy();
} else if(lifetime < 0){
	if(y + 20 < CAM_Y){
		instance_destroy();
	}
}

if(spits_particles){
	if(random(1) < .003){
		with(instance_create_depth(x, y, depth - 10, obj_ashes)){
			if(random(1) < 1){
				sprite_index = spr_minifire;
			}
			xvel = random_range(-2, 2);
			yvel = random_range(-3, 0);
		}
	}

	if(random(1) < .04){
		with(instance_create_depth(x, y, depth, obj_smoke)){
			xvel = random_range(-1.5, 1.5);
			yvel = 0;
		}
	}
}