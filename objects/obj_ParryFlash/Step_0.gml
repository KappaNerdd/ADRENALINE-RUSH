if kysTimer == 1 {
	hitLag = 180;
}

//HitLag
var _time = current_time;  
while current_time - _time < hitLag {  
	
}  

if hitLag > 0 {
	hitLag -= hitLag;
}

if kysTimer > 0 {
	kysTimer--;	
} else {
	instance_destroy();
}