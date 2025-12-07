depth = -21;

if global.SimplifyVFX {
	image_speed = 0;
}

var _dir = working_directory + "/saves/";

if !file_exists(_dir + string(global.PastMindDataFile) + ".sav") {
	sprite_index = spr_SonicRush_Spikes_Head;
	image_blend = c_white;
}