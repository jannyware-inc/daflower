if (!can_follow_player) return;
with(other){
    water = min(water + 50, max_water);   
}
play_sfx(snd_collectwater);
instance_destroy();