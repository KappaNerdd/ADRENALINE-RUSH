obj_Player.can_Move = false;

//This shit is gonna be super cancerous. I promise I'll make an actual cutscene system, but a lot of tutorials
//are outdated.

sprite_index = obj_CustomJumpKeySpeed.sprite_index;
image_index = obj_CustomJumpKeySpeed.image_index;

image_speed = 0;

image_alpha = 0;
depth = -10000;

image_xscale = 0.5;
image_yscale = 0.5;

text_idText = "newGame";

text_id = "prologue";


//Camera Cutscene
beforeCameraTimer = 300;
beforeCameraConfirmed = false;

cameraTimer = 360;
cameraConfirmed = false;


//Kappa Lay Cutscene
waitTimer = 300;

confirmed = false;
confirmedWait = 60;


//Kappa Get Up
getupTimer = 330;
getupConfirmed = false;


//Kappa Look Up
lookUpTimer = 180;
lookUp = false;
afterLookUptimer = 180;


//Wait 2
endCutsceneTimer = 180;
endCutscene = false;


//Wait 3
textCutsceneTimer = 5;
textCutsceneConfirm = false;
textCutsceneAfterTimer = 120;