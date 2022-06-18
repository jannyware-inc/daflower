//0 = host, 1 = joined
global.player_index = 0;

global.final_time = 0;
global.volume = 35;

global.player_shadow_map = ds_map_create();

global.player_shadow_map[? 	spr_hurt] = spr_hurt_shadow;
global.player_shadow_map[? 	spr_looking_away] = spr_looking_away_shadow;
global.player_shadow_map[? 	spr_jump] = spr_jump_shadow;
global.player_shadow_map[? 	spr_jump_up] = spr_jump_shadow;
global.player_shadow_map[? 	spr_walk] = spr_walk_shadow;
global.player_shadow_map[? 	spr_watering] = spr_watering_shadow;
global.player_shadow_map[? 	spr_walk]  = spr_walk_shadow;
global.player_shadow_map[? 	spr_standing]  = spr_standing_shadow;

global.debug = 1;