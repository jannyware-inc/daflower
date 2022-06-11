grounded = (yvel >= 0 && place_meeting(x, y + 1, obj_wall));
if(!grounded){
	var _semifloor = noone;
	/* Find the semifloor that is closest under the player */
	var _list = ds_list_create();
	var _num = instance_place_list(x, y + 1, obj_semifloor, _list, false);
	if (_num > 0)
	{
	    for (var i = 0; i < _num; ++i)
	    {
			if(_semifloor == noone){
				_semifloor = _list[| i];
			} else if (_list[| i].bbox_top >= y && _list[| i].bbox_top > _semifloor.bbox_top){
				_semifloor = _list[| i];
			}
	    }
	}
	ds_list_destroy(_list); 
	grounded = (yvel >= 0 && _semifloor != noone && _semifloor.bbox_top >= y);
}

/* Slope grounded check */
grounded_slope_id = noone;
var _slope = collision_line(x, y+7, x, y-1, obj_slope, false, false);
if(_slope != noone && yvel >= 0){
	var percentX;
	if(_slope.image_xscale >= 0) {
		percentX = clamp((x + vxNew - _slope.bbox_left)/abs(_slope.image_xscale) * 1/8, 0, 1);
	} else {
		percentX = clamp((_slope.bbox_right - (x + vxNew))/abs(_slope.image_xscale) * 1/8, 0, 1);
	}
	var howFarUp = (_slope.bbox_bottom - _slope.bbox_top) * percentX;
	var proposed_y = _slope.bbox_bottom - howFarUp - 1;
	if(y >= proposed_y || grounded || last_grounded){
		grounded = true;
		grounded_slope_id = _slope;
	}
}

if(xcollided != 0) image_xscale = -image_xscale;
xvel = movespd * image_xscale;


yvel = min(yvel + grav, yvel_max);

xcollided = false;
ycollided = false;

/* Handle sub-pixel movement */
cx += xvel;
cy += yvel;
vxNew = round(cx);
vyNew = round(cy);
cx -= vxNew;
cy -= vyNew;

if(grounded_slope_id == noone){
	var _slope = collision_line(x + vxNew, y, x+vxNew, y+7, obj_slope, false, false);
	if(_slope == noone)
		_slope = collision_point(x + vxNew, y + vyNew, obj_slope, false, false);
} else {
	_slope = grounded_slope_id;
}
var moved_on_slope = false;
if(_slope != noone){
	var percentX;
	if(_slope.image_xscale >= 0) {
		percentX = clamp((x + vxNew - _slope.bbox_left)/abs(_slope.image_xscale) * 1/8, 0, 1);
	} else {
		percentX = clamp((_slope.bbox_right - (x + vxNew))/abs(_slope.image_xscale) * 1/8, 0, 1);
	}
	var howFarUp = (_slope.bbox_bottom - _slope.bbox_top) * percentX;
	//log("PercentX: " + string(percentX) + " howFarUp: " + string(howFarUp));
	var proposed_y = _slope.bbox_bottom - howFarUp;
	if(y > proposed_y || (grounded_slope_id != noone && yvel >= 0)){
		y = proposed_y;
		if(vyNew < 0) y+= vyNew;
		else yvel = 0;
		vyNew = 0;
		/* Needs collision check here */
		x += vxNew;
		vxNew = 0;
		moved_on_slope = true;
	}
} 
if(!moved_on_slope){
	/* Y axis collision code */
	if(!place_meeting(x, y, obj_wall) && place_meeting(x, y + vyNew, obj_wall))
	{
		ycollided = yvel;
		/*
		var _qblock = instance_place(x, y + vyNew, obj_questionblock);
		if(vyNew < 0 && _qblock != noone)
		{
			if(_qblock.state == qblock_states.not_hit)
				_qblock.state = qblock_states.hit;
		}
		*/
		while(!place_meeting(x, y + sign(vyNew), obj_wall))
		{
			y += sign(vyNew);
		}
		yvel = 0;
		vyNew = 0;
	}
	var _semifloor = noone;
	
	/* Find the semifloor that is closest under the player */
	var _list = ds_list_create();
	var _num = instance_place_list(x, y + vyNew, obj_semifloor, _list, false);
	if (_num > 0)
	{
	    for (var i = 0; i < _num; ++i)
	    {
			if(_semifloor == noone){
				_semifloor = _list[| i];
			} else if (_list[| i].bbox_top >= y && _list[| i].bbox_top > _semifloor.bbox_top){
				_semifloor = _list[| i];
			}
	    }
	}
	ds_list_destroy(_list); 
	
	if(_semifloor != noone && vyNew > 0 && y <= _semifloor.bbox_top){ //If moving down, check that your original height is above the bbox_top
		y = _semifloor.bbox_top;
		yvel = 0;
		vyNew = 0;
	}
	y += vyNew;

	/* X axis collision code */
	if(!place_meeting(x, y, obj_wall) && place_meeting(x + vxNew, y, obj_wall))
	{
		xcollided = xvel;
		while(!place_meeting(x + sign(vxNew), y, obj_wall))
		{
			x += sign(vxNew);
		}
		xvel = 0;
		vxNew = 0;
	}
	if(vxNew == 0 && place_meeting(x+sign(xvel), y, obj_wall)){
		xvel = 0;
	}
	x += vxNew;
}

last_grounded = grounded;

if(y > camera_get_view_y(view_camera[0]) + 256){
	y = camera_get_view_y(view_camera[0]) - 8;
	x = random_range(20, 236);
}