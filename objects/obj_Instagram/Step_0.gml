getCharacterControls();

if place_meeting(x, y, obj_TitleCursor) && (jump_Key or device_mouse_check_button_pressed(0, mb_left)) {
	url_open("https://www.instagram.com/kappanerd/");
}

x += xspd;
y += yspd;

if instance_exists(obj_PressEnterHead) {
	if obj_PressEnterHead.enterTimer == 86 {
		yspd = -5;
	}
}

if instance_exists(obj_PressEnterHead) {
	if obj_PressEnterHead.enterTimer > 87 {
		yspd += 0.2;
	}
}

if yspd > 0 {
	yspd = 0;
}