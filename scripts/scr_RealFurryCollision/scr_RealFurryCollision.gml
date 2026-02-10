/// @description player_exit_terrain_overlap(normal_direction,player_side_direction,maxiter,adaptive_snap)
/// @param normal_direction
/// @param player_side_direction
/// @param maxiter
/// @param adaptive_snap
function scr_PlayerExitTerrainOverlap(argument0, argument1, argument2, argument3) {
	//normal_direction:         the direction to exit the terrain in, usually its normal
	//player_side_direction:    the direction the player's sides are aligned to, typically the direction of the terrain (as opposed to its normal)
	//maxiter:                  how many iterations are allowed before the loop aborts (i.e. the max possible distance the player can be moved)
	//adaptive_snap:            whether to adjust player's actual direction to the direction the terrain was left in when leaving a vertical or horizontal surface
	var iter = 0;
	
	while(scr_PlayerTerrainOverlap(x, y, argument1) && iter < argument2) {
	    x += lengthdir_x(1, argument0);
	    y += lengthdir_y(1, argument0);
	    iter++;
	}
	
	if(argument3) {
	    //Snap to the direction of the ground to prevent repeatedly moving diagonally into it due to rounding errors
	    ca = scr_ClosestCardinalDirection(argument0);
		
	    if(abs(angle_difference(ca, argument0)) < 10) {
	        normal_direction = ca;
	        groundAngle = ca - 90;
	    }
	}
}

/// @description player_get_terrain_status()
function scr_PlayerGetTerrainStatus() {
	ground = scr_PlayerTerrainOverlap(x + lengthdir_x(1.99, normal_direction + 180), y + lengthdir_y(1.99, normal_direction + 180), groundAngle);
}

/// @description player_inertia_aerial()
function scr_PlayerInertiaAerial() {
	var iter, miter, lx, ly, rx, ry, step, numacs;

	//Failsafe: If inside terrain, move outwards until free again.
	scr_PlayerExitTerrainOverlap(normal_direction, groundAngle, 16, true);

	//Lateral movement; no rotation in this state.
	if scr_PlayerTerrainOverlapSloped(x + vel, y + yspd, groundAngle) {
	    //When moving into sloped terrain, try to land on it
    
	    //Use raytracing to find direction of ground below us
	    lx = x - collision_width; 
		ly = y - 8;
	    rx = x + collision_width; 
		ry = y - 8;
	    miter = 64;
	    iter = 0;
	    step = 1;
	    numacs = 0; //NUMber of Actual CollisionS
		
	    while(!collision_point(lx, ly, obj_Solid, true, true) && iter < miter) {
	        ly += step;
	        iter++;
	    }
		
	    if iter < miter {
			numacs++;
		}
		
	    iter = 0;
		
	    while(!collision_point(rx, ry, obj_Solid, true, true) && iter < miter) {
	        ry += step;
	        iter++;
	    }
		
	    if iter < miter {
			numacs++;
		}
    
	    winningAngle = point_direction(lx, ly, rx, ry);
    
	    //Only land on terrain 
	    if abs(angle_difference(winningAngle, 0) < 90 && numacs > 0) {
	        ground = true;
			
			scr_Landing();
	    }
	}
	
	//If didn't land on a slope, try normal movement
	if !ground {
	    //Horizontal movement
	    if vel != 0 {
	        if !scr_PlayerTerrainOverlap(x + vel, y, groundAngle) {
	            //No obstruction, move fully
	            x += vel;
	        } else {
	            //Precise-collision running into a wall
	            d = sign(vel);
				
	            repeat(abs(vel)) {
	                if !scr_PlayerTerrainOverlap(x + d, y, groundAngle) {
	                    x += d;
	                } else {
	                    break;
	                }
	            }
				
	            vel = 0;
	        }
	    }
		
	    //Verical movement
	    if yspd != 0 {
	        if !scr_PlayerTerrainOverlap(x, y + yspd, groundAngle) {
	            //No obstruction, move fully
	            y += yspd;
	        } else {
	            //Precise-collision landing
	            d = sign(yspd);
				
	            repeat(abs(yspd)) {
	                if !scr_PlayerTerrainOverlap(x, y + d, groundAngle) {
	                    y += d;
	                } else {
	                    break;
	                }
	            }
				
	            //Smooth landing on flat ground
	            if yspd > 0 {
	                ground = true;
	                winningAngle = 0;
	            }
				
	            yspd = 0;
	        }
	    }
	}
	
	//Update angle
	target_angle = 0
}

/// @description player_inertia_ground()
function scr_PlayerInertiaGround() {
	var deltang, deltastep, moved, iter, potential_slope_ahead;

	//Failsafe: If inside terrain, move outwards until free again.
	scr_PlayerExitTerrainOverlap(normal_direction, groundAngle, 16, true);

	//Movement itself: this code only needs to be run when there's actual movement going on
	if groundSpeed != 0 {
	    //Variable to check whether moving was successful or obstructed
	    moved = false;
    
	    //Check for potential slopes
	    potential_slope_ahead = (collision_circle(x, y, abs(groundSpeed) + collision_width + 1, obj_SlopeStairs, true, true) != noone);
    
	    if potential_slope_ahead {
	        //When there's a slope ahead, use more advanced collision checking to follow terrain around
        
	        //Rotate from downhill to uphill: angle direction is the opposite of your current movement direction
	        if groundSpeed > 0 {
	            deltang = -collision_angle_deltamax;
	            deltastep = collision_angle_step;
	        } else {
	            deltang = collision_angle_deltamax;
	            deltastep = -collision_angle_step;
	        }
        
	        //Use raytracing to follow the terrain
	        dx = lengthdir_x(1, normal_direction + 180);
	        dy = lengthdir_y(1, normal_direction + 180);
        
	        lx = x + lengthdir_x(groundSpeed, groundAngle) - lengthdir_x(collision_width, groundAngle) - 8 * dx; 
			ly = y + lengthdir_y(groundSpeed, groundAngle) - lengthdir_y(collision_width, groundAngle) - 8 * dy;
	        rx = x + lengthdir_x(groundSpeed, groundAngle) + lengthdir_x(collision_width, groundAngle) - 8 * dx; 
			ry = y + lengthdir_y(groundSpeed, groundAngle) + lengthdir_y(collision_width, groundAngle) - 8 * dy;
	        miter = 64;
			
	        iter = 0;
	        step = 1;
	        numacs = 0; //NUMber of Actual CollisionS
			
	        while(!collision_point(lx, ly, obj_Solid, true, true) && iter < miter) {
	            lx += dx;
	            ly += dy;
	            iter++;
	        }
			
	        if iter < miter {
				numacs++;
			}
			
	        iter = 0;
			
	        while(!collision_point(rx, ry, obj_Solid, true, true) && iter < miter) {
	            rx += dx;
	            ry += dy;
	            iter++;
	        }
			
	        if iter < miter {
				numacs++;
			}
        
	        //Only follow ground when the angle is small enough
	        terrain_angle_here = point_direction(lx, ly, rx, ry);
			
	        if abs(angle_difference(groundAngle, terrain_angle_here)) < collision_angle_deltamax {
	            groundAngle = terrain_angle_here;
	            normal_direction = groundAngle + 90;
				
	            //Since both the ray positions now are INSIDE terrain, we step outwards 1 pixel
	            x = lerp(lx, rx, 0.5) - lengthdir_x(1, normal_direction);
	            y = lerp(ly, ry, 0.5) - lengthdir_y(1, normal_direction);
	            moved = true;
	        } else {
	            //When perfect following isn't possible, try imperfect
        
	            //Check various angles from max possible downhill to max possible uphill
	            repeat((2 * collision_angle_deltamax) / (collision_angle_step)) {
	                if ((collision_point(x + lengthdir_x(collision_width * sign(groundSpeed) + groundSpeed, groundAngle + deltang), y + lengthdir_y(collision_width * sign(groundSpeed) + groundSpeed, groundAngle + deltang), obj_Solid, true, true) == noone)) {
	                    //If angle is valid, this is the direction of the ground! Move in this direction.
                    
	                    //Adapt current ground angle to ground's actual direction
	                    groundAngle += deltang;
	                    normal_direction += deltang;
						
	                    //Move in the direction
	                    x += lengthdir_x(groundSpeed, groundAngle);
	                    y += lengthdir_y(groundSpeed, groundAngle);
	                    //Abort movement loop, we were successful!
	                    moved = true;
	                    break;
	                }
					
	                //Continue rotation
	                deltang += deltastep;
	            }
	        }
	    } else {
	        //When there's no slope ahead, use much simpler collision checking (this also prevents 'false positive' running up walls at 90-degree angles)
        
	        //When there's no slope, try to snap to cardinal angles to reduce incremental-pixel movement
	        ca = scr_ClosestCardinalDirection(normal_direction);
			
	        if abs(angle_difference(ca, normal_direction)) < 10 {
	            normal_direction = ca;
	            groundAngle = ca - 90;
	        }
			
	        //We only need to worry about the current angle when there's no slopes ahead
	        if (collision_point(x + lengthdir_x(collision_width * sign(groundSpeed) + groundSpeed, groundAngle), y + lengthdir_y(collision_width * sign(groundSpeed) + groundSpeed, groundAngle), obj_Solid, true, true) == noone) {
	            x += lengthdir_x(groundSpeed, groundAngle);
	            y += lengthdir_y(groundSpeed, groundAngle);
				
	            moved = true;
	        } else {
	            //Precise collision when there is obstructions
	            xstep = lengthdir_x(sign(groundSpeed), groundAngle);
	            ystep = lengthdir_y(sign(groundSpeed), groundAngle);
				
	            repeat(abs(groundSpeed)) {
	                if (collision_point(x + lengthdir_x(collision_width * sign(groundSpeed), groundAngle) + xstep, y + lengthdir_y(collision_width * sign(groundSpeed), groundAngle) + ystep, obj_Solid, true, true) == noone) {
	                    x += xstep;
	                    y += ystep;
	                } else {
	                    break;
	                }
	            }
				
	            moved = false;
	        }
	    }
    
	    //No matter how movement was performed, stop if would've moved into a wall
	    if !moved {
	        groundSpeed = 0;
			
	        if abs(angle_difference(groundAngle, 0)) > 0 { //ang_flat){
	            ground = false;
				jumping = true;
	        }
	    }
	}

	//Slowdown when running on walls
	if abs(angle_difference(groundAngle, 0)) > ang_flat {
	    groundSpeed += lengthdir_x(grav / 3, normal_direction);
		
	    //Fall off if lose speed while running on a ceiling
	    if abs(groundSpeed) < (max_Speed / 2.5) {
	        if abs(angle_difference(groundAngle, 180)) < 91 { //60
	            ground = false;
				jumping = true;
				jspd = 0;
	        }
	    }
	}

	//Effects update
	target_angle = groundAngle;
}

/// @description player_land_on_ground()
function scr_PlayerLandOnGround() {
	//State transition from aerial and knockback states to ground state
	state = scr_PstGround();
        
	var dd = point_direction(0, 0, vel, yspd), dm = point_distance(0, 0, vel, yspd);
	
	groundAngle = winningAngle;
	normal_direction = groundAngle + 90;
	groundSpeed = lengthdir_x(dm, dd - groundAngle);

	iter = 0;
	dx = lengthdir_x(0.5, normal_direction + 180);
	dy = lengthdir_y(0.5, normal_direction + 180);
	
	while(!scr_PlayerTerrainOverlap(x, y, groundAngle) && iter < 32) {
	    x += dx;
	    y += dy;
	    iter++;
	}
	
	//scr_Landing();
	jspd = normalJspd;
	vel = 0;
	yspd = 0;
}

/// @description player_leave_the_ground()
function scr_PlayerLeaveTheGround() {
	//The counterpart to player_land_on_ground(), used to transit from ground to aerial states
	vel = lengthdir_x(groundSpeed, groundAngle) + lengthdir_x(jspd, normal_direction);
	yspd = lengthdir_y(groundSpeed, groundAngle) + lengthdir_y(jspd, normal_direction);
	groundSpeed = 0;
	groundAngle = 0;
	normal_direction = 90;
}

/// @description player_terrain_overlap(x,y,sideangle)
/// @param x
/// @param y
/// @param sideangle
function scr_PlayerTerrainOverlap(argument0, argument1, argument2) {
	return (collision_line(argument0, argument1, argument0 + lengthdir_x(collision_width, argument2), argument1 + lengthdir_y(collision_width, argument2), obj_Solid, true, true) != noone || collision_line(argument0, argument1, argument0 - lengthdir_x(collision_width, argument2), argument1 - lengthdir_y(collision_width, argument2), obj_Solid, true, true) != noone);
}

/// @description player_terrain_overlap_sloped(x,y,sideangle)
/// @param x
/// @param y
/// @param sideangle
function scr_PlayerTerrainOverlapSloped(argument0, argument1, argument2) {
	return (collision_line(argument0, argument1, argument0 + lengthdir_x(collision_width, argument2), argument1 + lengthdir_y(collision_width, argument2), obj_SlopeStairs, true, true) != noone || collision_line(argument0, argument1, argument0 - lengthdir_x(collision_width, argument2), argument1 - lengthdir_y(collision_width, argument2), obj_SlopeStairs, true, true) != noone);
}

/// @description pst_aerial()
function scr_PstAerial() {
	scr_PlayerInertiaAerial();
	scr_PlayerInputAerial();
	
	if ground {
	    scr_PlayerLandOnGround();
	}
}
	
/// @description pst_ground()
function scr_PstGround() {
	//Start of step variable update
	scr_PlayerGetTerrainStatus();
	
	ground = true;
	jumping = false;
	dJumping = false;
	realJumping = false;

	//Movement
	scr_PlayerInertiaGround();
	scr_PlayerInputGrounds();

	//State changes
	if !ground {
	    var outwards_direction = normal_direction;
    
	    //Switch from polar to cartesian movement
	    scr_PlayerLeaveTheGround();
    
	    //Switch to appropriate state
	    state = scr_PstAerial();
    
	    //Because orientation changes might have made us intersect with the terrain we were on, move outside it.
	    scr_PlayerExitTerrainOverlap(outwards_direction, groundAngle, 16, false);
	}
}

/// @description closest_cardinal_direction(dir)
/// @param dir
function scr_ClosestCardinalDirection(argument0) {
	var ang = (argument0 + 360) mod 360;
	
	if(ang > 315 || ang < 45) {
	    return 0;
	} else if(ang < 135) {
	    return 90;
	} else if(ang < 225) {
	    return 180;
	} else {
	    return 270;
	}
}

function scr_PlayerInputGrounds() {
	var trsign, factor;
	
	var _maxSpeed = max_Speed;
	
	if speedBreak {
		if !boost {
			_maxSpeed = full_Speed;
		} else {
			_maxSpeed = boost_Speed;
		}
	}

	//Lateral
	if wall_accf {
	    trsign = sign(lengthdir_x(1, normal_direction));
	    trmagn = abs(lengthdir_x(1, normal_direction));
	} else {
	    trsign = 0;
	    trmagn = 0;
	}
	
	if left_Key {
	    if leftFacer {
			face_Left = true;
		} else {
			image_xscale = -1;
		}
		
	    if trsign == -1 {
			factor = 1;
		} else {
			factor = 1 - trmagn;
		}
		
	    if groundSpeed > -_maxSpeed {
	        groundSpeed -= factor * (acc + dcc * (groundSpeed > 0));
	    }
	} 
	
	if right_Key {
	    if leftFacer {
			face_Left = false;
		} else {
			image_xscale = 1;
		}
		
	    if trsign == 1 {
			factor = 1;
		} else {
			factor = 1 - trmagn;
		}
		
	    if groundSpeed < _maxSpeed {
	        groundSpeed += factor * (acc + dcc * (groundSpeed < 0));
	    }
	} 
	
	if !right_Key && !left_Key {
	    if abs(groundSpeed) > fric {
	        groundSpeed -= sign(groundSpeed) * fric;
	    } else {
	        groundSpeed = 0;
	    }
	}
}

function scr_PlayerInputAerial() {
	if !ground {
		var _maxSpeed = max_Speed;
	
		if speedBreak {
			if !boost {
				_maxSpeed = full_Speed;
			} else {
				_maxSpeed = boost_Speed;
			}
		}
	
		//Horizontal speed
		if left_Key {
		    if leftFacer {
				face_Left = true;
			} else {
				image_xscale = -1;
			}
		
		    if vel > -_maxSpeed {
		        vel -= acc + dcc * (vel > 0);
		    }
		}
	
		if right_Key {
			if leftFacer {
				face_Left = false;
			} else {
				image_xscale = 1;
			}
		
		    if vel < _maxSpeed {
		        vel += acc + dcc * (vel < 0);
		    }
		} 
	
		if !right_Key && !left_Key {
		    if abs(vel) > fric {
		        vel -= sign(vel) * fric;
		    } else {
		        vel = 0;
		    }
		}
	}
}

