// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_game_cutscene_1(){
	global.draw_darkness = 0;
	
	if(cutscene_timeup == 0){
		audio_sound_pitch(audio_play_sound(mus_dropjingler, 100, false), 1.1);
	}
	with(obj_player){
		x = twerp(TwerpType.out_cubic, xstart, global.player_start_pos[0].x, other.cutscene_timeup/other.intro_cutscene_timeup_max);
		y = twerp(TwerpType.out_cubic, ystart, global.player_start_pos[0].y, other.cutscene_timeup/other.intro_cutscene_timeup_max);
	}
	
	if(cutscene_timeup < intro_cutscene_timeup_max - 40){
		obj_player.sprite_index = spr_jump;
		obj_player.image_index = 2;
		obj_player.shadow_sprite = spr_jump_shadow;
	} else {
		obj_player.sprite_index = spr_jump;
		obj_player.image_index = 0;
		obj_player.shadow_sprite = spr_jump_shadow;
	}
	
	if(cutscene_timeup >= intro_cutscene_timeup_max){
		global.game_cutscene = 0;
		global.bgm_id = audio_play_sound(global.bgm, 100, true);
		cutscene_timeup = 0;
		return;
	}
	cutscene_timeup++;
	
}

function scr_game_cutscene_1_draw(){
	var _alpha = 1 - cutscene_timeup/(intro_cutscene_timeup_max/3);
	draw_set_alpha(min(1, ceil(_alpha*25)/25));
	draw_rectangle_color(CAM_X, CAM_Y, CAM_X + CAM_W, CAM_Y + CAM_H, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	
	if(cutscene_timeup%7<4){
		draw_set_alpha(1);
	} else {
		draw_set_alpha(0);
	}
	draw_set_color(c_orange);
	
	switch(floor((cutscene_timeup/intro_cutscene_timeup_max)*5)){
		case 1:
			draw_text(CAM_W/2, CAM_Y + CAM_H/2-20, "HOW HIGH");
			break;
		case 2:
		draw_text(CAM_W/2, CAM_Y + CAM_H/2-20, "WILL YOUR");
			break;
		case 3:
			draw_text(CAM_W/2, CAM_Y + CAM_H/2-20, "FLOWER GROW?");
			break;
	}
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	draw_set_alpha(1);
}