depth = -21;

yChange = 300;


if !file_exists(string(global.PastMindDataFile) + ".sav") {
	instance_destroy();
}