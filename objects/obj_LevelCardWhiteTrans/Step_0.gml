getCharacterControls();

if transTimer > 0 {
	transTimer -= 1;
}

if transTimer <= 0 {
	if opacity < 1 && opacityChecked == false {
		opacity += 0.06;
	}

	if opacity >= 1 {
		opacityChecked = true;
	}

	if opacityChecked == true {
		opacity -= 0.06;
	}

	if opacityChecked == true && instance_exists(obj_LevelCard) {
		instance_destroy(obj_LevelCard);
	}
	
	if opacity <= 0 {
		instance_destroy();
		
		if global.PlayerChar == 0 or global.MIND {
			instance_create_depth(x, y, depth, obj_CountdownHead);
		} else {
			instance_create_depth(x, y, depth, obj_Countdown);
		}
	}
}

if (jump_Key) && transTimer != 0 {
	transTimer = 0;
}