var _spr = obj_Player.sprSpindashRev;

if obj_Player.leftFacer {
	_spr = obj_Player.sprSpindashRev;
}

scr_CreateHint([global.ConS_J, "+", global.ConS_D], "move_RSpindash", "desc_RSpindash", _spr, _spr);