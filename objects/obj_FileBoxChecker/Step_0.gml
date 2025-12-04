if yspd > 0 {
	yspd -= 0.5;
}

if yspd > 25 {
	obj_TitleNewHead.newGame = false;
	obj_TitleCursor.canMove = true;
	instance_destroy();
}

y += yspd;



if instance_exists(obj_FileBoxYes) {
	if obj_FileBoxYes.confirmed == true {
		if restartTimer > 0 {
			restartTimer -= 1;
		}
	}
}

if restartTimer <= 0 {
	game_restart();
}