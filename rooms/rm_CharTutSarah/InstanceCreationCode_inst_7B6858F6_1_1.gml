var _spr = obj_Player.sprJumpRight;

if obj_Player.leftFacer {
	_spr = obj_Player.sprJumpRight;
}

scr_CreateHint([global.ConS_J], "move_Jump", "desc_Jump", _spr, _spr);