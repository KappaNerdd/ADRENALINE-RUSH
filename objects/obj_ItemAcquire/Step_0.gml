getCharacterControls();

if !transed {
	if instance_exists(obj_Player) {
		if obj_Player.can_Move {
			obj_Player.can_Move = false;
		}
	}

	if !instance_exists(obj_Textbox) {
		if !sounded {
			sounded = true;
			obj_SFXManager.UNDERTALEBombFly = true;
		}
		
		yPos = lerp(yPos, 216, 0.1);
		image_alpha = lerp(image_alpha, 0.2, 0.1);
		
		if jump_Key {
			transed = true;
			obj_SFXManager.homingLockOn = true;
		}
	}
} else {
	yPos = lerp(yPos, 700, 0.1);
	image_alpha = lerp(image_alpha, 0, 0.1);
	
	if image_alpha <= 0.01 {
		instance_destroy();
		obj_Player.can_Move = true;
	}
}