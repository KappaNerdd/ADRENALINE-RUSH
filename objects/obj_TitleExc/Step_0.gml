getCharacterControls();

if place_meeting(x, y, obj_TitleCursor) {	
	if jump_Key && !characters {
		obj_SFXManager.menuPop = true;
		characters = true;
	}
}

image_xscale = changeScale;
image_yscale = changeScale;

image_speed = 0;


if global.TitleOpt != "START" && global.TitleOpt != "OPTIONS" {
	y = lerp(y, 28, 0.1);
} else {
	y = lerp(y, -100, 0.1);
}