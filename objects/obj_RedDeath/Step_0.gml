//HitLag
var _time = current_time;  
while current_time - _time < hitLag {  
	
}  

if hitLag > 0 {
	hitLag -= hitLag;
}

if !createDeath {
	scr_ControllerRumble(0.5);
	scr_ScreenShake(0.75);
	
	createDeath = true;
} else {
	if image_alpha > 0 {
		image_alpha -= 0.05;
	}
}