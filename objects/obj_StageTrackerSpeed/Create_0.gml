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
} else {
	instance_create_depth(-10000000, 0, 0, obj_LevelCardMinor);
	
	if !instance_exists(obj_ActualGhost) {
		instance_create_depth(x, y, depth, obj_GhostRecorder);
		instance_create_depth(x, y, depth, obj_ActualGhost);
	}
}

if !global.Girly {
	playTrack = global.speedStageData[global.SpeedSelected].musicTrack;
} else {
	playTrack = global.speedStageData[global.SpeedSelected].musicTrackGirly;
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




