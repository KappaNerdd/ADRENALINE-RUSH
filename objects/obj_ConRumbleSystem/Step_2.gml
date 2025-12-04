if rumbleTimer > 0 {
	gamepad_set_vibration(global.Player1Con, rumblePower, rumblePower);
	
	rumbleTimer -= 1;
} else if rumbleTimer <= 0 {
	gamepad_set_vibration(global.Player1Con, 0, 0);
}