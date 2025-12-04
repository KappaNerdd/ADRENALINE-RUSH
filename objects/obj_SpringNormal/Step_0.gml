if verti && !hori {
	if launchYspd >= 12 or launchYspd <= -12 {
		sprite_index = spr_RedSpring;
	} else {
		sprite_index = spr_YellowSpring;
	}
} else if hori && !verti {
	if launchVel >= 15 or launchVel <= -15 {
		sprite_index = spr_RedSpring;
	} else {
		sprite_index = spr_YellowSpring;
	}
} else if hori && verti {
	if (launchYspd >= 12 or launchYspd <= -12) or (launchVel >= 15 or launchVel <= -15) {
		sprite_index = spr_RedSpringDiag;
	} else {
		sprite_index = spr_YellowSpringDiag;
	}
}