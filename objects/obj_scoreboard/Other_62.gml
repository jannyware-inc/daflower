var json = async_load[? "result"];

var resultMap = json_decode(json);
if(resultMap == -1){
	exit;
}
if(ds_map_exists(resultMap, "default")){
	scores = array_create(10, noone);
	var list = ds_map_find_value(resultMap, "default");
	
	if(is_numeric(list) && ds_exists(list, ds_type_list)){
		var size = ds_list_size(list);
		for (var n = 0; n < ds_list_size(list); n++;)
		{
			var map = ds_list_find_value(list, n);
			scores[n] = {
				name: string(map[? "name"]),
				time: string(map[? "time"])
			}
		}
	}
}
ds_map_destroy(resultMap);