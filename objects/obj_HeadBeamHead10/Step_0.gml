if instance_exists(obj_Player) && !stop && !global.Death && !instance_exists(obj_CutsceneParent) {
	if x > obj_Player.x {
		x -= vel;
	} else if x < obj_Player.x {
		x += vel * 3;
	}
}

if distance_to_object(obj_Player) < 750 {
	obj_SFXManager.UndertaleRainbowLoop = true;
	
	scr_ControllerRumble();
}

scr_ScreenShake();

if place_meeting(x, y, obj_Player) && !global.Death {
	global.Health -= global.MaxHealth;
	obj_Player.playerHurt = true;
	obj_SFXManager.playerHurt = true;
}

if global.Death && global.DeathCountdown <= 1 {
	x = mainX;
}


if forth == true {
	image_xscale += 0.075;
	
	if image_xscale >= 5 {
		forth = false;
		back = true;
	}
} else if back == true {
	image_xscale -= 0.075;
	
	if image_xscale <= 4.50 {
		forth = true;
		back = false;
	}
}