if localSeconds < 60 && localSeconds > 59.9 {
	localSeconds = 0;
	localMinutes += 1;
}


if place_meeting(obj_Player.x, obj_Player.y, obj_LevelDoorHead) {
	if opacity < 1 {
		opacity += 0.05;
	}
} else {
	if opacity > 0 {
		opacity -= 0.05;
	}
}