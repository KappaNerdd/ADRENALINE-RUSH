var _col = c_fuchsia;

if global.MIND or global.PlayerChar == 0 {
	_col = c_white;
}

draw_set_halign(fa_middle);
draw_set_valign(fa_bottom);
	draw_text_transformed_color(x, y, "+" + scr_LocalText("enviro_MusSecret"), image_xscale, image_yscale, 0, _col, _col, _col, _col, image_alpha);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


if y > setY {
	if !bounce {
		bounce = true;
	}
}


if image_alpha <= 0 {
	instance_destroy();
}

if !bounce {
	x -= 0.5;
	
	yspd += 0.1;
	y += yspd;
} else {
	if doneTimer > 0 {
		doneTimer--;
	} else {
		image_alpha -= 0.05;
		image_yscale += 0.05;
	}
}


