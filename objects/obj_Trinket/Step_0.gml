scr_GetCharRushBoostIcon();

if !global.MIND && global.PlayerChar != 0 {
	sprite_index = _charCheck3;
	colChar = c_black;
} else {
	sprite_index = spr_HeadCollectable;
	colChar = c_white;
}