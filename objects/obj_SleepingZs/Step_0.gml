var _floatX = 0

floatDirX += floatPower;
_floatX = dsin(floatDirX);


var _floatY = 0;

floatDir += floatPower;
_floatY = dsin(floatDir);


if increaseAlph {
	if image_alpha < 1 {
		image_alpha += 0.015;
	}
	
	if image_alpha >= 1 {
		increaseAlph = false;
	}
} else {
	if image_alpha > 0 {
		image_alpha -= 0.015;
	}
	
	if image_alpha <= 0 {
		instance_destroy();
	}
}


x += xspd + _floatX;
y += yspd + _floatY;