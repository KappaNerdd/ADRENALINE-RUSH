var _spr = obj_Player.sprSlideRight;

if obj_Player.leftFacer {
	_spr = obj_Player.sprSlideRight;
}

scr_CreateHint([global.ConS_SP1], "move_CSlide", "desc_CSlide", _spr, _spr);