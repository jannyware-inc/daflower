event_inherited();
grounded = false;
grounded_ramp_id = false;

movespd = 2;
grav = .16;
yvel_max = 3;

state = enemy_states.alive;
state_timeup = 0;

enum turtle_states {
	normal,
	walled,
}
substate = turtle_states.normal;
substate_timeup = 0;

dead = false;

hp = 100;
maxhp = 100;