
if image_alpha < 1 {
	image_alpha += 0.05
}


if size1 > 1 {
	size1 -= 0.5;
}

if size2 > 1 {
	size2 -= 0.25;
}

if size3 > 1 {
	size3 -= 0.25;
}



if spin1 == 360 or spin1 == -360 {
	spin1 = 0;
}

if spin2 == 360 or spin2 == -360 {
	spin2 = 0;
}

if spin3 == 360 or spin3 == -360 {
	spin3 = 0;
}


spin1 += spinner1;
spin2 += spinner2;
spin3 += spinner3;


if !instance_exists(lockOnTarget) {
	instance_destroy();
}

if instance_exists(lockOnTarget) {
	x = lockOnTarget.x;
	y = lockOnTarget.y;
}