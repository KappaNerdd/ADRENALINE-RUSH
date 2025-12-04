depth = -110;

image_yscale = 0.4;


if !file_exists(string(global.PastMindDataFile) + ".sav") {
	sprite_index = spr_FileSelectUIHead;
}