global.paused = false;

global.level = 0;

global.level_objects = 0;

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

global.bgm = mus_level_1;
global.bgm_id = noone;