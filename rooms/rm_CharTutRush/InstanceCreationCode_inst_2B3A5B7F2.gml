var _spr = obj_Player.sprSlide;

if obj_Player.leftFacer {
	_spr = obj_Player.sprSlideRight;
}

scr_CreateHint([global.ConS_D], "move_Roll", "desc_Roll", _spr, _spr);