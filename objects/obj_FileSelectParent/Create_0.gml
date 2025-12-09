//Create Borders
instance_create_depth(camera_get_view_x(view_camera[0]) - 16, camera_get_view_y(view_camera[0]) - 40, depth, obj_BorderV);
instance_create_depth(camera_get_view_x(view_camera[0]) + 640, camera_get_view_y(view_camera[0]) - 40, depth, obj_BorderV);
instance_create_depth(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) - 16, depth, obj_BorderH);
instance_create_depth(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 360, depth, obj_BorderH);



///-----Create Files Data-----///

//File 1
with(instance_create_depth(x, y, depth, obj_FileSelectBox)) {
	movedX = 0;
	movedY = 0;
	
	var _dir = working_directory + "/saves/1/";

	if file_exists(_dir + string(global.MainDataFile) + "1.sav") {
		player = global.file1.player_Char;
		playerCostume = global.file1.player_Costume;
		playerSprite = global.file1.player_Sprite;
		textboxSpr = global.file1.textbox_Spr;
		
		partner = global.file1.partner_Char;
		partner2 = global.file1.partner2_Char;

		playerName = global.file1.player_Name;
		seconds = global.file1.player_TimeSeconds;
		minutes = global.file1.player_TimeMinutes;
		hours = global.file1.player_TimeHours;
		playHealth = global.file1.player_Health;
		playExtraLives = global.file1.player_ExtraLives;

		savRM = global.file1.save_rm;
	}
	
	fileNum = 1;
}


//File 2
with(instance_create_depth(x, y, depth, obj_FileSelectBox)) {
	movedX = 37;
	movedY = 80;
	
	var _dir = working_directory + "/saves/2/";

	if file_exists(_dir + string(global.MainDataFile) + "2.sav") {
		player = global.file2.player_Char;
		playerCostume = global.file2.player_Costume;
		playerSprite = global.file2.player_Sprite;
		textboxSpr = global.file2.textbox_Spr;
		
		partner = global.file2.partner_Char;
		partner2 = global.file2.partner2_Char;

		playerName = global.file2.player_Name;
		seconds = global.file2.player_TimeSeconds;
		minutes = global.file2.player_TimeMinutes;
		hours = global.file2.player_TimeHours;
		playHealth = global.file2.player_Health;
		playExtraLives = global.file2.player_ExtraLives;

		savRM = global.file2.save_rm;
	}
	
	fileNum = 2;
}


//File 3
with(instance_create_depth(x, y, depth, obj_FileSelectBox)) {
	movedX = 74;
	movedY = 160;
	
	var _dir = working_directory + "/saves/3/";

	if file_exists(_dir + string(global.MainDataFile) + "3.sav") {
		player = global.file3.player_Char;
		playerCostume = global.file3.player_Costume;
		playerSprite = global.file3.player_Sprite;
		textboxSpr = global.file3.textbox_Spr;
		
		partner = global.file3.partner_Char;
		partner2 = global.file3.partner2_Char;

		playerName = global.file3.player_Name;
		seconds = global.file3.player_TimeSeconds;
		minutes = global.file3.player_TimeMinutes;
		hours = global.file3.player_TimeHours;
		playHealth = global.file3.player_Health;
		playExtraLives = global.file3.player_ExtraLives;

		savRM = global.file3.save_rm;
	}	
	
	fileNum = 3;
}


//File 4
with(instance_create_depth(x, y, depth, obj_FileSelectBox)) {
	movedX = 111;
	movedY = 240;
	
	var _dir = working_directory + "/saves/4/";

	if file_exists(_dir + string(global.MainDataFile) + "4.sav") {
		player = global.file4.player_Char;
		playerCostume = global.file4.player_Costume;
		playerSprite = global.file4.player_Sprite;
		textboxSpr = global.file4.textbox_Spr;
		
		partner = global.file4.partner_Char;
		partner2 = global.file4.partner2_Char;

		playerName = global.file4.player_Name;
		seconds = global.file4.player_TimeSeconds;
		minutes = global.file4.player_TimeMinutes;
		hours = global.file4.player_TimeHours;
		playHealth = global.file4.player_Health;
		playExtraLives = global.file4.player_ExtraLives;

		savRM = global.file4.save_rm;
	}
	
	fileNum = 4;
}


//File 5
with(instance_create_depth(x, y, depth, obj_FileSelectBox)) {
	movedX = 148;
	movedY = 320;
	
	var _dir = working_directory + "/saves/5/";

	if file_exists(_dir + string(global.MainDataFile) + "5.sav") {
		player = global.file5.player_Char;
		playerCostume = global.file5.player_Costume;
		playerSprite = global.file5.player_Sprite;
		textboxSpr = global.file5.textbox_Spr;
		
		partner = global.file5.partner_Char;
		partner2 = global.file5.partner2_Char;

		playerName = global.file5.player_Name;
		seconds = global.file5.player_TimeSeconds;
		minutes = global.file5.player_TimeMinutes;
		hours = global.file5.player_TimeHours;
		playHealth = global.file5.player_Health;
		playExtraLives = global.file5.player_ExtraLives;

		savRM = global.file5.save_rm;
	}
	
	fileNum = 5;
}


//File 6
with(instance_create_depth(x, y, depth, obj_FileSelectBox)) {
	movedX = 185;
	movedY = 400;
	
	var _dir = working_directory + "/saves/6/";

	if file_exists(_dir + string(global.MainDataFile) + "6.sav") {
		player = global.file6.player_Char;
		playerCostume = global.file6.player_Costume;
		playerSprite = global.file6.player_Sprite;
		textboxSpr = global.file6.textbox_Spr;
		
		partner = global.file6.partner_Char;
		partner2 = global.file6.partner2_Char;

		playerName = global.file6.player_Name;
		seconds = global.file6.player_TimeSeconds;
		minutes = global.file6.player_TimeMinutes;
		hours = global.file6.player_TimeHours;
		playHealth = global.file6.player_Health;
		playExtraLives = global.file6.player_ExtraLives;

		savRM = global.file6.save_rm;
	}
	
	fileNum = 6;
}


//File 7
with(instance_create_depth(x, y, depth, obj_FileSelectBox)) {
	movedX = 222;
	movedY = 480;
	
	var _dir = working_directory + "/saves/7/";

	if file_exists(_dir + string(global.MainDataFile) + "7.sav") {
		player = global.file7.player_Char;
		playerCostume = global.file7.player_Costume;
		playerSprite = global.file7.player_Sprite;
		textboxSpr = global.file7.textbox_Spr;
		
		partner = global.file7.partner_Char;
		partner2 = global.file7.partner2_Char;

		playerName = global.file7.player_Name;
		seconds = global.file7.player_TimeSeconds;
		minutes = global.file7.player_TimeMinutes;
		hours = global.file7.player_TimeHours;
		playHealth = global.file7.player_Health;
		playExtraLives = global.file7.player_ExtraLives;

		savRM = global.file7.save_rm;
	}
	
	fileNum = 7;
}