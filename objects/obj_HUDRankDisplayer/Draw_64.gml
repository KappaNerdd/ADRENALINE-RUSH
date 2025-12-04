display_set_gui_size(640, 360);

var _level = global.speedStageData[global.SpeedSelected];

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

var _playX = 0;
var _playY = 0;

if instance_exists(obj_Player) {
	_playX = obj_Player.x;
	_playY = obj_Player.y;
}

var _relX = _playX - _camX;
var _relY = _playY - _camY;

if _relY <= 100 {
	image_alpha = lerp(image_alpha, 0.25, 0.25);
} else {
	image_alpha = lerp(image_alpha, 1, 0.25);
}

if _level.complete {	
	draw_sprite_ext(sprite_index, image_index, 307, moveY + 3, image_xscale, image_yscale, 0, c_black, image_alpha);
	draw_sprite_ext(rankGraphic2, image_index, 292, moveY + 33, image_xscale, image_yscale, 0, c_black, image_alpha);
	
	draw_sprite_ext(sprite_index, image_index, 310, moveY, image_xscale, image_yscale, 0, c_white, image_alpha);
	draw_sprite_ext(rankGraphic2, image_index, 295, moveY + 30, image_xscale, image_yscale, 0, c_white, image_alpha);
}