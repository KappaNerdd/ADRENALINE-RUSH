x += xspd;
y += yspd;

if flapTimer > 0 {
	flapTimer -= 1;
}

if flapTimer <= 0 {
	sprite_index = spr_SunriseBirdFly;
	flapTimer = random_range(60 * 3, 60 * 10);
	image_index = 0;
}

if sprite_index == spr_SunriseBirdFly {
	yspd -= 0.01;
} else {
	if yspd < termVel {
		yspd += 0.03;
	}
	
	if yspd >= termVel {
		yspd = termVel;
	}
}

if kysTimer > 0 {
	kysTimer -= 1;
}

if kysTimer <= 0 {
	instance_destroy();
}