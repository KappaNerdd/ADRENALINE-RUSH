//If obj_LevelCard doesn't exist, kill yourself NOW
if !instance_exists(obj_LevelCardMinor) {
	instance_destroy();
}

if checked == false {
	global.countUp = true;
	
	if image_alpha < 1 {
		image_alpha += 0.01;
	}
	
	if image_alpha >= 1 {
		timer -= 1;
	}
	
	if timer <= 0 {
		checked = true;
	}
	
} else if checked == true {
	if image_alpha > 0 {
		image_alpha -= 0.01;
	}
}

if image_alpha <= 0 && checked == true {
	instance_destroy(obj_LevelCardMinor);
}


yChange = lerp(yChange, 20, 0.1);