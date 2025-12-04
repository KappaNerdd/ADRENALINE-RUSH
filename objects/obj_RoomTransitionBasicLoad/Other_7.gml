image_speed = -1;

if file_exists(string(global.MainDataFile) + string(global.saveFile) + ".sav") {
	load_game(global.saveFile);
}