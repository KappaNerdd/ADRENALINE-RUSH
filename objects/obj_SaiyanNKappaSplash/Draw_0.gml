draw_self();

if xspd <= 0 {
	draw_sprite_ext(spr_KappaNerdSplash, 0, x - 200, y, 0.5, 0.5, 0, c_white, splashAlpha);
	
	draw_sprite_ext(spr_AndSplash, 0, x - 200, y + 55, 0.5, 0.5, 0, c_white, splashAlpha);
	
	draw_sprite_ext(spr_SaiyanNameSplash, 0, x - 200, y + 110, 0.5, 0.5, 0, c_white, splashAlpha);
}