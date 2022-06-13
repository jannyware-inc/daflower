if !dead{
    if position_meeting(x, y - 13, obj_player){
        if y - obj_player.y < 0{
        hp -= 100;
        other.yvel -= 4;
        }
    }
}