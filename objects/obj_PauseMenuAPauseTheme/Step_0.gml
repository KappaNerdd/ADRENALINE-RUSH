getCharacterControls();

audioBullshit = global.UniquePauseTheme;


if global.CurOpt == "Audio" {
	if instance_exists(obj_NewPauseMenu) {
		if obj_NewPauseMenu.active {
			if place_meeting(x, y, obj_PauseCursor) {
				if jump_Key {
					obj_SFXManager.menuPop = true;
					
					if global.UniquePauseTheme {
						global.UniquePauseTheme = false;
					} else {
						global.UniquePauseTheme = true;
					}
				}
	
				image_blend = global.fullRGB;
		
				if x < camera_get_view_x(view_camera[0]) - 10 {
					x += xspd;
				}
			} else {
				image_blend = c_white;
		
				if x < camera_get_view_x(view_camera[0]) - 30 {
					x += xspd;
				} else if x > camera_get_view_x(view_camera[0]) - 30 {
					x -= xspd;
				}
			}
		} else {
			x -= xspd;
		}
	}
} else {
	if x > camera_get_view_x(view_camera[0]) - 300 {
		x -= xspd;
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