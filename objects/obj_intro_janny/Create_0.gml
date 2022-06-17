slidesarray = [
{
	sprite: spr_introcard_1,
	blank_frames: INTRO_STATE_BLANK_TIMEUP_MAX*1.5,
	fade_in_frames: INTRO_STATE_FADE_IN_TIMEUP_MAX,
	display_frames: INTRO_STATE_DISPLAY_TIMEUP_MAX,
	fade_out_frames: INTRO_STATE_FADE_OUT_TIMEUP_MAX,
},
{
	sprite: spr_introcard_2,
	blank_frames: INTRO_STATE_BLANK_TIMEUP_MAX,
	fade_in_frames: INTRO_STATE_FADE_IN_TIMEUP_MAX,
	display_frames: INTRO_STATE_DISPLAY_TIMEUP_MAX,
	fade_out_frames: INTRO_STATE_FADE_OUT_TIMEUP_MAX,
},
{
	sprite: spr_introcard_3,
	blank_frames: INTRO_STATE_BLANK_TIMEUP_MAX,
	fade_in_frames: INTRO_STATE_FADE_IN_TIMEUP_MAX,
	display_frames: INTRO_STATE_DISPLAY_TIMEUP_MAX,
	fade_out_frames: INTRO_STATE_FADE_OUT_TIMEUP_MAX,
},
{
	sprite: spr_introcard_4,
	blank_frames: INTRO_STATE_BLANK_TIMEUP_MAX,
	fade_in_frames: INTRO_STATE_FADE_IN_TIMEUP_MAX,
	display_frames: INTRO_STATE_DISPLAY_TIMEUP_MAX,
	fade_out_frames: INTRO_STATE_FADE_OUT_TIMEUP_MAX,
},
{
	sprite: spr_introcard_5,
	blank_frames: INTRO_STATE_BLANK_TIMEUP_MAX,
	fade_in_frames: INTRO_STATE_FADE_IN_TIMEUP_MAX,
	display_frames: INTRO_STATE_DISPLAY_TIMEUP_MAX,
	fade_out_frames: INTRO_STATE_FADE_OUT_TIMEUP_MAX,
},
{
	sprite: spr_introcard_6,
	blank_frames: INTRO_STATE_BLANK_TIMEUP_MAX,
	fade_in_frames: INTRO_STATE_FADE_IN_TIMEUP_MAX,
	display_frames: 120,
	fade_out_frames: 15,
},
{
	sprite: spr_introcard_7,
	blank_frames: 0,
	fade_in_frames: 15,
	display_frames: 60,
	fade_out_frames: 15,
},
{
	sprite: spr_introcard_8,
	blank_frames: 0,
	fade_in_frames: 15,
	display_frames: INTRO_STATE_DISPLAY_TIMEUP_MAX,
	fade_out_frames: INTRO_STATE_FADE_OUT_TIMEUP_MAX,
},
{
	sprite: spr_introcard_9,
	blank_frames: INTRO_STATE_BLANK_TIMEUP_MAX,
	fade_in_frames: INTRO_STATE_FADE_IN_TIMEUP_MAX,
	display_frames: INTRO_STATE_DISPLAY_TIMEUP_MAX*1.5,
	fade_out_frames: INTRO_STATE_FADE_OUT_TIMEUP_MAX*3,
},
{
	sprite: noone,
	blank_frames: 60,
	fade_in_frames: 0,
	display_frames: 0,
	fade_out_frames: 0,
}];
	
enum card_states {
	blank,
	fade_in,
	display,
	fade_out,
}

card_index = 0;
state = card_states.blank;
state_timeup = 0;
#macro INTRO_STATE_BLANK_TIMEUP_MAX 30
#macro INTRO_STATE_FADE_IN_TIMEUP_MAX 30
#macro INTRO_STATE_DISPLAY_TIMEUP_MAX 120
#macro INTRO_STATE_FADE_OUT_TIMEUP_MAX 30

tooltip_alpha = 1.5;
tooltop_min_alpha = .05;
tooltip_fade = .01;

alarm[0] = 23;

goto_room = RoomMainMenu;