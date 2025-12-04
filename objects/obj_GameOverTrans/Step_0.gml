if image_alpha < 1 && gameOverConfirmed == false {
	image_alpha += 0.003;
} else if image_alpha > 0 && gameOverConfirmed == true {
	image_alpha -= 0.01;
}

if image_alpha >= 1 {
	gameOverConfirmed = true;
	room_goto(rm_GameOver);
}


if image_alpha <= 0 && gameOverConfirmed == true {
	instance_destroy();
}