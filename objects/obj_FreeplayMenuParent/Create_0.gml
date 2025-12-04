movedX = 0;
movedY = 0;


target_rm = 0;
locked = false;


stageName = "";
stageLevel = "";
rank = -1;
char = -1;
charCost = 0;

part = -1;
partCost = 0;

part2 = -1;
part2Cost = 0;

timeSeconds = 0;
timeMinutes = 0;

depth = -100000000;
instance_create_depth(x, y, depth, obj_FreeplayBlock);


/*//Create levels
#region //Speed Stages

	///-----Mind-----///
	with(instance_create_depth(x, y, depth, obj_FreeplayBlock)) {
		movedX = 0;
		movedY = 0;
	
		target_rm = rm_HeadSpeed1;
	
		stageName = "MIND";
		stageLevel = "LEVEL 1";
		rank = global.speedStageData.mind_Level1.rank;
		char = global.speedStageData.mind_Level1.player_Char;
		charCost = global.speedStageData.mind_Level1.player_Costume;
		
		part = global.speedStageData.mind_Level1.partner_Char;
		partCost = global.speedStageData.mind_Level1.partner_Costume;
		
		part2 = global.speedStageData.mind_Level1.partner2_Char;
		part2Cost = global.speedStageData.mind_Level1.partner2_Costume;
		
		timeSeconds = global.speedStageData.mind_Level1.seconds;
		timeMinutes = global.speedStageData.mind_Level1.minutes;
		
		mind = true;
		
		requirement = "BEAT THE LEVEL IN STORY MODE";
	
		if timeSeconds == 59.99 && timeMinutes == 99 {
			locked = true;
		} else {
			locked = false;
		}
	}

	with(instance_create_depth(x, y, depth, obj_FreeplayBlock)) {
		movedX = 0;
		movedY = 70;
	
		target_rm = rm_HeadSpeed2;
	
		stageName = "MIND";
		stageLevel = "LEVEL 2";
		rank = global.speedStageData.mind_Level2.rank;
		char = global.speedStageData.mind_Level2.player_Char;
		charCost = global.speedStageData.mind_Level2.player_Costume;
		
		part = global.speedStageData.mind_Level2.partner_Char;
		partCost = global.speedStageData.mind_Level2.partner_Costume;
		
		part2 = global.speedStageData.mind_Level2.partner2_Char;
		part2Cost = global.speedStageData.mind_Level2.partner2_Costume;
		
		timeSeconds = global.speedStageData.mind_Level2.seconds;
		timeMinutes = global.speedStageData.mind_Level2.minutes;
		
		mind = true;
		
		requirement = "BEAT THE LEVEL IN STORY MODE";
	
		if timeSeconds == 59.99 && timeMinutes == 99 {
			locked = true;
		} else {
			locked = false;
		}
	}

	with(instance_create_depth(x, y, depth, obj_FreeplayBlock)) {
		movedX = 0;
		movedY = 140;
	
		target_rm = rm_HeadSpeedBoss;
	
		stageName = "MIND";
		stageLevel = "LEVEL BOSS";
		rank = global.speedStageData.mind_LevelBoss.rank;
		char = global.speedStageData.mind_LevelBoss.player_Char;
		charCost = global.speedStageData.mind_LevelBoss.player_Costume;
		
		part = global.speedStageData.mind_LevelBoss.partner_Char;
		partCost = global.speedStageData.mind_LevelBoss.partner_Costume;
		
		part2 = global.speedStageData.mind_LevelBoss.partner2_Char;
		part2Cost = global.speedStageData.mind_LevelBoss.partner2_Costume;
		
		timeSeconds = global.speedStageData.mind_LevelBoss.seconds;
		timeMinutes = global.speedStageData.mind_LevelBoss.minutes;
		
		mind = true;
		
		requirement = "BEAT THE LEVEL IN STORY MODE";
	
		if timeSeconds == 59.99 && timeMinutes == 99 {
			locked = true;
		} else {
			locked = false;
		}
	}

	with(instance_create_depth(x, y, depth, obj_FreeplayBlock)) {
		movedX = 0;
		movedY = 210;
	
		target_rm = rm_HeadSpeedBonus1;
	
		stageName = "MIND";
		stageLevel = "BONUS 1";
		rank = global.speedStageData.mind_Bonus1.rank;
		char = global.speedStageData.mind_Bonus1.player_Char;
		charCost = global.speedStageData.mind_Bonus1.player_Costume;
		
		part = global.speedStageData.mind_Bonus1.partner_Char;
		partCost = global.speedStageData.mind_Bonus1.partner_Costume;
		
		part2 = global.speedStageData.mind_Bonus1.partner2_Char;
		part2Cost = global.speedStageData.mind_Bonus1.partner2_Costume;
		
		timeSeconds = global.speedStageData.mind_Bonus1.seconds;
		timeMinutes = global.speedStageData.mind_Bonus1.minutes;
		
		mind = true;
		
		requirement = "GET A C-RANK OR BETTER ON MAIN LEVELS";
	
		if global.speedStageData.mind_Level1.rank >= 2 && global.speedStageData.mind_Level2.rank >= 2 && global.speedStageData.mind_LevelBoss.rank >= 2 {
			locked = false;
		} else {
			locked = true;
		}
	
	}

	/*with(instance_create_depth(x, y, depth, obj_FreeplayBlock)) {
		movedX = 0;
		movedY = 280;
	
		target_rm = rm_HeadSpeedBonus2;
	
		stageName = "MIND";
		stageLevel = "BONUS 2";
		rank = global.speedStageData.mind_Bonus2.rank;
		char = global.speedStageData.mind_Bonus2.player_Char;
		timeSeconds = global.speedStageData.mind_Bonus2.seconds;
		timeMinutes = global.speedStageData.mind_Bonus2.minutes;
	
		if global.speedStageData.mind_Level1.rank == 5 && global.speedStageData.mind_Level2.rank == 5 && global.speedStageData.mind_LevelBoss.rank == 5 {
			locked = false;
		} else {
			locked = true;
		}
	}*/

//#endregion



#region //Action Stages

#endregion