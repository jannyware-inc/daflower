if active{
audio_play_sound(snd_collectwater, 0 , false);
with(other){
    
    water += 30;   
}
instance_destroy();
}