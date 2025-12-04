getCharacterControls();

if place_meeting(x, y, obj_TitleCursor) && (jump_Key or device_mouse_check_button_pressed(0, mb_left)) {
	if image_index == 0 {
		url_open("https://bsky.app/profile/kappanerd.bsky.social");
	} else if image_index == 1 {
		url_open("https://www.instagram.com/kappanerd/");
	} else if image_index == 2 {
		url_open("https://x.com/KappaNerd");
	} else if image_index == 3 {
		url_open("https://www.youtube.com/@KappaNerd");
	}
}

x += xspd;
y += yspd;


if yspd < 0 {
	yspd += 0.05;
}

if yspd >= 0 {
	yspd = 0;
}
