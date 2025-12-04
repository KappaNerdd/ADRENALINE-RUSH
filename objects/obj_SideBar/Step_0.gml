if instance_exists(obj_PressEnterHead) {
	if obj_PressEnterHead.enterTimer == 59 {
		xspd = -9.5;
	}
	
	if obj_PressEnterHead.enterTimer == 59 && !instance_exists(obj_TitleCursor) {
		instance_create_layer(370, 270, "Instances", obj_TitleCursor);
	}
	
	if obj_PressEnterHead.enterTimer > 60 {
		xspd += 0.1;
	}
}

if xspd > 0 {
	xspd = 0;
}

x += xspd;
y += yspd;