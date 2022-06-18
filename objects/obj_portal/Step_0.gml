image_index += 0.25;
    var idd = portalid;
    var pidd = partner;
    var cdtimer = cooldownTimer;
    

if place_meeting(x, y, obj_player) && cooldownTimer == -1{

    cooldownTimer = 1;
    with(obj_portal){
        if portalid == pidd{
            cooldownTimer = 1;
            obj_player.x = x;
            obj_player.y = y;
        }
    }
}


image_angle += 15;


if cooldownTimer == cooldown {
    cooldownTimer = -1;   
}

if cooldownTimer > 0 {
    cooldownTimer++;   
}
