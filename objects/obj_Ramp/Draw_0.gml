draw_self();

if global.DEBUG {
	draw_text(x, y, string(launchConfirmed));
	draw_text(x, y + 20, string(launchTimer));
}