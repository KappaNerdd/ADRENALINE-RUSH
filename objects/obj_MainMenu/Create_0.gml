depth = -2;

randomize();

global.Freeplay = false;
global.MIND = false;
global.FreeFall = false;
global.DisableHUD = false;

scr_BPMCreate(165);
scr_MusicTag();

nerd = round(random(1));

if nerd == 0 {
	if !audio_is_playing(mus_WrapItUpK) && !audio_is_playing(mus_WrapItUpL) {
		set_song_ingame(mus_WrapItUpK);
	} else {
		var _trackPos = audio_sound_get_track_position(obj_MusicManager.songInstance);

		set_song_ingame(mus_WrapItUpK, 0, 0, 1, _trackPos);
	}
} else {
	if !audio_is_playing(mus_WrapItUpK) && !audio_is_playing(mus_WrapItUpL) {
		set_song_ingame(mus_WrapItUpL);
	} else {
		var _trackPos = audio_sound_get_track_position(obj_MusicManager.songInstance);

		set_song_ingame(mus_WrapItUpL, 0, 0, 1, _trackPos);
	}
}

beats = 165;
conBPM = 1000000 * (60 / beats);
realBPM = 0;

charShit = [
	[spr_MenuButtonSonic, spr_CharSelectKappaIcon, c_blue],
	[spr_MenuButtonBlaze, spr_CharSelectLuciferIcon, c_fuchsia],
]

menu = [
	["title_Gameplay", spr_GameplayRender, true],
	["fs_FileSelect", spr_GameplayRender, false],
	["title_Extras", spr_GameplayRender, true],
	["title_Options", spr_GameplayRender, true],
	["title_Credits", spr_GameplayRender, true],
	["title_Discord", spr_GameplayRender, true],
	["title_Socials", spr_GameplayRender, true],
	["title_QuitGame", spr_GameplayRender, true],
]

menuX = 250;
menuY = -250;
menuAngle = -720;
iconScale = 0;

renderX = -800;

gameplay = [
	["title_StoryMode", spr_GameplayRender, false],
	["title_Freeplay", spr_GameplayRender, true],
]

story = [
	["title_NewGame", spr_GameplayRender, true],
	["title_Continue", spr_GameplayRender, true],
]

extra = [
	["title_Achievements", spr_GameplayRender, false],
	["title_Boombox", spr_GameplayRender, true],
	["title_Gallery", spr_GameplayRender, false],
	["title_Bios", spr_GameplayRender, true],
	["title_Enemy", spr_GameplayRender, true],
]

gameplayChosen = false;
moveGameplay = false;

storyChosen = false;
moveStory = false;

extraChosen = false;
moveExtra = false;

menuChoice = 0;
subMenuChoice = 0;
storyMenuChoice = 0;

menuMoveTimer = 1;
menuMoveFrames = 10;

menuChosen = false;
cancelMenu = false;
waitTimer = 60;
waitFrames = 60;
retTimer = 5;

confirm = false;

extraScale = global.BaseScale;

backTextX = global.BaseX;
otherBackTextX = -global.BaseX;

baseTextX = 384;
otherBaseTextX = -384;

menuRet = false;

srSpikesIndex = global.BaseSpikes;

charX = 0;

changedAngle = 0;
anotherAngle = 5;

goFreeplay = false
goContinue = false;
goFileSelect = false;

goCredits = false;

goBio = false;
goEnemy = false;
goGallery = false;

newGameWarning = false;
goNewGame = false;
newGameAlpha = 0;
newGameAlpha2 = 0;
newGameWait = 2;
newGameFrame = 2;