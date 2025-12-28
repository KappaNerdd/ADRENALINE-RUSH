function scr_PlayerTrail() {
	if !global.SimplifyVFX {
		with(instance_create_depth(x, y, depth + 1, obj_PlayerTrail)) {
			x = other.x;
			y = other.y;
			
			sprite_index = other.sprite_index;
			image_index = other.image_index;
			image_angle = other.drawAngle;
			image_xscale = other.image_xscale;
			image_yscale = other.image_yscale;
		}
	}
}

function scr_DustParticles(_x = 0, _y = 15) {
	if global.Particles {
		instance_create_depth(x + _x, y + _y, depth + 1, obj_SlideDustVFX);
	}
}

function scr_SpeedBreakVFX() {
	/*if !instance_exists(obj_SpeedBreakVFX) && !instance_exists(obj_NewPauseMenu) && global.Particles {
		instance_create_depth(x, y, depth - 1, obj_SpeedBreakVFX);
	}
	
	if !speedBreak {
		instance_destroy(obj_SpeedBreakVFX);
	}*/
}

function scr_StompVFX() {
	/*if stomping && !instance_exists(obj_StompingVFX) && !instance_exists(obj_NewPauseMenu) && global.Particles {
		instance_create_depth(x, y, depth - 1, obj_StompingVFX);
	}*/
}

function scr_StompedVFX() {
	with(instance_create_depth(x, y, depth, obj_StompVFX)) {
		sprite_index = other.stompedSprite;
	}
}

function scr_RushBoostBreakVFX(_x = 0, _y = 0) {
	with(instance_create_depth(x + _x, y + _y, depth, obj_RushBoostBreak)) {
		sprite_index = other.stompedSprite;
		
		if other.vel > 0 {
			image_xscale = 1.35;
		} else if other.vel < 0 {
			image_xscale = -1.35;
		}

		image_angle = other.drawAngle + (90 * sign(image_xscale));
	}
}

function scr_RailGrindParticles(_x = 0, _y = 30) {
	if !instance_exists(obj_RailGrindVFX) && global.Particles && ground && vel != 0 {
		instance_create_depth(x, y + 30, depth + 1, obj_RailGrindVFX);
	}
}

function scr_BodyGlowVFX() {
	if (afterRailJump or rampRing) && !trick && !global.SimplifyVFX {
		if !instance_exists(obj_BodyGlow) {
			instance_create_depth(x, y, depth + 1, obj_BodyGlow);
		}
	}
}

function scr_RushAdventureKickParticles(_speed = 1) {
	if !instance_exists(obj_SideTrickVFXKappa) && !instance_exists(obj_NewPauseMenu) && global.Particles {
		with(instance_create_depth(x, y, depth, obj_SideTrickVFXKappa)) {
			image_speed = _speed;
		}
	}
	
	if instance_exists(obj_SideTrickVFXKappa) {
		with(obj_SideTrickVFXKappa) {
			if !other.leftFacer {
				image_xscale = other.image_xscale;
			} else {
				if other.face_Left {
					image_xscale = -1;
				} else {
					image_xscale = 1;
				}
			}
		}
	}
}

