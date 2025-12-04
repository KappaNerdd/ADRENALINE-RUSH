getCharacterControls();

if global.CurOpt != "Main" && global.CurOpt != "Options" && global.CurOpt != "Audio" && global.CurOpt != "Visual" && global.CurOpt != "Misc" && global.CurOpt != "ControlsSpeed1" && global.CurOpt != "ControlsSpeed2" {
	if instance_exists(obj_NewPauseMenu) {
		if obj_NewPauseMenu.active {
			if place_meeting(x, y, obj_PauseCursor) {

				if jump_Key {
					obj_SFXManager.menuPop = true;
					global.CurOpt = "Main";
				}
	
				image_blend = global.fullRGB;
		
				if x < camera_get_view_x(view_camera[0]) - 10 {
					x += xspd;
				}
			} else {
				if action_Key {
					obj_SFXManager.menuPop = true;
					global.CurOpt = "Main";
				}
				
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