ctrl_left_check = keyboard_check(ord("A"));
ctrl_right_check = keyboard_check(ord("D"));

ctrl_up_check = keyboard_check(ord("W"));
ctrl_down_check = keyboard_check(ord("S"));

ctrl_jump_check = keyboard_check(vk_space);
ctrl_jump_press = keyboard_check_pressed(vk_space);

ctrl_action_check = keyboard_check(vk_shift);

ctrl_xaxis_check = ctrl_right_check - ctrl_left_check;
ctrl_yaxis_check = ctrl_down_check - ctrl_up_check;


//

if keyboard_check_pressed(ord("S")) {
    token += 1;   
}

if keyboard_check_pressed(ord("W")) {
    token -= 1;   
}


switch(screen){
    case screens.main_menu:
    token = clamp(token, 0, 3)
    if ctrl_jump_press{
        switch(token){
            case 0:
            audio_stop_sound(mus_mainmenu);
            room_goto(IntroRoom);
                break;
                
            case 1:
            screen = screens.multiplayer;
            
                break;
                
            case 2: 
            screen = screens.options;
            token = 0;
                break;
                
            case 3: 
            screen = screens.leaderboards;
                break;
        }
    }
    
    
        break;
        
    case screens.options:
        token = clamp(token, 0, 1);
        if ctrl_jump_press{
            switch(token){
                case 0 : 
                
                    break;
                    
                case 1:
                screen = screens.main_menu;
                token = 0;
                    break;
            }
        }
        
        if token == 0 {
            if ctrl_left_check{
             volume -= 1;   
            }
            if ctrl_right_check{
             volume += 1;
            }
        }
        break;
        
        
    case screens.multiplayer:
    
        break;
        
    case screens.leaderboards:
    
        break;
}

volume = clamp(volume, 0, 100);