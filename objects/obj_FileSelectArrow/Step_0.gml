getCharacterControls();

var _bgCol = make_color_rgb(obj_FileSelectSideBar.localR, obj_FileSelectSideBar.localG, obj_FileSelectSideBar.localB);

if !file_exists(string(global.PastMindDataFile) + ".sav") {
	if place_meeting(x, y, obj_TitleCursor) {
		image_blend = c_white;
	
		if jump_Key_Held or device_mouse_check_button(0, mb_left) {
			obj_FileSelectParent.y += maniY;
		
			image_index = 1;
		} else {
			image_index = 0;
		}
	} else {
		image_index = 0;
		image_speed = 0;
		image_blend = c_grey;
	}
} else {
	if place_meeting(x, y, obj_TitleCursor) {
		image_blend = _bgCol;
	
		if jump_Key_Held or device_mouse_check_button(0, mb_left) {
			obj_FileSelectParent.y += maniY;
		
			image_index = 1;
		} else {
			image_index = 0;
		}
	} else {
		image_index = 0;
		image_speed = 0;
		image_blend = c_white;
	}
}