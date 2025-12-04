var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

var _scale = 1;

if instance_exists(obj_NewPauseMenu) {
	if obj_NewPauseMenu.active {
		if image_alpha < 1 {
			image_alpha += 0.05;
		}
	} else {
		image_alpha -= 0.1;
	}
}

var _pausedText = "PAUSED";

draw_text_transformed_color(_camX + 335, _camY + 90, string(_pausedText), 2, 2, -55, c_black, c_black, c_black, c_black, image_alpha / 2);
draw_text_transformed_color(_camX + 330, _camY + 85, string(_pausedText), 2, 2, -55, c_white, c_white, global.fullRGB, global.fullRGB, image_alpha);

//Confirm
//draw_text_transformed_color(_camX + 170, _camY + 330, "CONFIRM: ", _scale, _scale, 0, c_white, c_white, c_white, global.fullRGB, 1);
//draw_sprite_ext(obj_CustomJumpKeySpeed.sprite_index, obj_CustomJumpKeySpeed.image_index, _camX + 260, _camY + 340, 1, 1, 0, c_white, 1);

//Quick-Restart
if instance_exists(obj_PauseMenuRestart) {
	draw_text_transformed_color(_camX + 270, _camY + 390, "QUICK-RESTART: ", _scale, _scale, 0, c_white, c_white, c_white, global.fullRGB, image_alpha);
	
	if gamepad_is_connected(global.Player1Con) {
		draw_sprite_ext(obj_CustomSelectKeySpeed.sprite_index, obj_CustomSelectKeySpeed.image_index, _camX + 430, _camY + 400, 1, 1, 0, c_white, image_alpha);
	} else {
		draw_sprite_ext(obj_CustomSelectKeySpeed.sprite_index, 60, _camX + 430, _camY + 400, 1, 1, 0, c_white, image_alpha);
	}
}


if !instance_exists(obj_NewPauseMenu) {
	instance_destroy();
}