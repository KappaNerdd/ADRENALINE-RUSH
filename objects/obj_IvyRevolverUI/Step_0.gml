/*if instance_exists(obj_RoomTransParent) or instance_exists(obj_Textbox) or instance_exists(obj_CutsceneParent) or instance_exists(obj_LevelCard) or instance_exists(obj_ResultsCard) {
	visible = false;
} else {
	visible = true;
}*/

if alphaTimer > 0 {
	alphaTimer -= 1;
	image_alpha = 1;
} else {
	if image_alpha > 0.5 {
		image_alpha -= 0.01;
	}
}

if !obj_Player.fullCharge {
	newX = obj_Player.x;
	newY = obj_Player.y - 30;
	
	if !obj_Player.reload {
		if obj_Player.revolverAmmo == 6 {
			worldRevolving = 0;
			image_index = 0;
		} else if obj_Player.revolverAmmo == 5 {
			worldRevolving = 60;
			image_index = 1;
		} else if obj_Player.revolverAmmo == 4 {
			worldRevolving = 120;
			image_index = 2;
		} else if obj_Player.revolverAmmo == 3 {
			worldRevolving = 180;
			image_index = 3;
		} else if obj_Player.revolverAmmo == 2 {
			worldRevolving = 240;
			image_index = 4;
		} else if obj_Player.revolverAmmo == 1 {
			worldRevolving = 300;
			image_index = 5;
		} else if obj_Player.revolverAmmo == 0 {
			worldRevolving = 360;
			image_index = 6;
		}
	
		currentRoundAngle = lerp(currentRoundAngle, worldRevolving, 0.1);
	
	} else {
		currentRoundAngle -= 10;
		image_index = 6;
	}
} else {
	newX = obj_Player.x;
	newY = obj_Player.y - 30;
	
	currentRoundAngle += 25;
	
	if currentRoundAngle >= 360 {
		currentRoundAngle = 0;
	}
	
	
	if alphaChange >= 1 && !alphaBull {
		alphaBull = true;
	} else if alphaChange <= 0 && alphaBull {
		alphaBull = false;
	}
	
	
	if alphaBull {
		if alphaChange > 0 {
			alphaChange -= 0.01;
		}
	} else {
		if alphaChange < 1 {
			alphaChange += 0.01;
		}
	}
}