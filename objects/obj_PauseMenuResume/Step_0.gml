getCharacterControls();

if global.CurOpt == "Main" {
	if instance_exists(obj_NewPauseMenu) {
		if obj_NewPauseMenu.active {
			if place_meeting(x, y, obj_PauseCursor) {
				if jump_Key {
					obj_NewPauseMenu.active = false;
					obj_NewPauseMenu.inactive = true;
					obj_SFXManager.menuPop = true;
	
					instance_destroy(obj_BorderH);
					instance_destroy(obj_BorderV);
					instance_destroy(obj_PauseCursor);
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
	if x > camera_get_view_x(view_camera[0]) - 250 {
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