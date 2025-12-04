if ghostRecord && instance_exists(obj_Player) {
	if !ds_exists(ghostRecordList, ds_type_list) {
		ghostRecordFrames = 1;
		ghostRecordList = ds_list_create;
	}
	
	var _frametoRecord = ds_map_create();
	
	with(obj_Player) {
		_frametoRecord[? "x"] = x;
		_frametoRecord[? "y"] = y;
		_frametoRecord[? "xscale"] = image_xscale;
		_frametoRecord[? "yscale"] = image_yscale;
		_frametoRecord[? "sprite"] = sprite_index;
		_frametoRecord[? "image"] = image_index;
	}
	
	ds_list_add(ghostRecordList, _frametoRecord);
	ds_list_mark_as_map(ghostRecordList, ds_list_size(ghostRecordList) - 1);
	ghostRecordFrames++;
}