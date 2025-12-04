if image_alpha < 1 && gameOverLoadConfirmed == false {
	image_alpha += 0.005;
} else if image_alpha > 0 && gameOverLoadConfirmed == true {
	image_alpha -= 0.01;
}

if image_alpha >= 1 && gameOverLoadConfirmed == false {
	gameOverLoadConfirmed = true;
	load_game(global.saveFile);
}


if image_alpha <= 0 && gameOverLoadConfirmed == true {
	instance_destroy();
}

if image_alpha < 1 && image_alpha > 0.9 {
	if file_exists(string(global.MainDataFile) + string(global.saveFile) + ".sav") && instance_exists(obj_Player) {	
		obj_Player.x = global.statData[0].save_x;
		obj_Player.y = global.statData[0].save_y;
	}
}