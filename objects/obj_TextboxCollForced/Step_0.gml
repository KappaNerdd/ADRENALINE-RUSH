if !instance_exists(obj_Player) {
	exit;
}


if instance_exists(obj_Player) && place_meeting(x, y, obj_Player) && (obj_Player.can_MoveFULL) {
	obj_Player.vel = 0;
	obj_Player.can_Move = false;
}


if instance_exists(obj_Player) && place_meeting(x, y, obj_Player) && obj_Player.can_MoveFULL && obj_Player.ground == true && !instance_exists(obj_Textbox) {
	if textWaitTimer > 0 {
		textWaitTimer -= 1;
	}
	
	if textWaitTimer <= 0 {
		create_textbox(text_id);
		
		if kys == true {
			instance_destroy();
			obj_Player.can_Move = true;
		}
	}
	
	//Player Animation
	with(obj_Player) {
		
		if other.spriteChar == "IDLE" {
			if !leftFacer {
				sprite_index = sprIdle;
			} else {
				if face_Left {
					sprite_index = sprIdleLeft;
				} else {
					sprite_index = sprIdleRight;
				}
			}
		}
		
		image_xscale = other.spriteXscale;
		image_speed = other.spriteSpeed;
	}
}


if global.DEBUG == true {
	visible = true;
} else {
	visible = false;
}