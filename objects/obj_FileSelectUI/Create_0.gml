depth = -110;

image_yscale = 0.4;

var _dir = working_directory + "/saves/";

if !file_exists(_dir + string(global.PastMindDataFile) + ".sav") {
	sprite_index = spr_FileSelectUIHead;
}