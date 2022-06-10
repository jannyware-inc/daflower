z = 0;

xvel = 0;
yvel = 0;

xvel_max = 1.4;
yvel_max = 2.65;

walk_xaccel = .35;
walk_xdeaccel = .15;

air_xaccel = .25;
air_xdeaccel = .15;

grav = .175;
jump_yvel = -4;

grounded = false;
grounded_slope_id = noone;

can_cancel_jump = false;
double_jumped = false;

was_shooting = false;

cx = 0;
cy = 0;

last_hit_direction = 0;
hit_strength = 1;

invincibility_timer_max = 120;
invincibility_timer = 0

last_grounded = false;

/* Controller inputs */
ctrl_left_check = 0;
ctrl_right_check = 0;

ctrl_jump_check = 0;
ctrl_jump_press = 0;

ctrl_up_check = 0;
ctrl_down_check = 0;

ctrl_xaxis_check = 0;
ctrl_yaxis_check = 0;

max_pee = 100;
pee = max_pee;

xcollided = 0;
ycollided = 0;

enum player_states {
	normal,
    level_transition,
	dead,
}

fixes = {
	can_move: true,
	can_gravity: true,
	can_jump: true,
	can_shoot: true,
	can_semifloor: true,
	invulnerable: false,
	can_deaccelerate: true,
	can_physics: true,
}

state = player_states.normal;
/* Temporary variables that can reused by multiple states */
state_timeup = 0;
state_var_0 = 0;
state_var_1 = 0;
state_var_2 = 0;


hp = 100;
maxhp = 100;
hpprevious = hp;
iframes = 30;
iframeCount = 0;
invulnerable = false;

cooldown = 10;
cooldownTimer = -1;
punchout = false;
hitboxid = noone;

damage_decals = 0;