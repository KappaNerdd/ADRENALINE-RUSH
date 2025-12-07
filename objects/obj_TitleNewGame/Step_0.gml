getCharacterControls();

if !deleting && !cancelled {
	if right_Key_Once && newGameYes {
		obj_SFXManager.homingLockOn = true;
		newGameYes = false;
	} else

	if left_Key_Once && !newGameYes {
		obj_SFXManager.homingLockOn = true;
		newGameYes = true;
	}
	
	if action_Key {
		obj_SFXManager.UNDERTALEBombFly = true;
		cancelled = true;
	}
}


if jump_Key && newGameYes && !deleting {
	obj_SFXManager.menuPop = true;
	deleting = true;
	
	var _dir = working_directory + "/saves/" + string(global.saveFile);
	
	if file_exists(_dir + string(global.MainDataFile) + string(global.saveFile) + ".sav") {
		file_delete(_dir + string(global.MainDataFile) + string(global.saveFile) + ".sav");
	}
	
	//Delete saved rank data
	if file_exists(_dir + string(global.SpeedDataFile) + string(global.saveFile) + ".sav") {
		file_delete(_dir + string(global.SpeedDataFile) + string(global.saveFile) + ".sav");
	}
	
	//Delete saved rank data
	if file_exists(_dir + string(global.ActionDataFile) + string(global.saveFile) + ".sav") {
		file_delete(_dir + string(global.ActionDataFile) + string(global.saveFile) + ".sav");
	}
	
	if file_exists(_dir + string(global.NoMindDataFile) + string(global.saveFile) + ".sav") {
		file_delete(_dir + string(global.NoMindDataFile) + string(global.saveFile) + ".sav");
	}
}

if jump_Key && !newGameYes {
	obj_SFXManager.UNDERTALEBombFly = true;
	cancelled = true;
}

if deleting {
	if deletingTimer > 0 {
		deletingTimer -= 1;
	}
	
	if deletingTimer <= 0 {
		game_restart();
	}
}

if cancelled {
	x -= xspd;
	
	xspd += 0.5;
	
	if xspd > 40 {
		instance_destroy();
		obj_TitleCursor.canMove = true;
		obj_TitleBoxNew.newGame = false;
	}
} else {
	if x < 160 {
		x += xspd;
	}
	
	if x >= 160 {
		x = 160
	}
}