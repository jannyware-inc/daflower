draw_self();

if dir = -1{
    
    //draw_sprite_ext(spr_volumebar, 0, x+5, y, global.volume*0.01, 1, 0, c_white, 1);
    draw_rectangle(x +5, y, (x+5) + ( 38*(global.volume*0.01)), y, false);
}