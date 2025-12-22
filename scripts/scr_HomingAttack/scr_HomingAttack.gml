function scr_HomingAttackCreate() {
	objectList = [];
	homing_Target = undefined;
	homing_Range = 250;
	homing_Speed = 20;
	homing_Active = false;
	homingAttacked = false;
	homingTimer = 0;
	homingFrames = 180;
	target = noone;
}

function scr_HomingAttackStep() {

	if !homing_Active && instance_exists(obj_HomingDotDebug) && !playerHurt && !global.Death {
		var _closestDist = homing_Range;
	    var _closestEnemy = undefined;
		
		var _homingID = instance_nearest(x, y, obj_HomingDotDebug);

		if ((_homingID.x < x && image_xscale == -1) or (_homingID.x > x && image_xscale == 1)) && !collision_line(x, y, _homingID.x, _homingID.y, obj_Solid, false, false) && _homingID.homingAttackable {
		    with (_homingID) {
				var _dist = point_distance(x, y, obj_Player.x, obj_Player.y);
			
		        if (_dist <= _closestDist) && homingAttackable {
					_closestEnemy = id;
					_closestDist = _dist;
					target = _closestEnemy;
				
					if !instance_exists(obj_HomingReticle) {
						with ((instance_create_depth(x - sprite_xoffset + sprite_width / 2, y - sprite_yoffset + sprite_height / 2, depth - 10, obj_HomingReticle))) {
							lockOnTarget = other.target;
						}
					}
		        } else {
					instance_destroy(obj_HomingReticle);
				}
		    }
		} else {
			instance_destroy(obj_HomingReticle);
		}

	    if _closestEnemy != undefined && action2_Key && !homing_Active && !afterRailJump && !rampRing && !preStomp && !stomping && !spindash && !superPeelout && !dropdash && !ground {
	        homing_Target = _closestEnemy;
	        homing_Active = true;
			obj_SFXManager.homingAttack = true;
			scr_ControllerRumble();
			airBoost = false;
			dJumping = false;
			realJumping = false;
			scr_StopCamMove();
			
			if x < homing_Target.x {
				if !leftFacer {
					image_xscale = 1;
				} else {
					face_Left = false;
				}
			} else if x > homing_Target.x {
				if !leftFacer {
					image_xscale = -1;
				} else {
					face_Left = true;
				}
			}
	    }
	}
	
	
	if homing_Active && homing_Target != undefined {
	    var _targetX = homing_Target.x;
	    var _targetY = homing_Target.y;
	    var _dir = point_direction(x, y, _targetX, _targetY);
		
		x += lengthdir_x(homing_Speed, _dir);
		y += lengthdir_y(homing_Speed, _dir);
	
		yspd = 0;
		vel = 0;
	}
	
	if homing_Target != undefined {
		if place_meeting(x, y, homing_Target) && homing_Active {
		    homing_Active = false;
		    homing_Target = undefined;
			
			var _xspd = 12;
			var _fullXspd = _xspd;
			
			if !leftFacer {
				_fullXspd = _xspd * image_xscale;
			} else {
				if !face_Left {
					_fullXspd = _xspd;
				} else {
					_fullXspd = -_xspd;
				}
			}
			
			vel = _fullXspd;
			yspd = -normalJspd;
		
			var _enemyTouched = instance_place(x, y, obj_EnemyParent);
		
			if _enemyTouched {
				_enemyTouched.vel = _xspd;
				_enemyTouched.yspd = -3;
			}
		
		}
	}
}