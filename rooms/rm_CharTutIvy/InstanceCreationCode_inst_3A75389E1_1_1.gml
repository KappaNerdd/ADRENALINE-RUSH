var _spr = obj_Player.sprTrickUp;

if obj_Player.leftFacer {
	_spr = obj_Player.sprTrickUp;
}

scr_CreateHint([global.ConS_SP1], "move_BTrick", "desc_BTrick", _spr, _spr);