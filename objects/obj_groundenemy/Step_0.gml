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
