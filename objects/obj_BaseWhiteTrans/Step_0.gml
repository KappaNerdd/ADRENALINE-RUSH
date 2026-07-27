if !transed {
	if image_alpha < 1 {
		image_alpha += 0.05 * division;
	} else {
		transed = true;
		room_goto(target_rm);
	}
} else {
	if image_alpha > 0 {
		image_alpha -= 0.05 * division;
	} else {
		instance_destroy();
	}
}