global.CostumeNum = array_length(global.PlayerSelection[global.PlayerChar][4]);

if global.SelectedCostume > global.CostumeNum - 1 {
	global.SelectedCostume = global.CostumeNum;
}

if langCheck != global.Language {
	for(var i = 0; i < array_length(global.PlayerSelection); i++) {
		var _players = global.PlayerSelection[i];
		
		_players[0][0] = _players[0][0];
		_players[0][2] = _players[0][2];
		
		for(var c = 0; c < array_length(_players[4]); c++) {
			_players[4][c][3] = _players[4][c][3];
		}
	}
	
	langCheck = global.Language;
}

#region //Speed Stage Unlocks
	#region //MIND BONUS 1 & 2
		if global.speedStageData[0].rank >= 2 && global.speedStageData[1].rank >= 2 && global.speedStageData[2].rank >= 2 && global.speedStageData[3].locked {
			global.speedStageData[3].locked = false;
		}
	#endregion
	
	#region //OTHERTOWN (DAY & NIGHT) Level 2
		global.speedStageData[6].locked = true;
		global.speedStageData[9].locked = true;
	#endregion
#endregion