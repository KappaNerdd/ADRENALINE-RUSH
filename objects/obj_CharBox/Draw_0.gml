if !global.SimplifyVFX {
	spinBall = obj_FreeplayBlockSpeed.scrollY;
}

draw_sprite_ext(sprite_index, image_index, x, y - 50, image_xscale, image_yscale, 0, image_blend, 1);
draw_sprite_ext(spr_CharSelectRushBossBall, 0, x + 700, y + 320, 1.5, 1.5, -spinBall, global.fullRGB, 1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
	draw_text_transformed_color(x + 680, y + 320, string(stageName), 1.5, 1.5, 0, c_white, c_white, global.fullRGB, global.fullRGB, 1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);