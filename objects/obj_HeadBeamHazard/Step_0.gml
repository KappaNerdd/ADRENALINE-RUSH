if activeTimer > 0 {
	activeTimer -= 1;
	
	if global.Particles {
		if hori && !verti {
			with(instance_create_depth(x - sprite_width / 2 + random(sprite_width), y, depth + 1, obj_HeadBeamGlitches)) {
				yspd = random_range(-5, 5);
			}
		} else if !hori && verti {
			with(instance_create_depth(x, y - sprite_height / 2 + random(sprite_height), depth + 1, obj_HeadBeamGlitches)) {
				xspd = random_range(-5, 5);
			}
		}
	}
}

if activeTimer <= 0 {
	image_alpha -= 0.05;
	
	if hori && !verti {
		if image_yscale > 0 {
			image_yscale -= 0.1;
		}
	} else if !hori && verti {
		if image_xscale > 0 {
			image_xscale -= 0.1;
		}
	}
}

if image_alpha <= 0 {
	with(instance_create_depth(x, y, depth, obj_BeamWarning)) {
		makeHori = other.hori;
		makeVerti = other.verti;
		image_xscale = other.changeXScale;
		image_yscale = other.changeYScale;
	}
	
	instance_destroy()
}
