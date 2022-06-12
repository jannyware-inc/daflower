if (!can_follow_player) return;
with(other){
    water = min(water + 50, max_water);   
}
instance_destroy();