display_set_gui_size(640, 360);
draw_set_halign(fa_left);
draw_set_font(global.font_main);

var _scale = 0.5;

var _y = 346;

//Player 1
if !global.KeyboardP1 {
	if gamepad_is_connected(global.Player1Con) {
		draw_text_transformed_color(0, _y, "PLAYER 1: " + string(gamepad_get_description(global.Player1Con)) + " CONNECTED", _scale, _scale, 0, c_white, c_white, c_white, c_white, textAlphaP1);
	} else {
		draw_text_transformed_color(0, _y, "PLAYER 1: CONTROLLER UNDETECTED", _scale, _scale, 0, c_white, c_white, c_white, c_white, textAlphaP1);
	}
} else {
	draw_text_transformed_color(0, _y, "PLAYER 1 CONTROLLER UNAVAILABLE", _scale, _scale, 0, c_red, c_red, c_red, c_red, textAlphaP1);
}


/*//Player 2
if gamepad_is_connected(global.Player2Con) {
	draw_text_transformed_color(0, 340, "Player 2: " + string(gamepad_get_description(global.Player2Con)) + " Connected", _scale, _scale, 0, c_white, c_white, c_white, c_white, textAlphaP2);
} else {
	draw_text_transformed_color(0, 340, "Player 2: Controller Disconnected", _scale, _scale, 0, c_white, c_white, c_white, c_white, textAlphaP2);
}


//Player 3
if gamepad_is_connected(global.Player3Con) {
	draw_text_transformed_color(0, 350, "Player 3: " + string(gamepad_get_description(global.Player3Con)) + " Connected", _scale, _scale, 0, c_white, c_white, c_white, c_white, textAlphaP3);
} else {
	draw_text_transformed_color(0, 350, "Player 3: Controller Disconnected", _scale, _scale, 0, c_white, c_white, c_white, c_white, textAlphaP3);
}*/

draw_set_font(global.font_main);
draw_set_halign(fa_left);