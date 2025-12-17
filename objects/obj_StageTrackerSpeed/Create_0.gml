rankS_Time = 055;
rankA_Time = 120;
rankB_Time = 150;
rankC_Time = 190;
rankD_Time = 250;
rankF_Time = 300;

totalSeconds = 0;

global.PRank = true;
global.StarterHealth = global.Health;

global.TargetRM = 0;
global.TargetX = 0;
global.TargetY = 0;

extraLife = [
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
]

global.PlayerID = noone;

if !global.LevelForced {
	if (global.PlayerChar == 0 or global.MIND) {
		instance_create_depth(x, y, depth, obj_CountdownHead);
	} else {
		instance_create_depth(x, y, depth, obj_Countdown);
	}
	
	if instance_exists(obj_Player) {
		obj_Player.can_Move = false;
	}
} else {
	instance_create_depth(-10000000, 0, 0, obj_LevelCardMinor);
	
	if !instance_exists(obj_ActualGhost) {
		instance_create_depth(x, y, depth, obj_ActualGhost);
	}
}

if instance_exists(obj_InputRecorder) {
	obj_InputRecorder.index = 0;
	obj_InputRecorder.frame = 0;
}
	
if instance_exists(obj_GhostRecorder) {
	obj_GhostRecorder.ghostRecordFrames = 0;
}

if !global.CustomMus {
	if !global.Girly {
		playTrack = global.speedStageData[global.SpeedSelected].musicTrack;
	} else {
		playTrack = global.speedStageData[global.SpeedSelected].musicTrackGirly;
	}
} else {
	playTrack = global.CustomMusic;
}


	
set_song_ingame(playTrack, 60, 30);

instance_create_depth(x, y, depth, obj_PlayerExtraLives);
instance_create_depth(x, y, depth, obj_Timer);
instance_create_depth(x, y, depth, obj_HUDRankDisplayer);
instance_create_depth(x, y, depth, obj_LevelCoords);
instance_create_depth(x, y, depth, obj_CameraExtended);
instance_create_depth(x, y, depth, obj_CreatePauseSpeed);
instance_create_depth(x, y, depth, obj_GhostRecorder);
instance_create_depth(x, y, depth, obj_InputRecorder);




