/// @description get_keys()
function get_keys() {
	//Read keys and updates the 'how long it has been pressed' status
	p_u = (p_u + 1)*k_u
	p_d = (p_d + 1)*k_d
	p_l = (p_l + 1)*k_l
	p_r = (p_r + 1)*k_r

	p_a = (p_a + 1)*k_a
	p_b = (p_b + 1)*k_b
	p_c = (p_c + 1)*k_c
	p_st= (p_st+ 1)*k_st
	p_sl= (p_sl+ 1)*k_sl

	//Reads key variables
	k_u = keyboard_check(vk_up)
	k_d = keyboard_check(vk_down)
	k_r = keyboard_check(vk_right)
	k_l = keyboard_check(vk_left)

	k_a = keyboard_check(ord("X"))
	k_b = keyboard_check(ord("Z"))
	k_c = keyboard_check(ord("C"))
	k_st= keyboard_check(vk_enter)
	k_sl= keyboard_check(vk_shift)



}
	
/// @description init_keys()
function init_keys() {
	//Creates key variables, and sets to false values by default to indicate they are not pressed.

	//Number of steps it has been held down
	p_u = false
	p_d = false
	p_r = false
	p_l = false

	p_a = false
	p_b = false
	p_c = false

	p_st= false
	p_sl= false

	//Current status
	k_u = false
	k_d = false
	k_r = false
	k_l = false

	k_a = false
	k_b = false
	k_c = false
	k_st= false
	k_sl= false
}

/// @description player_exit_terrain_overlap(normal_direction,player_side_direction,maxiter,adaptive_snap)
/// @param normal_direction
/// @param player_side_direction
/// @param maxiter
/// @param adaptive_snap
function player_exit_terrain_overlap(argument0, argument1, argument2, argument3) {
	//normal_direction:         the direction to exit the terrain in, usually its normal
	//player_side_direction:    the direction the player's sides are aligned to, typically the direction of the terrain (as opposed to its normal)
	//maxiter:                  how many iterations are allowed before the loop aborts (i.e. the max possible distance the player can be moved)
	//adaptive_snap:            whether to adjust player's actual direction to the direction the terrain was left in when leaving a vertical or horizontal surface
	var iter = 0;
	while(player_terrain_overlap(x,y,argument1) && iter < argument2){
	    x += lengthdir_x(1,argument0)
	    y += lengthdir_y(1,argument0)
	    iter++
	}
	if(argument3){
	    //Snap to the direction of the ground to prevent repeatedly moving diagonally into it due to rounding errors
	    ca = closest_cardinal_direction(argument0)
	    if(abs(angle_difference(ca,argument0)) < 10){
	        normal_direction = ca
	        groundangle      = ca-90
	    }
	}
}

/// @description player_get_jumpability()
function player_get_jumpability() {
	if(!k_a){
	    canjump = true;
	}
}

/// @description player_get_terrain_status()
function player_get_terrain_status() {
	onground = player_terrain_overlap(x + lengthdir_x(1.99,normal_direction + 180),y + lengthdir_y(1.99,normal_direction + 180),groundangle)
}

/// @description player_get_terrain_status_og()
function player_get_terrain_status_og() {
	onground = player_terrain_overlap(x + lengthdir_x(8.99,normal_direction + 180),y + lengthdir_y(8.99,normal_direction + 180),groundangle)
}

/// @description player_gravity()
function player_gravity() {
	if(!onground){
	    yspeed = min(spd_term,yspeed + spd_grav)
	}
}

/// @description player_inertia_aerial()
function player_inertia_aerial() {
	var iter, miter, lx, ly, rx, ry, step, numacs;

	//Failsafe: If inside terrain, move outwards until free again.
	player_exit_terrain_overlap(normal_direction,groundangle,16,true)


	//Lateral movement; no rotation in this state.
	if(player_terrain_overlap_sloped(x + xspeed,y + yspeed,groundangle)){
	    //When moving into sloped terrain, try to land on it
    
	    //Use raytracing to find direction of ground below us
	    lx   = x - collision_width; ly = y - 8
	    rx   = x + collision_width; ry = y - 8
	    miter= 64
	    iter = 0
	    step = 1
	    numacs = 0//NUMber of Actual CollisionS
		
	    while(!collision_point(lx,ly,obj_Solid,true,true) && iter < miter){
	        ly += step
	        iter++
	    }
	    if(iter < miter){numacs++}
	    iter = 0
	    while(!collision_point(rx,ry,obj_Solid,true,true) && iter < miter){
	        ry += step
	        iter++
	    }
	    if(iter < miter){numacs++}
    
	    landingangle = point_direction(lx,ly,rx,ry)
    
	    //Only land on terrain 
	    if(abs(angle_difference(landingangle,0) < 90 && numacs > 0)){
	        onground     = true
	    }
	}
	//If didn't land on a slope, try normal movement
	if(!onground){
	    //Horizontal movement
	    if(xspeed != 0){
	        if(!player_terrain_overlap(x + xspeed,y,groundangle)){
	            //No obstruction, move fully
	            x += xspeed
	        }
	        else{
	            //Precise-collision running into a wall
	            d = sign(xspeed)
	            repeat(abs(xspeed)){
	                if(!player_terrain_overlap(x + d,y,groundangle)){
	                    x += d
	                }
	                else{
	                    break
	                }
	            }
	            xspeed = 0
	        }
	    }
	    //Verical movement
	    if(yspeed != 0){
	        if(!player_terrain_overlap(x,y + yspeed,groundangle)){
	            //No obstruction, move fully
	            y += yspeed
	        }
	        else{
	            //Precise-collision landing
	            d = sign(yspeed)
	            repeat(abs(yspeed)){
	                if(!player_terrain_overlap(x,y + d,groundangle)){
	                    y += d
	                }
	                else{
	                    break
	                }
	            }
	            //Smooth landing on flat ground
	            if(yspeed > 0){
	                onground    = true
	                landingangle= 0
	            }
	            yspeed = 0
	        }
	    }
	}
	//Update angle
	target_angle = 0
}

/// @description player_inertia_ground()
function player_inertia_ground() {
	var deltang, deltastep, moved, iter, potential_slope_ahead;

	//Failsafe: If inside terrain, move outwards until free again.
	player_exit_terrain_overlap(normal_direction,groundangle,16,true)

	//Movement itself: this code only needs to be run when there's actual movement going on
	if groundspeed != 0 {
	    //Variable to check whether moving was successful or obstructed
	    moved = false
    
	    //Check for potential slopes
	    potential_slope_ahead = (collision_circle(x,y,abs(groundspeed) + collision_width + 1,obj_SlopeStairs,true,true) != noone)
    
	    if(potential_slope_ahead) {
	        //When there's a slope ahead, use more advanced collision checking to follow terrain around
        
	        //Rotate from downhill to uphill: angle direction is the opposite of your current movement direction
	        if(groundspeed > 0) {
	            deltang     = -collision_angle_deltamax
	            deltastep   = collision_angle_step
	        } else {
	            deltang     = collision_angle_deltamax
	            deltastep   = -collision_angle_step
	        }
        
        
	        //Use raytracing to follow the terrain
	        dx = lengthdir_x(1, normal_direction + 180) 
	        dy = lengthdir_y(1, normal_direction + 180)
        
	        lx = x + lengthdir_x(groundspeed,groundangle) - lengthdir_x(collision_width,groundangle) - 8*dx; ly = y + lengthdir_y(groundspeed,groundangle) - lengthdir_y(collision_width,groundangle) - 8*dy
	        rx = x + lengthdir_x(groundspeed,groundangle) + lengthdir_x(collision_width,groundangle) - 8*dx; ry = y + lengthdir_y(groundspeed,groundangle) + lengthdir_y(collision_width,groundangle) - 8*dy
	        miter = 64
	        iter = 0
	        step = 1
	        numacs = 0//NUMber of Actual CollisionS
	        while(!collision_point(lx,ly,obj_Solid,true,true) && iter < miter){
	            lx += dx
	            ly += dy
	            iter++
	        }
	        if(iter < miter){numacs++}
	        iter = 0
	        while(!collision_point(rx,ry,obj_Solid,true,true) && iter < miter){
	            rx += dx
	            ry += dy
	            iter++
	        }
	        if(iter < miter){numacs++}
        
	        //Only follow ground when the angle is small enough
	        terrain_angle_here = point_direction(lx,ly,rx,ry)
	        if(abs(angle_difference(groundangle,terrain_angle_here)) < collision_angle_deltamax){
	            groundangle         = terrain_angle_here
	            normal_direction    = groundangle + 90
	            //Since both the ray positions now are INSIDE terrain, we step outwards 1 pixel
	            x = lerp(lx,rx,0.5) - lengthdir_x(1,normal_direction)
	            y = lerp(ly,ry,0.5) - lengthdir_y(1,normal_direction)
	            moved               = true
	        }
	        else{
	            //When perfect following isn't possible, try imperfect
        
	            //Check various angles from max possible downhill to max possible uphill
	            repeat((2*collision_angle_deltamax)/(collision_angle_step)){
	                if((collision_point(x + lengthdir_x(collision_width*sign(groundspeed) + groundspeed,groundangle + deltang),y + lengthdir_y(collision_width*sign(groundspeed) + groundspeed,groundangle + deltang),obj_Solid,true,true) == noone)){
	                    //If angle is valid, this is the direction of the ground! Move in this direction.
                    
	                    //Adapt current ground angle to ground's actual direction
	                    groundangle      += deltang
	                    normal_direction += deltang
	                    //Move in the direction
	                    x += lengthdir_x(groundspeed,groundangle)
	                    y += lengthdir_y(groundspeed,groundangle)
	                    //Abort movement loop, we were successful!
	                    moved = true
	                    break
	                }
	                //Continue rotation
	                deltang += deltastep
	            }
	        }
	    }
	    else{
	        //When there's no slope ahead, use much simpler collision checking (this also prevents 'false positive' running up walls at 90-degree angles)
        
	        //When there's no slope, try to snap to cardinal angles to reduce incremental-pixel movement
	        ca = closest_cardinal_direction(normal_direction)
	        if(abs(angle_difference(ca,normal_direction)) < 10){
	            normal_direction = ca
	            groundangle      = ca-90
	        }
	        //We only need to worry about the current angle when there's no slopes ahead
	        if((collision_point(x + lengthdir_x(collision_width*sign(groundspeed) + groundspeed,groundangle),y + lengthdir_y(collision_width*sign(groundspeed) + groundspeed,groundangle),obj_Solid,true,true) == noone)){
	            x += lengthdir_x(groundspeed,groundangle)
	            y += lengthdir_y(groundspeed,groundangle)
	            moved = true
	        }
	        else{
	            //Precise collision when there is obstructions
	            xstep = lengthdir_x(sign(groundspeed),groundangle)
	            ystep = lengthdir_y(sign(groundspeed),groundangle)
	            repeat(abs(groundspeed)){
	                if((collision_point(x + lengthdir_x(collision_width*sign(groundspeed),groundangle) + xstep,y + lengthdir_y(collision_width*sign(groundspeed),groundangle) + ystep,obj_Solid,true,true) == noone)){
	                    x += xstep
	                    y += ystep
	                }
	                else{
	                    break
	                }
	            }
	            moved       = false
	        }
	    }
    
	    //No matter how movement was performed, stop if would've moved into a wall
	    if(!moved){
	        groundspeed = 0
	        if(abs(angle_difference(groundangle,0)) > 0){//ang_flat){
	            onground = false
	        }
	    }
	}

	//Slowdown when running on walls
	if(abs(angle_difference(groundangle,0)) > ang_flat){
	    groundspeed += lengthdir_x(spd_wgrav,normal_direction)
	    //Fall off if lose speed while running on a ceiling
	    if(abs(groundspeed) < spd_wfall){
	        if(abs(angle_difference(groundangle,180)) < 91){//60
	            groundspeed= 0
	            jumpspeed  = 0
	            onground   = false
	        }
	    }
	}

	//Effects update
	target_angle = groundangle
}

/// @description player_input_aerial()
function player_input_aerial() {
	//Horizontal speed
	if(k_l){
	    draw_xscale = -1
	    if(xspeed > -spd_run){
	        xspeed -= (spd_acc + spd_decc*(xspeed > 0))
	    }
	}
	else if(k_r){
	    draw_xscale = 1
	    if(xspeed < spd_run){
	        xspeed += (spd_acc + spd_decc*(xspeed < 0))
	    }
	}
	else{
	    if(abs(xspeed) > spd_frict){
	        xspeed -= sign(xspeed)*spd_frict
	    }
	    else{
	        xspeed = 0
	    }
	}
	xspeed = clamp(xspeed,-spd_mach,spd_mach)

	//Variable jumping
	if(jumped && !k_a){
	    jumped = false
	    yspeed *= 0.5
	}
}

/// @description player_land_on_ground()
function player_land_on_ground() {
	//State transition from aerial and knockback states to ground state
	state = pst_ground
        
	var dd= point_direction(0,0,xspeed,yspeed),
	    dm= point_distance( 0,0,xspeed,yspeed);
	groundangle = landingangle
	normal_direction = groundangle + 90
	groundspeed = lengthdir_x(dm,dd - groundangle)

	iter = 0
	dx   = lengthdir_x(0.5,normal_direction + 180)
	dy   = lengthdir_y(0.5,normal_direction + 180)
	while(!player_terrain_overlap(x,y,groundangle) && iter < 32){
	    x += dx
	    y += dy
	    iter++
	}

	xspeed = 0
	yspeed = 0
}

/// @description player_leave_the_ground()
function player_leave_the_ground() {
	//The counterpart to player_land_on_ground(), used to transit from ground to aerial states
	xspeed              = lengthdir_x(groundspeed,groundangle) + lengthdir_x(jumpspeed,normal_direction)
	yspeed              = lengthdir_y(groundspeed,groundangle) + lengthdir_y(jumpspeed,normal_direction)
	groundspeed         = 0
	groundangle         = 0
	normal_direction    = 90
	jumpspeed           = 0
	jumpcooldown        = 10
}

/// @description player_terrain_overlap(x,y,sideangle)
/// @param x
/// @param y
/// @param sideangle
function player_terrain_overlap(argument0, argument1, argument2) {
	return (collision_line(argument0,argument1,argument0 + lengthdir_x(collision_width,argument2),argument1 + lengthdir_y(collision_width,argument2),obj_Solid,true,true) != noone || collision_line(argument0,argument1,argument0 - lengthdir_x(collision_width,argument2),argument1 - lengthdir_y(collision_width,argument2),obj_Solid,true,true) != noone)
}

/// @description player_terrain_overlap_sloped(x,y,sideangle)
/// @param x
/// @param y
/// @param sideangle
function player_terrain_overlap_sloped(argument0, argument1, argument2) {
	return (collision_line(argument0,argument1,argument0 + lengthdir_x(collision_width,argument2),argument1 + lengthdir_y(collision_width,argument2),obj_SlopeStairs,true,true) != noone || collision_line(argument0,argument1,argument0 - lengthdir_x(collision_width,argument2),argument1 - lengthdir_y(collision_width,argument2),obj_SlopeStairs,true,true) != noone)
}

/// @description pst_aerial()
function pst_aerial() {
	//Start of step variable update
	get_keys()
	player_get_jumpability()

	//Movement
	if(!jumpcooldown){
	    player_input_aerial()
	}
	else{
	    jumpcooldown--
	}
	player_gravity()
	player_inertia_aerial()

	//State changes
	if(onground){
	    player_land_on_ground()
	}
}
	
/// @description pst_ground()
function pst_ground() {
	//Start of step variable update
	get_keys()
	player_get_terrain_status()
	player_get_jumpability()
	jumping = false
	jumped  = false
	atk     = atk_default

	//Movement
	player_input_grounds()
	player_inertia_ground()

	//State changes
	if(!onground){
	    var outwards_direction = normal_direction;
    
	    //Switch from polar to cartesian movement
	    player_leave_the_ground()
    
	    //Switch to appropriate state
	    state               = pst_aerial
    
	    //Because orientation changes might have made us intersect with the terrain we were on, move outside it.
	    player_exit_terrain_overlap(outwards_direction,groundangle,16,false)
	}
}

function release_keys() {
	//Current status
	k_u = false
	k_d = false
	k_r = false
	k_l = false

	k_a = false
	k_b = false
	k_c = false
	k_st= false
	k_sl= false
}

/// @description closest_cardinal_direction(dir)
/// @param dir
function closest_cardinal_direction(argument0) {
	var ang = (argument0 + 360) mod 360;
	
	if(ang > 315 || ang < 45) {
	    return 0
	} else if(ang < 135) {
	    return 90
	} else if(ang < 225) {
	    return 180
	} else {
	    return 270
	}
}

/// @description player_input_ground()
function player_input_grounds() {
	var trsign, factor;

	//Lateral
	if(wall_accf){
	    trsign = sign(lengthdir_x(1,normal_direction))
	    trmagn = abs(lengthdir_x(1,normal_direction))
	}
	else{
	    trsign = 0
	    trmagn = 0
	}
	if(k_l){
	    draw_xscale = -1
	    if(trsign == -1){factor = 1}else{factor = 1 - trmagn}
	    if(groundspeed > -spd_run){
	        groundspeed -= factor*(spd_acc + spd_decc*(groundspeed > 0))
	    }
	}
	else if(k_r){
	    draw_xscale = 1
	    if(trsign ==  1){factor = 1}else{factor = 1 - trmagn}
	    if(groundspeed < spd_run){
	        groundspeed += factor*(spd_acc + spd_decc*(groundspeed < 0))
	    }
	}
	else{
	    if(abs(groundspeed) > spd_frict){
	        groundspeed -= sign(groundspeed)*spd_frict
	    }
	    else{
	        groundspeed = 0
	    }
	}
	groundspeed = clamp(groundspeed,-spd_mach,spd_mach)

	//Perpendicular
	if(k_a && onground && canjump){
	    canjump     = false
	    jumped      = true
	    jumping     = true
	    jumpspeed   = spd_jump
	    onground    = false
	    canjump     = false
	}
}


