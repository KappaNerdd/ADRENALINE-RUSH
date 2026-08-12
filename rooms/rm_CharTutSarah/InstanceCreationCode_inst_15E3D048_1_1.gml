var _spr = obj_Player.sprCrouchRight;

if obj_Player.leftFacer {
	_spr = obj_Player.sprCrouchRight;
}

scr_CreateHint([global.ConS_J, "+", global.ConS_D], "move_SSlide", "desc_SSlide", _spr, _spr);