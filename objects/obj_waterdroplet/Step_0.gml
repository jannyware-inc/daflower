

var nearest = instance_nearest(x, y, obj_wall);
var nearestslope = instance_nearest(x, y, obj_slope);

if distance_to_object(obj_player) < 20{
    if active{
        direction = point_direction(x,y,obj_player.x,obj_player.y);
        speed += 0.1;
    }
}
else{
    speed -= 0.4;   
}
if speed < 0{
    speed = 0;   
}

if place_meeting(x+lengthdir_x(speed,direction), y+lengthdir_y(speed,direction), obj_wall){
    speed = 0;
}
if place_meeting(x+lengthdir_x(speed,direction), y+lengthdir_y(speed,direction), obj_slope){
    speed = 0;
}

if count % 10 == 0{
    token*=-1;
    y += token;   
    image_index += 1;
}


if count > 300{
    instance_destroy();   
}

count ++;


