scr_GetCharLives();


if image_alpha < 1 && livesConfirmed == false {
	image_alpha += 0.01;
} else if image_alpha > 0 && livesConfirmed == true && afterLives <= 0 {
	image_alpha -= 0.01;
}


if file_exists("TBAHSSaveData" + string(global.saveFile) + ".sav") {
	if image_alpha <= 0 && livesConfirmed == true {
		if !instance_exists(obj_GameOverLoadTrans) {
			instance_create_depth(x, y, depth, obj_GameOverLoadTrans);
		}
	
		instance_destroy();
	}
} else {
	if image_alpha <= 0 && livesConfirmed == true {
		game_restart();
		
		instance_destroy();
	}
}
	

if image_alpha >= 1 && beforeLives > 0 {
	beforeLives -= 1;
}

if livesConfirmed == true && afterLives > 0 {
	afterLives -= 1;
}


if image_alpha >= 1 && global.PlayerExtraLives < global.statData.player_ExtraLives && livesConfirmed == false && beforeLives <= 0 {
	if livesTimer > 0 {
		livesTimer -= 1;
	}
	
	if livesTimer <= 0 {
		global.PlayerExtraLives += 1;
		obj_SFXManager.menuConfirm = true;
		livesTimer = 15;
	}
}

if global.PlayerExtraLives == global.statData.player_ExtraLives {
	livesConfirmed = true;
}

if livesConfirmed == true && afterLives > 0 {
	afterLives -= 1;
}