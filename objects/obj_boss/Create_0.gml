event_inherited();
image_index = 0;
image_speed = 0;


grounded = false;
grounded_ramp_id = false;

movespd = .5;
grav = .1;
yvel_max = .3;

state = enemy_states.alive;
state_timeup = 0;

ismoving = false;
targetx = 0;
targety = 0;

dead = false;

hp = 100;
maxhp = 100;


token = 1;
count1 = 0;
count2 = 0;
tpdelay = 240;
count3 = 0;

firedcount = 0;

aggro = true;