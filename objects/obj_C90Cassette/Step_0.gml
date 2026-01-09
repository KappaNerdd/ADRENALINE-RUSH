if !alive {
	if doneTimer > 0 {
		doneTimer--;
		
		yspd -= 0.25;
		
		if yspd <= -5 {
			yspd = -5;
		}
		
		y += yspd;
	}
}