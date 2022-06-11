if distance_to_object(obj_player) < 20{
    direction = point_direction(x,y,obj_player.x,obj_player.y);
    speed += 0.1;
}
else{
    speed -= 0.4;   
}
if speed < 0{
    speed = 0;   
}

if count % 10 == 0{
    token*=-1;
    y += token;   
}


if count > 300{
    instance_destroy();   
}

count ++;


