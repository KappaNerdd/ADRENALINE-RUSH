colChar = c_black;

image_speed = 0.25;

image_xscale = 1;
image_yscale = 1;

scr_GetCharRushBoostIcon();

if !global.MIND && global.PlayerChar != 0 {
	sprite_index = _charCheck3;
	colChar = c_black;
} else {
	sprite_index = spr_HeadCollectable;
	colChar = c_white;
}