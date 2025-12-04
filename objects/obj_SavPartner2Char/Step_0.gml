scr_GetCharLivesLocal();
_charCheck = global.statData.partner2_Char;

sprite_index = _liveSprite;

if _charCheck == -1 {
	visible = false;
} else {
	visible = true;
}


if !instance_exists(obj_SavBox) {
	instance_destroy();
}