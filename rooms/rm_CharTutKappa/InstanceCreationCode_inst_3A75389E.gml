var _spr = obj_Player.sprTrickSide;

if obj_Player.leftFacer {
	_spr = obj_Player.sprTrickRight;
}

scr_CreateHint([global.ConS_SP1], "move_BTrick", "desc_BTrick", _spr, _spr);