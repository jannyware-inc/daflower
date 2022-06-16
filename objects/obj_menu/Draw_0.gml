var fnt, halign, valign, col;

fnt = draw_get_font();
halign = draw_get_font();
valign = draw_get_font();
col = draw_get_color();

draw_set_halign(fa_center);
draw_set_valign(fa_center);
//

switch(screen){
    
    case screens.main_menu:
        draw_text_transformed(128, 52, "Solo", 0.5, 0.5, 0);

        draw_text_transformed(128, 82, "Multiplayer", 0.5, 0.5, 0);

        draw_text_transformed(128, 112, "Options", 0.5, 0.5, 0);

        draw_text_transformed(128, 142, "Leaderboards", 0.5 , 0.5, 0);
        
        if token == 0{
        draw_sprite_ext(spr_marker, 0, 100, (52 + (token)*30), 0.25, 0.25, 0, c_white, 1);
        
        
        }
        if token == 1{
        draw_sprite_ext(spr_marker, 0, 90, (52 + (token)*30), 0.25, 0.25, 0, c_white, 1);   
        
        
        }
        if token == 2{
        draw_sprite_ext(spr_marker, 0, 98, (52 + (token)*30), 0.25, 0.25, 0, c_white, 1);    
        }
        
        if token == 3{
        draw_sprite_ext(spr_marker, 0, 88, (52 + (token)*30), 0.25, 0.25, 0, c_white, 1);    
        }
     
    
        break;
    
    case screens.options:

        draw_text_transformed(128, 82, "Total volume", 0.5, 0.5, 0);
       
        draw_rectangle_color(88, 92, 88+ 80*(global.volume/100), 102, c_blue, c_fuchsia, c_navy, c_aqua, false);
        
        draw_text_transformed(128, 160, "Back", 0.5, 0.5, 0);
        
        switch(token){
            case 0:
            draw_sprite_ext(spr_marker, 0, 88, (82), 0.25, 0.25, 0, c_white, 1);
                break;
                
            case 1:
            draw_sprite_ext(spr_marker, 0, 88, (160), 0.25, 0.25, 0, c_white, 1);
                break;
        }
        
        break;
    
    case screens.multiplayer:
    
    
        break;
}







draw_set_font(fnt);
draw_set_halign(halign);
draw_set_valign(valign);
draw_set_color(col);