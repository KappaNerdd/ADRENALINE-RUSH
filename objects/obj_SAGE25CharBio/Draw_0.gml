draw_self();

var _width = 700;

if image_xscale == 16 {
	_width = 700;
} else if image_xscale = 12 {
	_width = 500;
} else if image_xscale == 9 {
	_width = 370;
} else if image_xscale == 14 {
	_width = 600;
}

draw_text_ext_transformed(x + 8, y + 4, string(bio), -1, _width, 0.70, 1, 0);