var _bgCol = c_black;

if !file_exists(string(global.PastMindDataFile) + ".sav") {
	_bgCol = c_black;
} else {
	_bgCol = make_color_rgb(obj_FileSelectSideBar.localR, obj_FileSelectSideBar.localG, obj_FileSelectSideBar.localB);
}


draw_sprite_ext(sprite_index, image_index, x, y, 10, 10, 0, _bgCol, 0.25);
