if(!instance_exists(obj_player)) instance_destroy(id);
playerindex = !global.player_index;

max_water = obj_player.max_water;
water = 0;
watering = 0;

interp_frame = 0;
interp_frame_max = obj_multiplayer.send_pos_timeup_max;
from_x = 0;
from_y = 0;
to_x = 0;
to_y = 0;

last_x = 0;
last_y = 0;

grounded = false;

shadow_sprite = noone;