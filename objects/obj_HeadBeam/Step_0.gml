if instance_exists(obj_Player) && obj_GOALColl.goal == false {
	if x > obj_Player.x {
		x -= vel;
	} else if x < obj_Player.x {
		x += vel * 3;
	}
}


if place_meeting(x, y, obj_Player) {
	if !obj_Player.playerHurt && !obj_Player.invincible {
		global.Health -= global.MaxHealth / 4;
		obj_Player.playerHurt = true;
		obj_Player.vel = -15;
		obj_Player.yspd = -6;
		obj_SFXManager.playerHurt = true;
	}
}


if distance_to_object(obj_Player) < 800 && obj_GOALColl.goal == false {
	obj_SFXManager.UndertaleRainbowLoop = true;
	
	scr_ScreenShake();
	scr_ControllerRumble();
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