enum screens{
    main_menu,
    options,
    multiplayer,
    leaderboards
}

screen = screens.main_menu;

positions = ds_map_create();

token = 0;

volume = 75;

audio_play_sound(mus_mainmenu, 0, 1);