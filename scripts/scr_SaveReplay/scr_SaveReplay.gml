function scr_SaveGhost() {
	var _dir = working_directory + "/ghosts" + string(global.speedStageData[global.SpeedSelected].folder_Name);
	
	if ds_exists(ghostRecordList, ds_type_list) {
		//Save Main Ghost
		var _wrapper = ds_map_create();
		
		ds_map_add_list(_wrapper, "root", ghostRecordList);
							
		var _theLot = json_encode(_wrapper);
		var _recordName = _dir + string(global.speedStageData[global.SpeedSelected].record_File) + ".sav";
							
		if file_exists(_recordName) {
			file_delete(_recordName);
		}
							
		var _recordFile = file_text_open_write(_recordName);
							
		file_text_write_string(_recordFile, _theLot);
		file_text_close(_recordFile);
		ds_map_destroy(_wrapper);
			
		//Save Extra Shit
		if lastSavedFrame != 0 {
			var _filename = _dir + string(global.speedStageData[global.SpeedSelected].record_File) + "_extraFrameCheck" + ".sav";
			var _json = json_stringify(lastSavedFrame);
			var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	
			buffer_write(_buffer, buffer_string, _json);
			buffer_save(_buffer, _filename);
			buffer_delete(_buffer);
		}
	}
}

function scr_LoadGhost() {
	//Loading our save data
	var _dir = working_directory + "/ghosts" + string(global.speedStageData[global.SpeedSelected].folder_Name);
	var _filename = _dir + string(global.speedStageData[global.SpeedSelected].record_File) + "_extraFrameCheck" + ".sav";

	if !file_exists(_filename) {
		return 0;
	} else {
		//Load the buffer, get the JSON, delete the buffer from memory
		var _buffer = buffer_load(_filename);
		var _json = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		
		//Unstringify and get the data array
		var _loadDeezNuts = json_parse(_json);
	
		return _loadDeezNuts;
	}
}