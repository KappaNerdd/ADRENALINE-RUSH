getCharacterControls();
scr_ChangeControlSprites();
scr_SetControl();

if global.CurOpt == "ControlsSpeed2" {
	if instance_exists(obj_NewPauseMenu) {
		if obj_NewPauseMenu.active {
			if place_meeting(x, y, obj_PauseCursor) {
				if jump_Key {
					obj_SFXManager.menuPop = true;
					changeBind = true;
				}
	
				image_blend = global.fullRGB;
		
				if x < camera_get_view_x(view_camera[0]) - 10 {
					x += xspd;
				}
			} else {
				image_blend = c_white;
		
				if x < camera_get_view_x(view_camera[0]) - 40 {
					x += xspd;
				} else if x > camera_get_view_x(view_camera[0]) - 40 {
					x -= xspd;
				}
			}
		} else {
			x -= xspd;
		}
	}
} else {
	if x > camera_get_view_x(view_camera[0]) - 280 {
		x -= xspd;
	}
}

if changeBind {
	if waitTimer <= 1 {
		if !gamepad_is_connected(global.Player1Con) {
			global.Action3KeySpeed = remappedBind;
		} else {
			global.Action3ButtonSpeed = remappedBind;
		}
	}
}


if !instance_exists(obj_PauseMenuBoxParent) {
	instance_destroy();
}

if !global.SimplifyVFX {
	image_speed = 1;
} else {
	image_speed = 0;
}