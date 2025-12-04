if file_exists("TBAHSSaveData" + string(global.saveFile) + ".sav") {
	draw_text(x, y, "         Will you continue? \n(Your last save will be loaded.)");
} else {
	draw_text(x, y, "         (No save detected) \nWould you like to start a new game?")
}