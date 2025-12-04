depth = -21;

if global.SimplifyVFX {
	image_speed = 0;
}

if !file_exists(string(global.PastMindDataFile) + ".sav") {
	sprite_index = spr_SonicRush_Spikes_Head;
	image_blend = c_white;
}