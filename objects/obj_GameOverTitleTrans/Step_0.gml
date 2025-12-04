if image_alpha < 1 && gameOverTitleConfirmed == false {
	image_alpha += 0.005;
} else if image_alpha > 0 && gameOverTitleConfirmed == true {
	image_alpha -= 0.02;
}

if image_alpha >= 1 && gameOverTitleConfirmed == false {
	gameOverTitleConfirmed = true;
	game_restart();
}


if image_alpha <= 0 && gameOverTitleConfirmed == true {
	instance_destroy();
}