// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_drop_water(){
     
    var number = irandom_range(2,4);
    var idd = id;
    while number > 0 {
        var dir = irandom_range(-180,180);
        var droplet = instance_create_layer(x,y,"Instances", obj_waterdroplet);
        var spd = random_range(2, 2.5);
        with (droplet){
            direction = dir;
            speed = spd;
            parentid = idd;
        }
    }
}