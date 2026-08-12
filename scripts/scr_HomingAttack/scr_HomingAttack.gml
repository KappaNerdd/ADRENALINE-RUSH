function scr_HomingAttackCreate() {
	homingList = [];
	homingCheck = false;
	homing_Target = undefined;
	homing_Range = 250;
	homing_Speed = 20;
	homing_Active = false;
	homingAttacked = false;
	
	homingTimer = 120;
	homingFrames = 120;
	
	homingAttackable = false;
	homingTimer = 0;
	homingFrames = 180;
	airDash = false;
	target = noone;
}

function scr_HomingAttackStep() {
	#region //Old
		var _homingID = instance_nearest(x, y, obj_HomingDotDebug);
	
		if !homingCheck {
			for(var i = 0; i < instance_number(obj_HomingDotDebug); i++) {
				array_push(homingList, instance_find(obj_HomingDotDebug, i));
			}
			
			homingCheck = true;
		}
		
		/*for(var h = 0; h < array_length(homingList); h++) {
			if instance_exists(homingList[h]) {
				with(homingList[h]) {
					var _otherDist = point_direction(x, y, other.x, other.y);
					
					if ((x < other.x && other.visXScale == -1) or (x > other.x && other.visXScale == 1)) 
					&& !collision_line(x, y, other.x, other.y, obj_Solid, false, false)
					&& (!collision_line(x, y, other.x, other.y, obj_SolidA, false, false) && other.terrainLayer == 0) 
					&& (!collision_line(x, y, other.x, other.y, obj_SolidB, false, false) && other.terrainLayer == 1)
					&& homingAttackable {
						if _otherDist <= other.homing_Range {
							_homingID = instance_nearest(other.x, other.y, id);
						}
					}
				}
			}
		}*/
	
		if !homing_Active && instance_exists(_homingID) {
			var _closestDist = homing_Range;
		    var _closestEnemy = undefined;

			if ((_homingID.x < x && visXScale == -1) or (_homingID.x > x && visXScale == 1)) && !collision_line(x, y, _homingID.x, _homingID.y, obj_Solid, false, false) && _homingID.homingAttackable && !ground && !playerHurt && !global.Death {
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

		    if _closestEnemy != undefined && action2_Key && !airDash && !homing_Active && !afterRailJump && !rampRing && !preStomp && !stomping && !spindash && !superPeelout && !dropdash && !ground {
		        homing_Target = _closestEnemy;
		        homing_Active = true;
				homingAttacked = false;
				obj_SFXManager.homingAttack = true;
				scr_ControllerRumble();
				airBoost = false;
				dJumping = false;
				realJumping = true;
				homingTimer = homingFrames;
				scr_StopCamMove();
				
				vel = 0;
				yspd = 0;
			
				if x < homing_Target.x {
					if !leftFacer {
						visXScale = 1;
					} else {
						face_Left = false;
					}
				} else if x > homing_Target.x {
					if !leftFacer {
						visXScale = -1;
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
			
			if place_meeting(x, y, homing_Target) {
			    homing_Active = false;
			    homing_Target = undefined;
				homingAttacked = true;
				airDash = false;
				homingTimer = homingFrames;
			
				yspd = -(normalJspd + 1);
			} else {
				yspd = -grav;
				
				if object_index != obj_RushSpeed {
					vel = 0;
				} else {
					vel = max_Speed * visXScale;
				}
			}
			
			if homingTimer > 0 {
				homingTimer--;
			} else {
				homing_Active = false;
			    homing_Target = undefined;
				homingAttacked = true;
				airDash = false;
				homingTimer = homingFrames;
			}
		}
		
		showAfterImage = homing_Active;
		
		if homingAttacked {
			if ground {
				homingAttacked = false;
				yspd = 0;
			} else if yspd >= 0 {
				homingAttacked = false;
			}
		}
	#endregion
}