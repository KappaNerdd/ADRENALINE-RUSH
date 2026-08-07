obj_Player.can_Move = false;
obj_Player.action1_Key_Held = false;
obj_Player.stomping = false;
global.DisableHUD = true;

moveLeftTimer = 30;

with(obj_Player) {
	scr_ControlSpeedCreate();
}

if !global.Jukebox {
	set_song_ingame(noone, 180);
}