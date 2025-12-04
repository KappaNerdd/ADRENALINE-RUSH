var _pul = pullyBase.y - 38;

if distance_to_object(obj_Player) < 800 {
	draw_set_color(c_black);
		draw_line_width(x - 1, y - 1, x - 1, _pul, 2);
	draw_set_color(c_white);

	scr_Outline();

	draw_self();
}

