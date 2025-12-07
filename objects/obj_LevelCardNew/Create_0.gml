if global.Replay {
	fileName = string(global.speedStageData[global.SpeedSelected].record_File) + "Replay.sav";

	scr_LoadReplayChar(fileName);
}

x = -1000000;

#region //Depth
	depth = 2;
#endregion

#region //Stop player from movin' and have 'em do their Prepare animation
	if instance_exists(obj_Player) {
		obj_Player.can_Move = false;
		obj_Player.prepare = true;
		obj_Player.image_index = 0;
		obj_Player.image_speed = 0;
	}
#endregion

#region //Stop Animation if SimplifyVFX is on
	if global.SimplifyVFX {
		image_speed = 0;
		image_index = 0;
	} else {
		image_speed = 1;
	}
#endregion

#region //Character Boxes
	scr_GetCharTextboxes();
	image_alpha = 0.5;
	image_xscale = 21;
	image_yscale = 12;
#endregion


#region //Stage Bullshit
	mindImageIndex = 0;

	//Stage Name
	stageNameSprite = global.speedStageData[global.SpeedSelected].stage_Sprite;
	stageNameStartX = -500;
	stageNameEndX = 50;
	stageNameMoveX = stageNameStartX;
	stageSound = false;

	//Level Number
	levelNumberSprite = global.speedStageData[global.SpeedSelected].level_Sprite;
	levelNumberStartX = -200;
	levelNumberEndX = 50;
	levelNumberMoveX = levelNumberStartX;
	levelNumSound = false;

	//Level Type
	if global.PlayerChar == 0 or global.MIND {
		levelTypeSprite = spr_SpeedStageHead;
	} else {
		levelTypeSprite = spr_SpeedNorm;
	}
	
	levelTypeStartX = -200;
	levelTypeEndX = 50;
	levelTypeMoveX = levelTypeStartX;
	levelTypeSound = false;
#endregion


#region //Sonic Rush Spikes
	if global.PlayerChar == 0 or global.MIND {
		srSpikes = spr_SonicRush_Spikes_Head;
	} else {
		srSpikes = spr_SonicRushSpikesNorm;
	}

	moveRightStart = -120;
	moveRightEnd = -20;
	moveRight = moveRightStart;

	moveUpStart = -120;
	moveUpEnd = -20;
	moveUp = moveUpStart;

	moveDownStart = 480;
	moveDownEnd = 380;
	moveDown = moveDownStart;
	
	srSpikesImageIndex = 0;
	srSpikesImageIndexBack = 19;
#endregion

#region //Sonic Rush Boss Ball
	if global.PlayerChar == 0 or global.MIND {
		srBall = spr_CharSelectRushBossBallHead;
		srBallBG = spr_CharSelectRushBossBGHead;
	} else {
		srBall = spr_CharSelectRushBossBall;
		srBallBG = spr_CharSelectRushBossBG;
	}

	srBallBGMoveX = 0;
	
	srBallRotate = 0;
	srBallStartX = 0;
	srBallEndX = 0;
	srBallMoveX = 250;
	srBallMoveY = 0;
	
	fullBallX = 0;
#endregion


#region //Best Time, Rank, & Character
	savedMinutes = global.speedStageData[global.SpeedSelected].minutes;
	savedSeconds = global.speedStageData[global.SpeedSelected].seconds;
	savedScore = global.speedStageData[global.SpeedSelected].gameScore;
	savedRankTime = global.speedStageData[global.SpeedSelected].rankTime;
	savedCharTime = global.speedStageData[global.SpeedSelected].player_SpriteTime;
	savedCostumeTime = global.speedStageData[global.SpeedSelected].player_CostumeTime;
	savedCharScore = global.speedStageData[global.SpeedSelected].player_SpriteScore;
	savedCostumeScore = global.speedStageData[global.SpeedSelected].player_CostumeScore;
	savedRankScore = global.speedStageData[global.SpeedSelected].rankScore;
	savedRank = global.speedStageData[global.SpeedSelected].rank;
	savedChar = global.speedStageData[global.SpeedSelected].player_Sprite;
	savedCostume = global.speedStageData[global.SpeedSelected].player_Costume;
	
	savedStartY = 600;
	savedEndY = 250;
	savedMoveY = savedStartY;
#endregion	
	
	
#region //Player
	playerSprite = global.PlayerSelection[global.PlayerChar][9][0];
	playerCostume = global.PlayerCostume;
	
	playerStartX = 800;
	playerEndX = 300;
	playerMoveX = playerStartX;
#endregion


#region //Extra Variables
	completed = false;
	completedTimer = 30;
	
	incompleteTimer = 210;
#endregion
