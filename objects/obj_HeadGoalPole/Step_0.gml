if instance_exists(obj_Player) {	
	if place_meeting(x, y, obj_Player) && obj_Player.vel >= 5 && playerTouched == false {
		spinSpeed = obj_Player.vel * 2;
		
		vel = obj_Player.vel - 3;
		
		obj_SFXManager.UndertaleBomb = true;
		
		playerTouched = true;
	}
}


if global.SimplifyVFX == false {
	if playerTouched == false {
		if !instance_exists(obj_ObjectGlow) {
			with (instance_create_depth(x, y, depth, obj_ObjectGlow)) {
				x = other.x;
				y = other.y;
				depth = other.depth - 1;
				sprite_index = other.sprite_index;
				image_index = other.image_index;
			}
		}
	}
}



if playerTouched == true {
	image_angle += spinSpeed;
	image_xscale += scaleSpeed;
	image_yscale += scaleSpeed;
	
	yspd += grav;
	
	x += vel;
	y += yspd;
	
	
	if kysTimer > 0 {
		kysTimer -= 1;
	}
}


if kysTimer <= 0 {
	if image_alpha > 0 {
		image_alpha -= 0.01;
	}
	
	if image_alpha <= 0 {
		instance_destroy();
	}
}