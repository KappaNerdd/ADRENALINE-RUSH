var _spr = obj_Player.sprTrickRight;

if obj_Player.leftFacer {
	_spr = obj_Player.sprTrickRight;
}

scr_CreateHint([global.ConS_SP1], "move_DTrick", "desc_DTrick", _spr, _spr);