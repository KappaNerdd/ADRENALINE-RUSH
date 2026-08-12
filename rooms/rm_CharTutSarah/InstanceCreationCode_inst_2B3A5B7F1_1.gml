var _spr = obj_Player.sprSlideRight;

if obj_Player.leftFacer {
	_spr = obj_Player.sprSlideRight;
}

scr_CreateHint([global.ConS_D], "move_Slide", "desc_Slide", _spr, _spr);