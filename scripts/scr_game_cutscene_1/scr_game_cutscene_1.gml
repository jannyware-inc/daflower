// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_game_cutscene_1(){
	with(obj_player){
		x = twerp(TwerpType.out_cubic, xstart, global.player_start_pos[0].x, other.intro_cutscene_timeup/other.intro_cutscene_timeup_max);
		y = twerp(TwerpType.out_cubic, ystart, global.player_start_pos[0].y, other.intro_cutscene_timeup/other.intro_cutscene_timeup_max);
	}
	
	if(intro_cutscene_timeup < intro_cutscene_timeup_max - 40){
		obj_player.sprite_index = spr_jump;
		obj_player.image_index = 2;
		obj_player.shadow_sprite = spr_jump_shadow;
	} else {
		obj_player.sprite_index = spr_jump;
		obj_player.image_index = 0;
		obj_player.shadow_sprite = spr_jump_shadow;
	}
	
	if(intro_cutscene_timeup >= intro_cutscene_timeup_max){
		global.game_cutscene = 0;
		global.bgm_id = audio_play_sound(global.bgm, 100, true);
		return;
	}
	intro_cutscene_timeup++;
	
}

function scr_game_cutscene_1_draw(){
	var _alpha = 1 - intro_cutscene_timeup/(intro_cutscene_timeup_max/3);
	draw_set_alpha(min(1, ceil(_alpha*25)/25));
	draw_rectangle_color(CAM_X, CAM_Y, CAM_X + CAM_W, CAM_Y + CAM_H, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	if(intro_cutscene_timeup%6<2){
		draw_set_color(c_black);
	} else if (intro_cutscene_timeup%6<4){
		draw_set_color(c_red);
	} else {
		draw_set_color(c_aqua);
	}
	
	
	switch(floor((intro_cutscene_timeup/intro_cutscene_timeup_max)*3)){
		case 0:
			draw_text(CAM_W/2, CAM_Y + CAM_H/2-20, "HOW HIGH");
			break;
		case 1:
		draw_text(CAM_W/2, CAM_Y + CAM_H/2-20, "WILL YOUR");
			break;
		case 2:
			draw_text(CAM_W/2, CAM_Y + CAM_H/2-20, "FLOWER GROW?");
			break;
	}
	draw_set_halign(fa_left);
	draw_set_color(c_white);
}