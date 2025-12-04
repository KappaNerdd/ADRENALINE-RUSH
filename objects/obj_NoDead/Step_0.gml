getCharacterControls();


if image_alpha >= 1 {
	if hovered == true {
		sprCol = c_white;
	} else {
		sprCol = c_grey;
	}



	if hovered == true && (left_Key_Once) {
		hovered = false;
		obj_YesDead.hovered = true;
		obj_SFXManager.menuTap = true;
	}



	if hovered == true && jump_Key && !instance_exists(obj_GameOverTitleTrans) {
		instance_create_depth(x, y, depth, obj_GameOverTitleTrans)
		
		global.Death = false;
		global.DeathCountdown = 120;
		global.GameOverCountdown = 180;
		
		instance_destroy();
		instance_destroy(obj_YesDead);
		instance_destroy(obj_SpotlightDead);
		instance_destroy(obj_GameOverContinueDead);
		instance_destroy(obj_GameOverTextDead);
	}
}