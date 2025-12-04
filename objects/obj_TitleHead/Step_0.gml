x += xspd;
y += yspd;

if yspd > 0 {
	yspd += dcc;
}

if yspd <= 0 {
	yspd = 0;
}
if instance_exists(obj_PressEnterHead) {
	if obj_PressEnterHead.enterTimer == 89 {
		xspd = -5.25;
	}
	if obj_PressEnterHead.enterTimer == 90 {
		xspd += 0.10;
	}
}

if xspd > 0 {
	xspd = 0;
}



if global.Language == 1 {	
	sprite_index = spr_TitleHead;
} else if global.Language == 2 {
	sprite_index = spr_TitleHeadLatam;
}
