if instance_exists(obj_RoomTransParent) or instance_exists(obj_Textbox) or instance_exists(obj_CutsceneParent) or instance_exists(obj_LevelCard) or instance_exists(obj_LevelCardNew) or instance_exists(obj_ResultsCardNew) or instance_exists(obj_LevelCardMinor) or instance_exists(obj_ResultsCard) {
	xMove = lerp(xMove, -100, 0.1);
} else {
	xMove = lerp(xMove, 0, 0.1);
}

personalBoost = lerp(personalBoost, obj_Player.boostEnergy, 0.25);

if instance_exists(obj_Player) {
	if obj_Player.rushMode == false {
		charColor = make_color_rgb(global.realR, global.realG, global.realB);
		boostColor = charColor;
	} else {
		charColor = make_color_rgb(global.realR, global.realG, global.realB);
	
		if global.SimplifyVFX == false {
			if rushTimer > 0 {
				rushTimer -= 1;
			}
	
	
			if rushTimer <= 0 {
				if rushCol {
					rushCol = false;
				} else {
					rushCol = true;
				}
		
				rushTimer = 4;
			}
		}
	}
}


