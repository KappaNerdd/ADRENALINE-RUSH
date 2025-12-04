getCharacterControls();

//Keys
r_Key = right_Key;
l_Key = left_Key;
u_Key = up_Key;
d_Key = down_Key;


if !instance_exists(obj_RoomTransParent) or canMove == true {
	//Movement
	xspd = (r_Key - l_Key) * move_spd;
	yspd = (d_Key - u_Key) * move_spd;
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



if place_meeting(x, y, obj_PauseMenuBoxParent) {
	image_index = 1;
} else {
	image_index = 0;
}


x += xspd;
y += yspd;