function scr_LoadSingleMod(_mod) {
    /*var _modFile = _mod + "/mod_metadata.json";
	var _modIcon = _mod + "/mod_icon.png";

    //Check if the shit exists
    if !file_exists(_modFile) {
        show_debug_message("mod_metadata.json not found in " + _mod);
        return;
    }
	
	if !file_exists(_modIcon) {
		show_debug_message("mod_icon.png not found in " + _mod);
    }

    //Load Bullshit
    var _modName = ini_open(_modFile);
		var _fullModName = ini_read_string("modData", "modName", "Unnamed");
		var _modDesc = ini_read_string("modData", "modDesc", "Put Description Here");
		var _modCredits = ini_read_string("modData", "modCredits", "I Don't Know")
		var _modType = ini_read_string("modData", "modType", "Unknown");
    ini_close();
	
	//Load Mod Icon
    var _modSpr = sprite_add(_modIcon, 0, false, false, 0, 0);

    //Store Mod
    var _modData = {
        modName: _fullModName,
        modDesc: _modDesc,
		modType: _modType,
		modCredits: _modCredits,
		modIconCheck: _modIcon,
		modIcon: _modSpr,
    }
	
    array_push(global.modsLoader, _modData);*/
}

function scr_LoadMods() {
	/*var _modPath = "mods";
	var _modDirectory = file_find_first(_modPath + "/*", fa_directory);

	while (_modDirectory != "") {
	    scr_LoadSingleMod(_modPath + "/" + _modDirectory);
		scr_CharacterModData(_modPath + "/" + _modDirectory);
	    _modDirectory = file_find_next();
	}
	
	file_find_close();*/
}



function scr_CharacterModData(_modChar) {
	/*//Character Select Data
	var _modPath = "mods/";
	var _modDirectory = file_find_first(_modPath + "/*", fa_directory);
	var _charData = _modChar + "/sprites/characterselect/characterselectdata.json";
	
	if !file_exists(_charData) {
		show_debug_message("Character Select Data not found in " + _modChar);
		return;
	}
		
	//Load the buffer, get the JSON, delete the buffer from memory
	var _buffer = buffer_load(_charData);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
		
	//Unstringify and get the data array
	var _loadArray = json_parse(_json);
	
	array_push(global.PlayerSelection, _loadArray);*/
}