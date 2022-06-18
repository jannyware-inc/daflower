event_inherited();
grounded = false;
grounded_ramp_id = false;

movespd = 1.5;
grav = 0;
yvel_max = .3;

state = enemy_states.alive;
state_timeup = 0;

enum helijanny_states {
	flying,
	shooting,
}
substate = helijanny_states.flying;
substate_timeup = 0;
substate_var_0 = 0;

dead = false;

hp = 100;
maxhp = 100;

direction = 90 + 90*-sign(image_xscale);
last_direction = direction;
turn_degrees = 2;
turn_sign = 1;
movelen = 2;