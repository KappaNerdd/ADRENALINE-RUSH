depth = -5;

image_speed = 1 - global.SimplifyVFX;

set_song_ingame(mus_MINDWAVE_A, 60, 60);
scr_MusicTag();

charStat = [
	"bio_Name", "bio_Origin", "bio_Defeat",
]

chars = [
	[spr_CharBioANGEL, "name_Angel", "level_MIND", "bio_Angel", spr_TextboxHead, [255, 255, 255], true],
	[spr_CharBioFLEA, "name_Flea", "level_MIND", "bio_Flea", spr_TextboxHead, [255, 255, 255], true],
	[spr_CharBioCHIMERA, "name_Chimera", "level_MIND?", "bio_Chimera", spr_TextboxHead, [255, 255, 255], true],
]

charCheck = 0;
shownChar = 0;

charX = 0;

moveTimer = 1;
moveFrames = 15;

moveLeft = false;
moveRight = false;
charAlpha = 1;

leave = false;

r = 0;
g = 0;
b = 0;

boxIndex = 0;
srSpikesIndex = 0;

checkBio = false;
bioAlpha = 0;
bioBoxScale = 0;