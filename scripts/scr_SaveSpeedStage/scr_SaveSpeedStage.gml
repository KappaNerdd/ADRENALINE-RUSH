///-----Speed Stage Saving-----///

function save_Speed_Stage(_fileNum = 0) {
	if !instance_exists(obj_SavBox) {
		//Ensure that if the rank is worse than what was previously saved, it will not save
		if global.Rank > global.speedStageData[global.SpeedSelected].rank {
			global.speedStageData[global.SpeedSelected].rank = global.Rank; //Keep track of rank
			global.speedStageData[global.SpeedSelected].rankTime = global.RankTime;
			global.speedStageData[global.SpeedSelected].totalTime = (global.minutes * 100) + global.seconds;
			global.speedStageData[global.SpeedSelected].seconds = global.seconds;
			global.speedStageData[global.SpeedSelected].minutes = global.minutes;
			global.speedStageData[global.SpeedSelected].gameScore = global.GameScore;
			global.speedStageData[global.SpeedSelected].rankScore = global.RankScore;
			global.speedStageData[global.SpeedSelected].rings = global.Rings;
			global.speedStageData[global.SpeedSelected].enemies = global.EnemyCount;
			
			global.speedStageData[global.SpeedSelected].player_Char = global.PlayerChar;
			global.speedStageData[global.SpeedSelected].player_Sprite = global.PlayerSelection[global.PlayerChar][17][0];
			global.speedStageData[global.SpeedSelected].player_Costume = global.PlayerCostume;
			global.speedStageData[global.SpeedSelected].player_CharTime = global.PlayerChar;
			global.speedStageData[global.SpeedSelected].player_SpriteTime = global.PlayerSelection[global.PlayerChar][17][0];
			global.speedStageData[global.SpeedSelected].player_CostumeTime = global.PlayerCostume;
			global.speedStageData[global.SpeedSelected].player_CharScore = global.PlayerChar;
			global.speedStageData[global.SpeedSelected].player_SpriteScore = global.PlayerSelection[global.PlayerChar][17][0];
			global.speedStageData[global.SpeedSelected].player_CostumeScore = global.PlayerCostume;
			
			obj_NewRecordN.visible = true;
		} else {
			if global.speedStageData[global.SpeedSelected].gameScore < global.GameScore {
				global.speedStageData[global.SpeedSelected].gameScore = global.GameScore;
				global.speedStageData[global.SpeedSelected].rankScore = global.RankScore;
				global.speedStageData[global.SpeedSelected].player_CharScore = global.PlayerChar;
				global.speedStageData[global.SpeedSelected].player_SpriteScore = global.PlayerSelection[global.PlayerChar][17][0];
				global.speedStageData[global.SpeedSelected].player_CostumeScore = global.PlayerCostume;
			}
		
			//Ensure that if the minutes AND seconds are higher than what was previously saved, it will not save
			if global.speedStageData[global.SpeedSelected].minutes > 0 {
				if global.minutes < global.speedStageData[global.SpeedSelected].minutes {
					global.speedStageData[global.SpeedSelected].rankTime = global.RankTime;
					global.speedStageData[global.SpeedSelected].totalTime = (global.minutes * 100) + global.seconds;
					global.speedStageData[global.SpeedSelected].seconds = global.seconds;
					global.speedStageData[global.SpeedSelected].rings = global.Rings;
					global.speedStageData[global.SpeedSelected].enemies = global.EnemyCount;
					
					global.speedStageData[global.SpeedSelected].player_CharTime = global.PlayerChar;
					global.speedStageData[global.SpeedSelected].player_SpriteTime = global.PlayerSelection[global.PlayerChar][17][0];
					global.speedStageData[global.SpeedSelected].player_CostumeTime = global.PlayerCostume;
				} else if global.minutes == global.speedStageData[global.SpeedSelected].minutes {
					if global.seconds < global.speedStageData[global.SpeedSelected].seconds {
						global.speedStageData[global.SpeedSelected].rankTime = global.RankTime;
						global.speedStageData[global.SpeedSelected].totalTime = (global.minutes * 100) + global.seconds;
						global.speedStageData[global.SpeedSelected].seconds = global.seconds;
						global.speedStageData[global.SpeedSelected].rings = global.Rings;
						global.speedStageData[global.SpeedSelected].enemies = global.EnemyCount;
						
						global.speedStageData[global.SpeedSelected].player_CharTime = global.PlayerChar;
						global.speedStageData[global.SpeedSelected].player_SpriteTime = global.PlayerSelection[global.PlayerChar][17][0];
						global.speedStageData[global.SpeedSelected].player_CostumeTime = global.PlayerCostume;
					}
				}
			} else {
				if global.seconds < global.speedStageData[global.SpeedSelected].seconds && global.minutes == 0 {
					global.speedStageData[global.SpeedSelected].rankTime = global.RankTime;
					global.speedStageData[global.SpeedSelected].totalTime = (global.minutes * 100) + global.seconds;
					global.speedStageData[global.SpeedSelected].seconds = global.seconds;
					global.speedStageData[global.SpeedSelected].rings = global.Rings;
					global.speedStageData[global.SpeedSelected].enemies = global.EnemyCount;
					
					global.speedStageData[global.SpeedSelected].player_CharTime = global.PlayerChar;
					global.speedStageData[global.SpeedSelected].player_SpriteTime = global.PlayerSelection[global.PlayerChar][17][0];
					global.speedStageData[global.SpeedSelected].player_CostumeTime = global.PlayerCostume;
				}
			}
		
			if global.minutes <= global.speedStageData[global.SpeedSelected].minutes {
				global.speedStageData[global.SpeedSelected].minutes = global.minutes; //Keep track of minutes
			}
		}
		
		global.speedStageData[global.SpeedSelected].complete = true;
	}

	//Saving Level Data
	if instance_exists(obj_SavBox) or global.Freeplay {
		var _filename = string(global.SpeedDataFile) + string(_fileNum) + ".sav";
		var _json = json_stringify(global.speedStageData);
		var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	
		buffer_write(_buffer, buffer_string, _json);
		buffer_save(_buffer, _filename);
		buffer_delete(_buffer);
	}
}


///Speed Stage Loading
function load_Speed_Stage(_fileNum = 0) {
	//Loading our save data
	var _filename = string(global.SpeedDataFile) + string(_fileNum) + ".sav";
		
	if !file_exists(_filename) {
		exit;
	}
		
	//Load the buffer, get the JSON, delete the buffer from memory
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	
	buffer_delete(_buffer);
		
	//Unstringify and get the data array
	var _loadArray = json_parse(_json);
	
	for (var i = 0; i < array_length(_loadArray); i++) {
		if (i < array_length(global.speedStageData)) {
			var _saved = _loadArray[i];
			var _current = global.speedStageData[i];
			var _keys = variable_struct_get_names(_saved);
				
			for (var k = 0; k < array_length(_keys); k++) {
				var _key = _keys[k];
				
				variable_struct_set(_current, _key, variable_struct_get(_saved, _key));
			}
		} else {
			array_push(global.speedStageData, _loadArray[i]);
		}
	}
}