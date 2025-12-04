if instance_exists(obj_CutsceneParent) or instance_exists(obj_Textbox) {
	if !active {
		active = true;
		bar1Yspd = 2.25;
		bar2Yspd = -2.25;
	}
} else {
	if active {
		active = false;
		bar1Yspd = -2.25;
		bar2Yspd = 2.25;
	}
}


if active {
	if bar1Yspd > 0 {
		bar1Yspd -= 0.05;
	}
	
	if bar1Yspd <= 0 {
		bar1Yspd = 0;
	}
	
	if bar2Yspd < 0 {
		bar2Yspd += 0.05;
	}
	
	if bar2Yspd >= 0 {
		bar2Yspd = 0;
	}
} else {
	if bar1Yspd < 0 {
		bar1Yspd += 0.05;
	}
	
	if bar1Yspd >= 0 {
		bar1Yspd = 0;
	}
	
	if bar2Yspd > 0 {
		bar2Yspd -= 0.05;
	}
	
	if bar2Yspd <= 0 {
		bar2Yspd = 0;
	}
}


bar1Y += bar1Yspd;
bar2Y += bar2Yspd;