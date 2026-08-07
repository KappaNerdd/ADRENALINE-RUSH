lowerPlayerTimer = 90;
raiseMeUpTimer = 360;

playerMove = false;

gasterWait = 120;
gaster1 = false;
gaster2 = false;
gaster3 = false;

enemyWait = 120;

spawnEnemies = false;
playerMove2 = false;

itsEvenFunnierTheSecondTime = false;
funnyTimer = 60;

doneTimer = 60;

depth = obj_Player.depth + 1;

var _theme = mus_DisturbingMindAllegro;

if global.Girly {
	_theme = mus_DisturbingMindGirlyAllegro;
}

if !audio_is_playing(_theme) && !global.Jukebox {
	set_song_ingame(_theme);
	scr_MusicTag();
}

obj_Player.enemyComboTimer = 1;
