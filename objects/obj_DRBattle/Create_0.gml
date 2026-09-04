depth = 50; //global.DRPlayerID.depth + 1;
image_angle = -45;
image_blend = c_blue;
image_alpha = 0;
image_xscale = 40;
image_yscale = 55;

if !global.SimplifyVFX {
	image_speed = 0.5;
} else {
	image_speed = 0;
}

makeBG = true;

waitTimer = 45;
entered = false;
enteredTimer = 10;
otherEnter = false;

battleTimer = 30;
battleStance = false;
battledTimer = 45;
battling = false;

changePos = false;

targetX = 0;
targetY = 0;

enemTargetX = 0;
enemTargetY = 0;

savedMusPos = 0;

scr_SetCamFollow(noone);
scr_SetCharDRMove(false);

obj_SFXManager.breakSonic = true;

if array_length(global.DRPartyReal) > 0 {
	for(var i = 0; i < array_length(global.DRPartyReal); i++) {	
		with(global.DRPartyReal[i]) {
			prevX = x;
			prevY = y;
		}
	}
}