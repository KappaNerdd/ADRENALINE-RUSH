var _spr = obj_Player.sprPeeloutRev;

if obj_Player.leftFacer {
	_spr = obj_Player.sprPeeloutRev;
}

scr_CreateHint([global.ConS_J, "+", global.ConS_U], "move_RPeelout", "desc_RPeelout", _spr, _spr);