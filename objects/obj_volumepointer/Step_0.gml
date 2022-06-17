if count > 12 {
    global.volume += dir*2;   
}

if global.volume > 100{
 global.volume = 100;   
}

if global.volume < 0 {
    global.volume = 0;   
}
audio_group_set_gain(audiogroup_default, global.volume*0.01, 0);