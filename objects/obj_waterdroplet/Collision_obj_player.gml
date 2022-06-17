if (!can_follow_player) return;
with(other){
    water = min(water + 30, max_water);   
}
play_sfx(snd_collectwater);
instance_destroy();