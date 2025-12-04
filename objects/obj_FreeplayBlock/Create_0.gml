movedX = 0;
movedY = 0;


target_rm = 0;
locked = false;


scr_GetCharShitCreate();


stageName = "";
stageLevel = "";
rank = -1;
char = -1;
charCost = 0;
part = -1;
part2 = -1;
timeSeconds = 0;
timeMinutes = 0;

mind = false;

requirement = "";

imageProgress = 0;
confirmed = false;
confirmedTimer = 90;

confirmedFlashTimer = 0;
confirmedFlashFrames = 5;
confirmedBlue = false;


depth = -100000000;

image_xscale = 9;
image_yscale = 2;

if !global.SimplifyVFX {
	image_speed = 1;
} else {
	image_speed = 0;
}