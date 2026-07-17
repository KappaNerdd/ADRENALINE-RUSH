with(obj_Player) {
	event_user(0);
	event_user(1);
	event_user(2);
	event_user(3);
	
	if other.moveLeftTimer > 0 {
		other.moveLeftTimer--;
		left_Key = true;
	} else {
		scr_ControlSpeedCreate();
	}
}