var _instruct = string(obj_CustomSelectKeySpeed.keyText);

if gamepad_is_connected(global.Player1Con) {
	_instruct = string(obj_CustomSelectKeySpeed.keyText);
} else {
	_instruct = "[TAB]";
}


draw_set_halign(fa_center);
	draw_text_color(x, y, "PRESS " + string(_instruct) + " TO CHANGE CHARACTERS", c_white, c_white, c_white, c_white, textAlpha);
draw_set_halign(fa_left);
