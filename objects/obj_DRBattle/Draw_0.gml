var _camX = camera_get_view_x(view_camera[0]) + 250;
var _camY = camera_get_view_y(view_camera[0]) - 260;

if makeBG {
	draw_sprite_ext(sprite_index, image_index, _camX, _camY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	draw_sprite_ext(spr_DRBattleBG2, image_index, _camX, _camY, image_xscale, image_yscale, image_angle, image_blend, image_alpha / 2);
	draw_sprite_ext(spr_Pixel, 0, _camX - 250, _camY + 260, 256, 144, 0, c_black, image_alpha / 2);
}