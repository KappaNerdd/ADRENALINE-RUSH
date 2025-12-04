depth = -22;

xChange = -300;


if !file_exists(string(global.PastMindDataFile) + ".sav") {
	instance_destroy();
}