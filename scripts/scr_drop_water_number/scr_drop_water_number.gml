// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_drop_water_number(number){
     
    while(number > 0){
        var dir = irandom_range(0, 360);
        var droplet = instance_create_depth(x,y,depth, obj_waterdroplet);
        var spd = random_range(3, 4);
        with(droplet){
            direction = dir;
            speed = spd;
            parentid = other.id;
        }
        number--;
    }
}