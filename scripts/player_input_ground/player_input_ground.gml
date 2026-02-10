/// @description player_input_ground()
function player_input_ground() {
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
