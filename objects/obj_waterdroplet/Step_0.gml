if (can_follow_player && distance_to_point(obj_player.x, obj_player.y - 8) < 20){
	following_player_id = obj_player;
} else {
	if(following_player_id == noone) {
		speed = max(0, speed - 0.4);
		count ++;
	}
}

if(following_player_id != noone){
	direction = point_direction(x,y,obj_player.x,obj_player.y);
    speed += 0.1;
}

if(speed == 0){
	can_follow_player = true;
}

if count % 10 == 0{
    token*=-1;
    y += token;   
    //image_index += 1;
}

if count > 300{
    instance_destroy();   
}




