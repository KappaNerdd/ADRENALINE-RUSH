var _spr = obj_Player.sprRailJumpRight;

if obj_Player.leftFacer {
	_spr = obj_Player.sprRailJumpRight;
}

scr_CreateHint([global.ConS_SP1], "move_BTrick", "desc_BTrick", _spr, _spr);