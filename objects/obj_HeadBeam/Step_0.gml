var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

if instance_exists(obj_Player) {
	if x < obj_Player.x {
		vel = -16;
	}
}

if !stopped {
	x -= vel;
}

vel = scr_Approach(vel, 8, 0.1);

if place_meeting(x, y, obj_Player) {
	if !obj_Player.playerHurt && !obj_Player.invincible {
		obj_Player.vel = -15;
		obj_SFXManager.playerHurt = true;
		vel = -16;
		
		with(obj_Player) {
			scr_HurtPlayer(250000, 0, false, -6, true, 20, true);
		}
	}
}


if distance_to_point(_camX, _camY) < global.CamSafeArea && !stopped {
	obj_SFXManager.UndertaleRainbowLoop = true;
	
	scr_ScreenShake();
	scr_ControllerRumble();
}


if forth {
	image_xscale += 0.075;
	
	if image_xscale >= 5 {
		forth = false;
		back = true;
	}
} else {
	image_xscale -= 0.075;
	
	if image_xscale <= 4.50 {
		forth = true;
		back = false;
	}
}