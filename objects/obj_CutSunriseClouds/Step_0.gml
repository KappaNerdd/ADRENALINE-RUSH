x += xspd;

if kysTimer > 0 {
	kysTimer -= 1;
}

if kysTimer <= 0 {
	instance_destroy();
}