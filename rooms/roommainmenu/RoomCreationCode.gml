global.volume = 0.35;
audio_group_set_gain(audiogroup_default, global.volume*0.01, 0);
audio_play_sound(mus_mainmenu, 0, true);