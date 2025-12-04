scr_CreateRBG();

depth = -15;
playerConfirmed = false;
playerConfirmedTimer = 0;
playerConfirmedFrames = 10;

playerConfirmedTimer = playerConfirmedFrames;


partnerConfirmed = false;
partnerConfirmedTimer = 0;
partnerConfirmedFrames = 10;

partnerConfirmedTimer = partnerConfirmedFrames;


partner2Confirmed = false;
partner2ConfirmedTimer = 0;
partner2ConfirmedFrames = 60;

partner2ConfirmedTimer = partner2ConfirmedFrames;


//BPM Shit
global.BPM = 140;

global.ConvertedBPM = time_bpm_to_seconds(global.BPM);
global.RealBPM = 0;

confirmOpacity = 0;