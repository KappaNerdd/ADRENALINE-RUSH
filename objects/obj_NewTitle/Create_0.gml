depth = -2;

randomize();

nerd = round(random(1));
if global.PlayerChar == 0 {
	global.PlayerChar = 1;
}

global.Freeplay = false;
global.MIND = false;
global.FreeFall = false;
global.DisableHUD = false;
global.BaseX = 0;
global.BaseScale = 0;
global.BaseSpikes = 0;

scr_MusicTag();
scr_BPMCreate(165);
set_song_ingame(mus_RoundNRound_Loop);

beats = 165;
conBPM = 1000000 * (60 / beats);
realBPM = 0;

confirm = false;
confirmTimer = 120;

extraScale = 0;

backTextX = 384;
otherBackTextX = -384;

baseTextX = 384;
otherBaseTextX = -384;

srSpikesIndex = 0;

menuX = 250;
menuY = -200;

pressStart = true;
pressed = false;
pressedTimer = 5;