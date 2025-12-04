if splashConfirm == false {
	draw_text(x + 100, y - 12, "           DISCLAIMER \n-----------------------------");

	draw_set_halign(fa_center);
		draw_text(320, y + 100, "This game may contain serious topics and foul language. \nIt is currently in its prototype phase and things \nseen now might not stay in future updates. \nWith it being a prototype, this game is also FREE! \nIf you paid for it, then you got FINESSED!");
	draw_set_halign(fa_left);
	
	draw_sprite_ext(sprite_index, image_index, x + 390, y + 15, 1, 1, 0, c_white, 1);
	draw_text(x + 450, y + 2, ": Continue")
} else {
	draw_text(x + 50, y + 130, "This game contains flashin' lights. \n(For ease on the eyes, look in the Options menu.) \nXbox controller EXTREMELY recommended. \n(Switch & PS controllers are sorta \nbroken at the moment.)");
}