display_set_gui_size(768, 432);

var _charSpr = global.PlayerSelection[shownChar + 1][6][0];
var _charIndex = sprite_get_number(_charSpr);
var _charCol = make_colour_rgb(r, g, b);

if boxIndex < _charIndex {
	boxIndex += 1 / 6;
} else {
	boxIndex = 0;
}

draw_sprite_ext(sprite_index, image_index, 0, 0, 15, 15, 0, _charCol, 0.5);

draw_sprite_ext(spr_TextboxHead, 0, 212 - 3, (50 + 3) / 2, 11, 12, 0, c_black, 1);
draw_sprite_ext(spr_TextboxHead, 0, 212, 50 / 2, 11, 12, 0, c_white, 1);
draw_sprite_ext(_charSpr, boxIndex, 212, 50 / 2, 11, 12, 0, c_grey, charAlpha);

draw_sprite_ext(spr_TextboxTrans, 0, 212, 50 / 2, 11, 12, 0, c_white, 1);

draw_sprite_ext(chars[shownChar][0], 0, 202 + charX, 80, 0.5, 0.5, 0, c_white, charAlpha);

draw_set_halign(fa_middle);
draw_set_valign(fa_center);
	draw_text_transformed_color(384 - 3, 420 + 3, scr_LocalText("PLACEHOLDER ART"), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(384, 420, scr_LocalText("PLACEHOLDER ART"), 1, 1, 0, c_white, c_white, c_white, c_white, 1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

for(var i = 0; i < array_length(charStat); i++) {
	var _charStat = chars[shownChar][1];
	
	if i == 1 {
		_charStat = chars[shownChar][2];
	}
	
	if i == 2 {
		_charStat = scr_LocalText(chars[shownChar][3]) + " " + string(chars[shownChar][4]);
	}
	
	var _gap = 25;
	
	draw_text_transformed_color(220 - 3, 29 + (_gap * i) + 3, scr_LocalText(charStat[i]) + ": " + scr_LocalText(string(_charStat)), 1, 1, 0, c_black, c_black, c_black, c_black, charAlpha);
	draw_text_transformed_color(220, 29 + (_gap * i), scr_LocalText(charStat[i]) + ": " + scr_LocalText(string(_charStat)), 1, 1, 0, c_white, c_white, c_white, c_white, charAlpha);
}

draw_sprite_ext(spr_SonicRushSpikesNorm, srSpikesIndex, 0, 0, 1, 12, 0, _charCol, 1);
draw_sprite_ext(spr_SonicRushSpikesNorm, 20 - srSpikesIndex, 768, 0, -1, 12, 0, _charCol, 1);

draw_sprite_ext(global.ConSpr, global.ConS_L, 150, 216, 1, 1, 0, c_white, 1);
draw_sprite_ext(global.ConSpr, global.ConS_R, 560, 216, 1, 1, 0, c_white, 1);

draw_set_halign(fa_middle);
	draw_sprite_ext(spr_TextboxULTRAKILL, 0, 384, 217, 13, bioBoxScale, 0, c_white, 0.75);
	draw_text_ext_transformed_color(384, 4, scr_LocalText(chars[shownChar][5]), 24, 1000, 0.75, 0.75, 0, c_white, c_white, c_white, c_white, charAlpha * bioAlpha);
draw_set_halign(fa_left);

draw_sprite_ext(global.ConSpr, global.ConS_A1, 10, 400, 1, 1, 0, c_white, 1);

if !checkBio {
	draw_sprite_ext(global.ConSpr, global.ConS_B, 540, 400, 1, 1, 0, c_white, 1);
}

draw_set_valign(fa_center);
	draw_text(70, 400, scr_LocalText("fs_Back"));
	
	if !checkBio {
		draw_text(610, 400, scr_LocalText("bio_Broly"));
	}
draw_set_valign(fa_top);
