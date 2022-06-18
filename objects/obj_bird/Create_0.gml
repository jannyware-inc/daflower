image_index = 0;
token = 1;

turnpoint = 350;
count = 0;
count2 = 0;
stall = false;
starty = y;
startx = x;

event_inherited();
grounded = false;
grounded_ramp_id = false;

movespd = .5;
grav = .1;
yvel_max = .3;

state = enemy_states.alive;
state_timeup = 0;

dead = false;

hp = 100;
maxhp = 100;