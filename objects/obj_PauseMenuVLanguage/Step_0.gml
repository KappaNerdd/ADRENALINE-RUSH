getCharacterControls();

optBullshit = global.Language;



if global.CurOpt == "Visual" {
	if instance_exists(obj_NewPauseMenu) {
		if obj_NewPauseMenu.active {
			if place_meeting(x, y, obj_PauseCursor) {
				if jump_Key {
					obj_SFXManager.menuPop = true;
					
					global.Language += 1;
					
					if global.Language > 2 {
						global.Language = 1;
					}
				}
	
				image_blend = global.fullRGB;
		
				if x < camera_get_view_x(view_camera[0]) {
					x += xspd;
				}
			} else {
				image_blend = c_white;
		
				if x < camera_get_view_x(view_camera[0]) - 20 {
					x += xspd;
				} else if x > camera_get_view_x(view_camera[0]) - 20 {
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