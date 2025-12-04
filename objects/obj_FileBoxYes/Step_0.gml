getCharacterControls();

confirm_Key = jump_Key;
cancel_Key = action_Key;

left_Key = left_Key_Once;
right_Key = right_Key_Once;


if hovered == true {
	sprCol = c_white;
} else {
	sprCol = c_grey;
}

if hovered == true && visible == true && right_Key {
	hovered = false;
	obj_FileBoxNo.hovered = true;
	
	obj_SFXManager.menuTap = true;
}


if hovered == true && confirmed == false && confirm_Key {
	visible = false
	obj_FileBoxNo.visible = false;
	confirmed = true;
	
	//Delete overall data
	if file_exists(string(global.MainDataFile) + string(global.saveFile) + ".sav") {
		file_delete(string(global.MainDataFile) + string(global.saveFile) + ".sav");
	}
	
	//Delete saved rank data
	if file_exists(string(global.SpeedDataFile) + string(global.saveFile) + ".sav") {
		file_delete(string(global.SpeedDataFile) + string(global.saveFile) + ".sav");
	}
	
	//Delete saved rank data
	if file_exists(string(global.ActionDataFile) + string(global.saveFile) + ".sav") {
		file_delete(string(global.ActionDataFile) + string(global.saveFile) + ".sav");
	}
	
	//Delete save file array
	if global.saveFile == 1 {
		global.file1.player_Char = -1;
		global.file1.partner_Char = -1;
		global.file1.partner2_Char = -1;
	
		global.file1.player_Name = "EMPTY";
		global.file1.player_TimeSeconds = 0;
		global.file1.player_TimeMinutes = 0;
		global.file1.player_TimeHours = 0;
		global.file1.player_Health = 0;
		global.file1.player_ExtraLives = 0;
	
		global.file1.save_rm = "EMPTY";
	}
	
	if global.saveFile == 2 {
		global.file2.player_Char = -1;
		global.file2.partner_Char = -1;
		global.file2.partner2_Char = -1;
	
		global.file2.player_Name = "EMPTY";
		global.file2.player_TimeSeconds = 0;
		global.file2.player_TimeMinutes = 0;
		global.file2.player_TimeHours = 0;
		global.file2.player_Health = 0;
		global.file2.player_ExtraLives = 0;
	
		global.file2.save_rm = "EMPTY";
	}
	
	if global.saveFile == 3 {
		global.file3.player_Char = -1;
		global.file3.partner_Char = -1;
		global.file3.partner2_Char = -1;
	
		global.file3.player_Name = "EMPTY";
		global.file3.player_TimeSeconds = 0;
		global.file3.player_TimeMinutes = 0;
		global.file3.player_TimeHours = 0;
		global.file3.player_Health = 0;
		global.file3.player_ExtraLives = 0;
	
		global.file3.save_rm = "EMPTY";
	}
	
	if global.saveFile == 4 {
		global.file4.player_Char = -1;
		global.file4.partner_Char = -1;
		global.file4.partner2_Char = -1;
	
		global.file4.player_Name = "EMPTY";
		global.file4.player_TimeSeconds = 0;
		global.file4.player_TimeMinutes = 0;
		global.file4.player_TimeHours = 0;
		global.file4.player_Health = 0;
		global.file4.player_ExtraLives = 0;
	
		global.file4.save_rm = "EMPTY";
	}
	
	if global.saveFile == 5 {
		global.file5.player_Char = -1;
		global.file5.partner_Char = -1;
		global.file5.partner2_Char = -1;
	
		global.file5.player_Name = "EMPTY";
		global.file5.player_TimeSeconds = 0;
		global.file5.player_TimeMinutes = 0;
		global.file5.player_TimeHours = 0;
		global.file5.player_Health = 0;
		global.file5.player_ExtraLives = 0;
	
		global.file5.save_rm = "EMPTY";
	}
	
	if global.saveFile == 6 {
		global.file6.player_Char = -1;
		global.file6.partner_Char = -1;
		global.file6.partner2_Char = -1;
	
		global.file6.player_Name = "EMPTY";
		global.file6.player_TimeSeconds = 0;
		global.file6.player_TimeMinutes = 0;
		global.file6.player_TimeHours = 0;
		global.file6.player_Health = 0;
		global.file6.player_ExtraLives = 0;
	
		global.file6.save_rm = "EMPTY";
	}
	
	if global.saveFile == 7 {
		global.file7.player_Char = -1;
		global.file7.partner_Char = -1;
		global.file7.partner2_Char = -1;
	
		global.file7.player_Name = "EMPTY";
		global.file7.player_TimeSeconds = 0;
		global.file7.player_TimeMinutes = 0;
		global.file7.player_TimeHours = 0;
		global.file7.player_Health = 0;
		global.file7.player_ExtraLives = 0;
	
		global.file7.save_rm = "EMPTY";
	}
}

if !instance_exists(obj_FileBoxChecker) {
	instance_destroy();
}