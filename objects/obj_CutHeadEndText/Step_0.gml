if !alphaDown {
	if image_alpha < 1 {
		image_alpha += changeAlpha;
	}
	
	if image_alpha >= 1 {
		alphaDown = true;
	}
} else {
	if image_alpha > 0 {
		image_alpha -= changeAlpha;
	}
	
	if image_alpha <= 0 {
		instance_destroy();
	}
}


x += xspd;
y += yspd;