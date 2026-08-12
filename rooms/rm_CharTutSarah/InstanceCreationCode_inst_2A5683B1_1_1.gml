var _spr = obj_Player.sprDJumpRight;

if obj_Player.leftFacer {
	_spr = obj_Player.sprDJumpRight;
}

scr_CreateHint([global.ConS_J, ">", global.ConS_J], "move_DJump", noone, _spr, _spr);