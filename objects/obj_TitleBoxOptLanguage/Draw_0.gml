draw_self();

var _start = scr_LocalText("opt_Lang");

var _xscale = 1;

draw_text(x + 8, y + 4, string(_start));

draw_set_halign(fa_right);
	var _language = scr_LocalText("I might swerve-");
	
	if string_length(_language) > 13 {
		_xscale = 0.75;
	}

	draw_text_transformed(x - 4, y + 4, string(_language), _xscale, 1, 0);
draw_set_halign(fa_left);