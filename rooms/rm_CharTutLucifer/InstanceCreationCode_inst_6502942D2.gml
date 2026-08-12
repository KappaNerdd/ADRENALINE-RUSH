var _spr = obj_Player.sprGlide;

if obj_Player.leftFacer {
	_spr = obj_Player.sprGlide;
}

scr_CreateHint([global.ConS_SP1], "move_LBGlide", "desc_LBGlide", _spr, _spr);