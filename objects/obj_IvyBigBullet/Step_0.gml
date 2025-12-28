var _dist = point_distance(x, y, obj_Player.x, obj_Player.y);

if shotTimer > 0 {
	shotTimer -= 1;
}

if shotTimer <= 0 {
	instance_destroy();
}


if image_angle == 0 {
	xspd += xAdd;
	x += xspd;
	
	if place_meeting(x + (1 * image_xscale) , y, obj_Solid) && !place_meeting(x, y, obj_BreakableFloor) {
		instance_destroy();
		
		if xspd > 0 {
			with(instance_create_depth(x + 4, y, depth, obj_IvyBulletSplash)) {
				sprite_index = spr_IvyBigBulletSplash;
				depth = other.depth;
				image_xscale = 1;
			}
		} else if xspd < 0 {
			with(instance_create_depth(x - 4, y, depth, obj_IvyBulletSplash)) {
				sprite_index = spr_IvyBigBulletSplash;
				depth = other.depth;
				image_xscale = -1;
			}
		}
		
		
		if _dist < 450 {
			obj_SFXManager.ivyImpact = true;
		}
	}
}

if image_angle == -90 {
	yspd += yAdd;
	y += yspd;
	
	if place_meeting(x, y + 1, obj_Solid) && !place_meeting(x, y, obj_BreakableFloor) {
		instance_destroy();
		
		with(instance_create_depth(x, y + 4, depth, obj_IvyBulletSplash)) {
			sprite_index = spr_IvyBigBulletSplash;
			depth = other.depth;
			image_angle = other.image_angle;
			image_xscale = 1;
		}
		
		if _dist < 450 {
			obj_SFXManager.ivyImpact = true;
		}
	}
}


if image_yscale < 1 {
	image_yscale += 0.2;
}
