event_inherited();
grounded = false;
grounded_ramp_id = false;

movespd = .5;
grav = .1;
yvel_max = .3;

enum enemy_states {
	alive,
	dead,
	respawn,
}
state = enemy_states.alive;
state_timeup = 0;

dead = false;

hp = 100;
maxhp = 100;