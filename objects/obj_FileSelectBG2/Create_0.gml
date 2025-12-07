depth = -21;

yChange = 300;

var _dir = working_directory + "/saves/";

if !file_exists(_dir + string(global.PastMindDataFile) + ".sav") {
	instance_destroy();
}