active = true;
wallJumpable = true;
floorAngle = 0;
angleChecking = 0;


if global.PlayerChar == 2 {
	sprite_index = spr_SarahTextbox;
} else if global.PlayerChar == 12 {
	sprite_index = spr_IvyTextbox;
} else {
	sprite_index = spr_TextboxHead;
}