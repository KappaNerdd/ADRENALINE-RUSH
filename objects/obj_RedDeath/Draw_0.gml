var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _sprite = global.PlayerID.sprite_index;

with(global.PlayerID) {
	if leftFacer {
		if face_Left {
			_sprite = sprSpiralLeft;
		} else {
			_sprite = sprSpiralRight;
		}
	} else {
		_sprite = sprSpiral;
	}
}

draw_sprite_ext(spr_WhiteTrans, 0, _camX, _camY, 24, 13.5, 0, global.fullRGB, image_alpha);
draw_sprite_ext(_sprite, 0, playX, playY, global.PlayerID.visXScale, global.PlayerID.image_yscale, 0, c_black, image_alpha);
