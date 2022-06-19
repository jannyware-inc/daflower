if (!can_follow_player) return;
with(other){
    water = min(water + 35, max_water);
    watertime = 185;
}
play_sfx(snd_collectwater);
instance_destroy();