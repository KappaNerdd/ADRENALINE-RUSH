if alphCheck {
	if image_alpha < 0.6 {
		image_alpha += 0.01;
	}
} else {
	if image_alpha > 0 {
		image_alpha -= 0.01;
	}
}