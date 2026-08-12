var _spr = obj_Player.sprDJump;

if obj_Player.leftFacer {
	_spr = obj_Player.sprDJump;
}

scr_CreateHint([global.ConS_SP1], "move_BTrick", "desc_BTrick", _spr, _spr);