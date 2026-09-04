function scr_PlayerTrail() { //Unused
	/*if !global.SimplifyVFX {
		with(instance_create_depth(x, y, depth + 1, obj_PlayerTrail)) {
			x = other.x;
			y = other.y;
			
			sprite_index = other.sprite_index;
			image_index = other.image_index;
			image_angle = other.drawAngle;
			image_xscale = other.image_xscale;
			image_yscale = other.image_yscale;
		}
	}*/
}

function scr_DustParticles(_x = 0, _y = -1) {
	if global.Particles {
		instance_create_depth(x + angleSin * 10, y + angleCos * 10, depth - 1, obj_SlideDustVFX)
	}
}

function scr_DJumpVFX(_col = c_lime) {
	if global.Particles {
		with(instance_create_depth(x + angleSin * 10, y + angleCos * 10, depth - 1, obj_DJumpVFX)) {
			image_xscale = 0.5;
			image_yscale = 2;
			image_angle = point_direction(0, 0, other.vel, other.yspd);
			
			if !global.MIND && global.PlayerChar != 0 {
				image_blend = _col;
			}
		}
		
		with(instance_create_depth(x + angleSin * 20, y + angleCos * 20, depth - 1, obj_DJumpVFX)) {
			image_xscale = 0.5;
			image_yscale = 3;
			image_angle = point_direction(0, 0, other.vel, other.yspd);

			if !global.MIND && global.PlayerChar != 0 {
				image_blend = merge_colour(_col, c_black, 0.5);
			} else {
				image_blend = c_grey;
			}
		}
	}
}

function scr_SpeedBreakVFX(_sprite) {
	if speedBreakSprTimer > 0 {
		speedBreakSprTimer--;
	}
	
	if global.Particles && speedBreakSprTimer <= 0 && abs(vel) >= 3 {
		var _xscale = 1;
		
		if leftFacer {
			if face_Left {
				_xscale = -1;
			}
		} else {
			_xscale = visXScale;
		}
		
		with(instance_create_depth(x + angleSin * 10, floor(y + angleCos * 10), depth - 1, obj_RailGrindVFX)) {
			sprite_index = other.speedBreakSprite;
			image_xscale = _xscale;
			image_angle = other.drawAngle;
		}
		
		speedBreakSprTimer = 10;
	}
}

function scr_StompVFX() { //Unused
	/*if stomping && !instance_exists(obj_StompingVFX) && !instance_exists(obj_NewPauseMenu) && global.Particles {
		instance_create_depth(x, y, depth - 1, obj_StompingVFX);
	}*/
}

function scr_StompedVFX() {
	with(instance_create_depth(x + angleSin, y + angleCos, depth, obj_StompVFX)) {
		sprite_index = other.stompedSprite;
		image_angle = other.angle;
	}
}

function scr_RushBoostBreakVFX(_x = 0, _y = -16) {
	with(instance_create_depth(x + _x + angleSin, y + _y + angleCos, depth, obj_RushBoostBreak)) {
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
	/*if !instance_exists(obj_RailGrindVFX) && global.Particles && ground && vel != 0 {
		instance_create_depth(x, y + 30, depth + 1, obj_RailGrindVFX);
	}*/
}

function scr_BodyGlowVFX() { //Unused
	if (afterRailJump or rampRing) && !trick && !global.SimplifyVFX {
		if !instance_exists(obj_BodyGlow) {
			instance_create_depth(x, y, depth + 1, obj_BodyGlow);
		}
	}
}

function scr_RushAdventureKickParticles(_speed = 1) { //Unused
	/*if !instance_exists(obj_SideTrickVFXKappa) && !instance_exists(obj_NewPauseMenu) && global.Particles {
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
	}*/
}

function scr_LuciBurstGlide(_x, _y, _angle, _follow, _check) {
	if global.Particles {
		with(instance_create_depth(_x, _y, depth + 2, obj_LuciferBurstGlide)) {
			image_angle = _angle;
			
			if _follow {
				charID = other.id;
			}
			
			follow = _follow;
			angleCheck = _check;
		}
	}
}
	
function scr_RushTrickConfetti(_amount = 1) {
	repeat(_amount) {
		instance_create_depth(-100000, 0, 0, obj_TrickConfetti);
	}
}

function scr_RushTrickVFX(_amount = 1) {
	repeat(_amount) {
		with(instance_create_depth(x, y, depth, obj_TrickParticles)) {
			charCheck = other.id;
			sprite_index = other.trinkPart;
		}
	}
}

function scr_RushTrickFinaleVFX() {
	with(instance_create_depth(x, y, depth, obj_FinalTrickParticles)) {
		charCheck = other.id;
		sprite_index = other.trickFinalePart;
	}
}