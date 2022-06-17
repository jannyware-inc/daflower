/// @description Insert description here
// You can write your code in this editor
event_inherited();
grounded = false;
grounded_ramp_id = false;

movespd = .5;
grav = 0;
yvel_max = .3;

state = enemy_states.alive;
state_timeup = 0;

dead = false;

hp = 100;
maxhp = 100;

count = 0;
charging = false;
gap = 80;
targetx = x;
targety = y;
side = 1;