event_inherited();
grounded = false;
grounded_ramp_id = false;

movespd = .5;
grav = .14;
yvel_max = 2;

state = enemy_states.alive;
state_timeup = 0;

enum cricket_states {
	idle,
	jumping,
}

substate = cricket_states.idle;
substate_timeup = 0;

dead = false;

hp = 100;
maxhp = 100;