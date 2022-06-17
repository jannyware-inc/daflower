if dir{
    if global.volume < 100 {
        global.volume +=4;   
    }
}

else{
    if global.volume > 0 {
        global.volume -=4;   
    }
}
//global.volume = clamp(global.volume, 0, 100);
 


//
//audio_group_set_gain(audiogroup_default, global.volume*0.01, 0);