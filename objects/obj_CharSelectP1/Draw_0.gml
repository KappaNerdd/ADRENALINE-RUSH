draw_self();

var _butAlpha = 1;

if global.CostumeNum != 1 && !global.PlayerSelection[global.SelectedPlayer][2] {
	draw_sprite_ext(obj_CustomAct1KeySpeed.sprite_index, obj_CustomAct1KeySpeed.image_index, x + 80, y + 25, 1, 1, 0, c_white, _butAlpha);
}

draw_sprite_ext(spr_Player1, 3, x + 25, y - 25, 0.5, 0.5, 0, image_blend, pAlpha);