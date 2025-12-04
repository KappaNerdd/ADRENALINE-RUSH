if forth == true {
	image_xscale += 0.075;
	
	if image_xscale >= 7 {
		forth = false;
		back = true;
	}
} else if back == true {
	image_xscale -= 0.075;
	
	if image_xscale <= 6.50 {
		forth = true;
		back = false;
	}
}


if distance_to_object(obj_Player) < 750 {
	obj_SFXManager.UndertaleRainbowLoop = true;
	
	scr_ScreenShake();
	scr_ControllerRumble();
}