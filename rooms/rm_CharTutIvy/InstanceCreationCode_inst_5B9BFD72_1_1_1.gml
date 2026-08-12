var _spr = obj_Player.sprTrickSide;

if obj_Player.leftFacer {
	_spr = obj_Player.sprTrickSide;
}

scr_CreateHint([global.ConS_SP1], "move_DTrick", "desc_DTrick", _spr, _spr);