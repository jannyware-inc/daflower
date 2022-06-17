yvel = max(yvel + grav, yvel_max);
xvel *= .98;
x += xvel;
y += yvel;

if(y < CAM_Y - 20){
	instance_destroy();
}