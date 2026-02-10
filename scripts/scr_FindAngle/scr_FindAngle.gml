function scr_FindAngle() {
	angle = round(argument0 / 8) * 8;
	hspace = argument1;
	check = argument2;
	
	acos = cos(degtorad(angle));
	asin = sin(degtorad(angle));
	
	x1 = round(x - (acos * hspace));
	y1 = round(y + (asin * hspace));
	x2 = round(x + (acos * hspace));
	y2 = round(y - (asin * hspace));
	
	done1 = 0;
	done2 = 0;

	i = check;
	while(i > 0) {	
		if !done1 {
			if collision_point(x1, y1, obj_Solid, true, true) done1 = true;
			x1 += asin;
			y1 += acos
		}
		
		if !done2 {
			if collision_point(x2, y2, obj_Solid, true, true) done2 = true;
			x2 += asin;
			y2 += acos
		}
		
		if done1 && done2 break;
		i -= 1;
	}
	
	return round(point_direction(x1, y1, x2, y2));
}


/*function scr_ChangeDrawAngle() {
	var _slopeCollWide = place_meeting(x, y + yspd, obj_SlopeStairsWide) or place_meeting(x, y + yspd, obj_RailCollSlopeWide);
	var _slopeCollWideR = place_meeting(x, y + yspd, obj_SlopeStairsWideR) or place_meeting(x, y + yspd, obj_RailCollSlopeWideR);
	var _slopeColl = place_meeting(x, y + yspd, obj_SlopeStairs) or place_meeting(x, y + yspd, obj_RailCollSlope);
	var _slopeCollR = place_meeting(x, y + yspd, obj_SlopeStairsR) or place_meeting(x, y + yspd, obj_RailCollSlopeR);
	var _slopeCollSteep = place_meeting(x, y + yspd, obj_SlopeStairsSteep) or place_meeting(x, y + yspd, obj_RailCollSlopeSteep);
	var _slopeCollSteepR = place_meeting(x, y + yspd, obj_SlopeStairsSteepR) or place_meeting(x, y + yspd, obj_RailCollSlopeSteepR);
	
	if ground {
		if _slopeCollWide {
			changingAngle = 22.5;
		}
	
		if _slopeCollWideR {
			changingAngle = -22.5;
		}
	
		if _slopeColl {
			changingAngle = 45;
		}
	
		if _slopeCollR {
			changingAngle = -45;
		}
	
		if _slopeCollSteep {
			changingAngle = 77.5;
		}
	
		if _slopeCollSteepR {
			changingAngle = -77.5;
		}
	}
	
	if !ground or (!_slopeCollWide && !_slopeCollWideR && !_slopeColl && !_slopeCollR && !_slopeCollSteep && !_slopeCollSteepR) {
		changingAngle = 0;
	}
	
}


//Fuck with momentum
function scr_SlopeMomentum() {
/*	var _slopeCollWide = place_meeting(x, y + yspd, obj_SlopeStairsWide) or place_meeting(x, y + yspd, obj_RailCollSlopeWide);
	var _slopeCollWideR = place_meeting(x, y + yspd, obj_SlopeStairsWideR) or place_meeting(x, y + yspd, obj_RailCollSlopeWideR);
	var _slopeColl = place_meeting(x, y + yspd, obj_SlopeStairs) or place_meeting(x, y + yspd, obj_RailCollSlope);
	var _slopeCollR = place_meeting(x, y + yspd, obj_SlopeStairsR) or place_meeting(x, y + yspd, obj_RailCollSlopeR);
	var _slopeCollSteep = place_meeting(x, y + yspd, obj_SlopeStairsSteep) or place_meeting(x, y + yspd, obj_RailCollSlopeSteep);
	var _slopeCollSteepR = place_meeting(x, y + yspd, obj_SlopeStairsSteepR) or place_meeting(x, y + yspd, obj_RailCollSlopeSteepR);
	
	
	if ground {
	
		if _slopeCollWide or _slopeCollWideR {
			jspd = abs(vel) * -1.0001;
		}
	
		if _slopeColl or _slopeCollR {
			jspd = abs(vel) * -1.001;
		}
	
		if _slopeCollSteep or _slopeCollSteepR {
			jspd = abs(vel) * -1.01;
		}
	}
	
	if !_slopeCollWide && !_slopeCollWideR && !_slopeColl && !_slopeCollR && !_slopeCollSteep && !_slopeCollSteepR {
		jspd = normalJspd;
	}
}