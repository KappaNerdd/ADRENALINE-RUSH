var _spr = obj_Player.sprCrouch;

if obj_Player.leftFacer {
	_spr = obj_Player.sprCrouch;
}

scr_CreateHint([global.ConS_J, "+", global.ConS_D], "move_SRoll", "desc_SRoll", _spr, _spr);