draw_self();

var _bgCol = make_color_rgb(obj_FileSelectSideBar.localR, obj_FileSelectSideBar.localG, obj_FileSelectSideBar.localB);

draw_set_halign(fa_center);

	draw_text_color(x, y - 180, scr_LocalText("fs_FileSelect"), c_white, c_white, _bgCol, _bgCol, 1);
	
draw_set_halign(fa_left);


var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

var _selectText = scr_LocalText("fs_Select");
var _cancelText = scr_LocalText("fs_Back");

if global.copyFile && !global.copyingFile {
	_selectText = scr_LocalText("fs_Copy");
	_cancelText = scr_LocalText("fs_Back");
} else if global.copyFile && global.copyingFile {
	_selectText = scr_LocalText("fs_Confirm");
	_cancelText = scr_LocalText("fs_Cancel");
}

if global.deleteFile && !global.deletingFile {
	_selectText = scr_LocalText("fs_Delete");
	_cancelText = scr_LocalText("fs_Back");
} else if global.deleteFile && global.deletingFile {
	_selectText = scr_LocalText("fs_Confirm");
	_cancelText = scr_LocalText("fs_Cancel");
}

draw_text_transformed(_camX + 5, _camY + 330, string(_selectText), 0.5, 1, 0);
draw_sprite_ext(obj_CustomJumpKeySpeed.sprite_index, obj_CustomJumpKeySpeed.image_index, _camX + 40, _camY + 340, 1, 1, 0, c_white, 1);

if global.deleteFile or global.copyFile {
	draw_text_transformed(_camX + 110, _camY + 330, string(_cancelText), 0.5, 1, 0);
	draw_sprite_ext(obj_CustomAct1KeySpeed.sprite_index, obj_CustomAct1KeySpeed.image_index, _camX + 135, _camY + 340, 1, 1, 0, c_white, 1);
}

