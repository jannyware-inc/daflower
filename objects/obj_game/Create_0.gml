global.paused = false;

global.level = 0;

global.level_objects = 0;
global.screen_shake_frames = 0;
global.screen_shake_intensity = 0;

global.starting_y = 4000;
global.level_height = 224;
last_room = room;
last_level = global.level;

level_objects_done = false;
loaded_first_level = false;

global.player_start_pos = array_create(10, noone);
global.cam_y_level = array_create(10, noone);

transition_time = 200;
transition_timeup = 0;

global.level_index = ceil(global.level);
global.last_level_index = global.level_index;

global.bgm_table = [
	mus_level_2,
	mus_level_2,
	mus_level_1,
	mus_level_1,
	mus_level_3,
	mus_level_3,
	mus_level_4,
	mus_level_4,
	mus_level_4,
	mus_level_4,
];
global.bgm = global.bgm_table[0];
global.bgm_id = noone;

audio_group_set_gain(audiogroup_default, 0.35, 0);

///Create Scribble
//scribble_font_set_default("fnt)
typist = scribble_typist();
typist.in(1, 0);