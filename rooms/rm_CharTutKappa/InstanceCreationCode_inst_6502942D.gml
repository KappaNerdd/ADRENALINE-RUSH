var _spr = obj_Player.sprAirDash;

if obj_Player.leftFacer {
	_spr = obj_Player.sprAirDash;
}

scr_CreateHint([global.ConS_SP1], "move_KADash", "desc_KADash", _spr, _spr);