draw_self();

var _start = "AUDIO";

var _xscale = 1;
var _yscale = 1;

if global.TitleSettings == 0 {
	_start = scr_LocalText("opt_Audio");
}

if global.TitleSettings == 1 {
	_start = scr_LocalText("opt_Visual");
}

if global.TitleSettings == 2 {
	_start = scr_LocalText("opt_Misc");
}

if global.TitleSettings == 3 {
	_start = scr_LocalText("opt_ConSpeed1");
}

if global.TitleSettings == 4 {
	_start = scr_LocalText("opt_ConSpeed2");
}

if global.TitleSettings == 5 {
	_start = scr_LocalText("opt_ConAction1");
}

if global.TitleSettings == 6 {
	_start = scr_LocalText("opt_ConAction2");
}


if string_length(_start) > 18 {
	_xscale = 0.75;
}

draw_text_transformed(x + 8, y + 4, string(_start), _xscale, _yscale, 0);