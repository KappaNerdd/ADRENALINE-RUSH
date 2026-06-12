obj_Player.can_Move = false;
obj_Player.sliding = false;
obj_Player.collideTimer = 0;
obj_Player.collide = false;
obj_Player.action1_Key_Held = false;
scr_StopCamDir("v", true);
scr_MoveCam("v", -20);
//scr_ChangeCamZoom(1.25, 0.1);
global.DisableHUD = true;

fullVelTimer = 180;
boostingTimer = 420;

createdChar = instance_create_depth(obj_Player.x + 100, obj_Player.y - 1000, obj_Player.depth, obj_SarahOverworld);

with(createdChar) {
	can_Move = false;
}