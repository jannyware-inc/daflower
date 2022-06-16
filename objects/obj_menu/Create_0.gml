enum screens{
    main_menu,
    options,
    multiplayer,
    leaderboards
}

screen = screens.main_menu;

positions = ds_map_create();

token = 0;

global.volume = 35;

audio_group_set_gain(audiogroup_default, global.volume*0.01, 0);
audio_play_sound(mus_mainmenu, 0, 1);