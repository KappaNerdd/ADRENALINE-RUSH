getCharacterControls();

//Keys
r_Key = right_Key;
l_Key = left_Key;
u_Key = up_Key;
d_Key = down_Key;

if action1_Key_Held {
	fast_spd = 1.5;
} else {
	fast_spd = 1;
}

if !instance_exists(obj_RoomTransParent) or canMove == true {
	//Movement
	xspd = (r_Key - l_Key) * move_spd * fast_spd;
	yspd = (d_Key - u_Key) * move_spd * fast_spd;
}

//Stop (Like that one Dwayne Johnson GIF I see all over Instagram comments. Shit's hilarious lol.)
if instance_exists(obj_RoomTransParent) or canMove == false {
	xspd = 0;
	yspd = 0;
}


//Collision
if place_meeting(x + xspd, y, obj_BorderV) {
	xspd = 0;
}

if place_meeting(x + xspd, y, obj_BorderV) {
	xspd = 0;
}

if place_meeting(x, y + yspd, obj_BorderH) {
	yspd = 0;
}

if place_meeting(x, y + yspd, obj_BorderH) {
	yspd = 0;
}


if instance_exists(obj_TitleMenuParent) {
	if place_meeting(x, y, obj_TitleMenuParent) {
		sprite_index = confirmCursor;
	} else {
		sprite_index = normalCursor;
	}
} else if instance_exists(obj_NameConfirm) {
	if place_meeting(x, y, obj_NameConfirm) && global.NameConfirm == false {
		sprite_index = confirmCursor;
	} else if place_meeting(x, y, obj_NameBack) && obj_NameBack.image_alpha == 1 {
		sprite_index = confirmCursor;
	} else if place_meeting(x, y, obj_NameChar) && obj_NameChar.image_alpha == 1 {
		sprite_index = confirmCursor;
	} else if place_meeting(x, y, obj_NameYes) && obj_NameYes.visible == true {
		sprite_index = confirmCursor;
	} else if place_meeting(x, y, obj_NameNo) && obj_NameNo.visible == true {
		sprite_index = confirmCursor;
	} else {
		sprite_index = normalCursor;
	}
}

if global.PlayerChar > 0 {
	image_index = global.PlayerChar - 1;
} else {
	image_index = 0;
}

/*if !instance_exists(obj_RoomTransParent) {
	if mouse_x != preMouseX {
		x = mouse_x;
		preMouseX = mouse_x;
	}
	
	if mouse_y != preMouseY {
		y = mouse_y;
		preMouseY = mouse_y;
	}
}*/

x += xspd;
y += yspd;