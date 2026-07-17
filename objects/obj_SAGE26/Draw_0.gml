draw_sprite_ext(spr_SAGE2026BG, 0, 0, 0, 768, 432, 0, c_white, 1);
draw_sprite_tiled_ext(spr_SAGE2026BGText, 0, moveX, moveY, 0.5, 0.5, c_white, changeAlpha);

draw_sprite_ext(spr_SAGE2026Logo, 0, 768 / 2, 432 / 2 + (5 * (changeScale * 2)), changeScale, changeScale, 0, c_black, 0.5);
draw_sprite_ext(spr_SAGE2026Logo, 0, 768 / 2, 432 / 2, changeScale, changeScale, 0, c_white, 1);

gpu_set_scissor(0 + shineX, 0, 96, 64 * 15);
gpu_set_fog(true, c_white, 0, 1);
	draw_sprite_ext(spr_SAGE2026Logo, 0, 768 / 2, 432 / 2, changeScale, changeScale, 0, c_white, 1);
gpu_set_fog(false, c_black, 0, 1);
gpu_set_scissor(0, 0, display_get_width(), display_get_height());

