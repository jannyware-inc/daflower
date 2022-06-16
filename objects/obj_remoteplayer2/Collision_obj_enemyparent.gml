if yvel > 0 && !grounded{
    if position_meeting(x,y+1,other){
        with(other){
            if !dead{
            hp -= 100;   
            other.yvel += other.jump_yvel;
            audio_play_sound(enemykill, 0, false);
            }
        }
    }
    
    
}