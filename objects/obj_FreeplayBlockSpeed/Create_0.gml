scr_GetCharShitCreate();
scr_GetCharTextboxes();

movedX = 0;
movedY = 0;

locked = false;

scrollOffset = 0;
scrollSpeed = 10;
setSpeed = 0;
scrollSpacing = 100;
selectedIndex = 0;

scrollX = 0;
scrollY = 0;

holdFrames = 20;

holdDownTimer = 20;
hitDown = false;

holdUpTimer = 20;
hitUp = false;

scrollTimer = 5;

imageProgress = 0;
confirmed = false;
confirmedTimer = 90;

confirmedFlashTimer = 0;
confirmedFlashFrames = 5;
confirmedBlue = false;

pressedLock = false;
lockedSubImg = 0

musicPlay = false;

requirement = "";

char = 0;

depth = obj_SonicRushSpikesNorm.depth + 1;

image_xscale = 9;
image_yscale = 3;

if !global.SimplifyVFX {
	image_speed = 1;
} else {
	image_speed = 0;
}