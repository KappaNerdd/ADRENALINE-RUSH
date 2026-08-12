var _spr = obj_Player.sprTrick1;

if obj_Player.leftFacer {
	_spr = obj_Player.sprTrick1Right;
}

scr_CreateHint([global.ConS_A1, global.ConS_J, global.ConS_J], "move_Trick", "desc_Trick", _spr, _spr);