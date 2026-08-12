var _spr = obj_Player.sprRailJump;

if obj_Player.leftFacer {
	_spr = obj_Player.sprRailJumpRight;
}

scr_CreateHint([global.ConS_J], "move_RJump", "desc_RJump", _spr, _spr);