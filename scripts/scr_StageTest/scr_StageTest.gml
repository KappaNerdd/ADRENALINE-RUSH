///Speed Stage Saving

//-----Test Stage-----//
function save_Stage() {
	
	var _saveArray = array_create(0);

	///-----Test Stage-----///
	if room == rm_SpeedStageTest {
		//Rank, Time, Stage Name, Stage Type, Stage Number, and What character was used 
		global.stageData.test_Level.stage_Name = global.StageName; //Check what the stage name is
		global.stageData.test_Level.stage_Type = global.StageType; //Check what the stage type is
		global.stageData.test_Level.level_Num = global.StageNum; //Check what the level number is
	
		//Ensure that if the time is higher than what was previously saved, it will not save what character you used
		if global.minutes <= global.stageData.test_Level.minutes && global.seconds <= global.stageData.test_Level.seconds {
			global.stageData.test_Level.player_Char = global.PlayerChar; //What character you played as
		}
	
		//Ensure that if the rank is lower than what was previously saved, it will not save
		if global.Rank >= global.stageData.test_Level.rank {
			global.stageData.test_Level.rank = global.Rank; //Keep track of rank
		}
	
		//Ensure that if the minutes are higher than what was previously saved, it will not save
		if global.minutes <= global.stageData.test_Level.minutes {
			global.stageData.test_Level.minutes = global.minutes; //Keep track of minutes
		}
	
		//Ensure that if the minutes AND seconds are higher than what was previously saved, it will not save
		if global.minutes <= global.stageData.test_Level.minutes && global.seconds <= global.stageData.test_Level.seconds {
			global.stageData.test_Level.seconds = global.seconds; //Keep track of seconds
		}
	}
	
	///-----Test Stage 2-----///
	if room == rm_SpeedStageTest2 {
		//Rank, Time, Stage Name, Stage Type, Stage Number, and What character was used 
		global.stageData.test_Level2.stage_Name = global.StageName; //Check what the stage name is
		global.stageData.test_Level2.stage_Type = global.StageType; //Check what the stage type is
		global.stageData.test_Level2.level_Num = global.StageNum; //Check what the level number is
	
		//Ensure that if the time is higher than what was previously saved, it will not save what character you used
		if global.minutes <= global.stageData.test_Level2.minutes && global.seconds <= global.stageData.test_Level2.seconds {
			global.stageData.test_Level2.player_Char = global.PlayerChar; //What character you played as
		}
	
		//Ensure that if the rank is lower than what was previously saved, it will not save
		if global.Rank >= global.stageData.test_Level2.rank {
			global.stageData.test_Level2.rank = global.Rank; //Keep track of rank
		}
	
		//Ensure that if the minutes are higher than what was previously saved, it will not save
		if global.minutes <= global.stageData.test_Level2.minutes {
			global.stageData.test_Level2.minutes = global.minutes; //Keep track of minutes
		}
	
		//Ensure that if the minutes AND seconds are higher than what was previously saved, it will not save
		if global.minutes <= global.stageData.test_Level2.minutes && global.seconds <= global.stageData.test_Level2.seconds {
			global.stageData.test_Level2.seconds = global.seconds; //Keep track of seconds
		}
	}


	array_push(_saveArray, global.stageData);

	//Saving Level Data
	var _filename = "TBAHSStageData.sav";
	var _json = json_stringify(_saveArray);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	
	buffer_write(_buffer, buffer_string, _json);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);

}


///Speed Stage Loading
function load_Stage() {
	
	//Loading our save data
		var _filename = "TBAHSStageData.sav";
		if !file_exists(_filename) {
			exit;
		}
		
		//Load the buffer, get the JSON, delete the buffer from memory
		var _buffer = buffer_load(_filename);
		var _json = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		
		//Unstringify and get the data array
		var _loadArray = json_parse(_json);
		
	//Set the data in our game to match our loaded data
	global.stageData = array_get(_loadArray, 0);
	
	//Loading our save data
		var _filename = "TBAHSStageTest2.sav";
		if !file_exists(_filename) {
			exit;
		}
		
		//Load the buffer, get the JSON, delete the buffer from memory
		var _buffer = buffer_load(_filename);
		var _json = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		
		//Unstringify and get the data array
		var _loadArray = json_parse(_json);
		
	//Set the data in our game to match our loaded data
	global.stageData = array_get(_loadArray, 0);
	
}