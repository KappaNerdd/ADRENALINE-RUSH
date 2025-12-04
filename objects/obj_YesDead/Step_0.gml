getCharacterControls();




if image_alpha >= 1 {
	if hovered == true {
		sprCol = c_white;
	} else {
		sprCol = c_grey;
	}



	if hovered == true && (right_Key_Once) {
		hovered = false;
		obj_NoDead.hovered = true;
		obj_SFXManager.menuTap = true;
	}



	if hovered == true && jump_Key && !instance_exists(obj_GameOverExtraLivesDead) {
		instance_create_depth(x, y, depth, obj_GameOverExtraLivesDead);
		
		global.Death = false;
		global.DeathCountdown = 120;
		global.GameOverCountdown = 180;
		
		instance_destroy();
		instance_destroy(obj_NoDead);
		instance_destroy(obj_GameOverContinueDead);
		instance_destroy(obj_GameOverTextDead);
	}
}