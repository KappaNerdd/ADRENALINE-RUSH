display_set_gui_size(768, 432);

draw_sprite_ext(sprite_index, image_index, 0, 0, 15, 15, 0, make_colour_rgb(r, g, b), 0.5);

draw_sprite_ext(spr_TextboxULTRAKILL, 0, 384, 216, 10, 6, 0, c_white, 0.5);
draw_sprite_ext(creds[credCheck][0], 0, 200, 216, 0.75, 0.75, 0, c_white, 1);

for(var i = 0; i < array_length(credDefault); i++) {
	var _prevCheck = 0;
	
	if i > 0 {
		_prevCheck = 0;
	}
	
	var _gap = 25 + string_length(scr_LocalText(creds[credCheck][_prevCheck]));
	
	draw_text_ext_transformed_color(340, 100 + (_gap * i), scr_LocalText(credDefault[i]) + ": " + scr_LocalText(creds[credCheck][1 + i]), 25, 350, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
}

if extraCheck {
	draw_sprite_ext(spr_Pixel, 0, 0, 0, 384, 216, 0, c_black, 0.5);
	
	for(var i = 0; i < array_length(extraCreds); i++) {
		var _gap = 20;
	
		draw_text_ext_transformed_color(150, 10 + (_gap * i), scr_LocalText(extraCreds[i]), 15, 300, 0.75, 0.75, 0, c_white, c_white, c_white, c_white, 1);
	}
} else {
	draw_sprite_ext(global.ConSpr, global.ConS_L, 5, 216, 1, 1, 0, c_white, 1);
	draw_sprite_ext(global.ConSpr, global.ConS_R, 698, 216, 1, 1, 0, c_white, 1);
	
	draw_sprite_ext(global.ConSpr, global.ConS_B, 140, 400, 1, 1, 0, c_white, 1);
	
	draw_set_valign(fa_center);
		draw_text(210, 400, scr_LocalText("title_Extras"));
	draw_set_valign(fa_top);
}

draw_sprite_ext(global.ConSpr, global.ConS_A1, 10, 400, 1, 1, 0, c_white, 1);

draw_set_valign(fa_center);
	draw_text(80, 400, scr_LocalText("fs_Back"));
draw_set_valign(fa_top);

