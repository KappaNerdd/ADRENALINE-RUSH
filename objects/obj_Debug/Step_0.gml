if global.DEBUG == true {
	if keyboard_check_pressed(ord("1")) {
		room_goto_next();
		if room == noone {
			exit;
		}
	}

	if keyboard_check_pressed(ord("2")) {
		room_goto_previous();
		if room == rm_Init {
			exit;
		}
	}
	
	if keyboard_check_pressed(ord("W")) {
		global.camZoom += 0.01;
	} else if keyboard_check_pressed(ord("S")) {
		global.camZoom -= 0.01;
	}
	
	if keyboard_check_pressed(ord("9")) {
		room_goto(rm_FileSelectNew);
	}
	
	if keyboard_check_pressed(ord("Q")) {
		room_goto(rm_ResultsScreen);
	}
	
	if keyboard_check_pressed(ord("D")) {
		room_goto(rm_ActionStageTest);
	}
	
	if keyboard_check_pressed(ord("T")) {
		room_goto(rm_Saiyan);
	}
	
	if keyboard_check_pressed(vk_lalt) {
		if instance_exists(obj_GOALColl) {
			obj_GOALColl.goal = true;
		}
	}
	
	if keyboard_check_pressed(vk_ralt) {
		room_goto(rm_FreeplayNew);
	}
	
	if keyboard_check_pressed(vk_rshift) {
		room_goto(rm_LeaderboardTest);
	}
	
	if keyboard_check_pressed(ord("8")) {
		room_goto(rm_CharSelectNew);
	}
}

if keyboard_check_pressed(ord("7")) {
	if !global.DEBUG {
		global.DEBUG = true;
	} else {
		global.DEBUG = false;
	}
}