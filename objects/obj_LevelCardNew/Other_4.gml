instance_create_depth(-100000, 0, 0, obj_MusicTag);

if !global.Girly {
	playTrack = global.speedStageData[global.SpeedSelected].musicTrack;
} else {
	playTrack = global.speedStageData[global.SpeedSelected].musicTrackGirly;
}
	
set_song_ingame(playTrack, 60, 30);