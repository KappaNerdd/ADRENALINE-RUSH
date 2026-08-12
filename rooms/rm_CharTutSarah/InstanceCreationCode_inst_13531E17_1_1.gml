var _spr = obj_Player.sprRailTrick3Right;

if obj_Player.leftFacer {
	_spr = obj_Player.sprRailTrick3Right;
}

scr_CreateHint([global.ConS_SP1, global.ConS_SP1, global.ConS_SP1], "move_RTrick", "desc_RTrick", _spr, _spr);