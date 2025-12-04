getCharacterControls();

if waitTimer > 0 {
	waitTimer -= 1;
}


if waitTimer <= 0 {
	visible = true;
	
	if jump_Key or pause_Key {
		game_restart();
	}
}