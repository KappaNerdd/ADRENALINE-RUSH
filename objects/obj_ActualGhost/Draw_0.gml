if global.Outline {
	scr_Outline();
}

draw_sprite_ext(spr_PlayerCPU, 3, x, y - 40, 0.5, 0.5, 0, c_white, 1);
draw_self();