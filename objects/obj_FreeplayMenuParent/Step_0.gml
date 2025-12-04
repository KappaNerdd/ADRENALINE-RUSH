if y <= 104 {
	y = 104;
}

if y >= 104 {
	y = 104;
}

if obj_FreeplaySpeedStages.speedStageActive or obj_FreeplayActionStages.actionStageActive {
	movedX = 50;
	
	if instance_exists(obj_TitleCursor) {
		obj_TitleCursor.canMove = false;
		obj_TitleCursor.visible = false;
	}
} else {
	movedX = 800;
	
	if instance_exists(obj_TitleCursor) {
		obj_TitleCursor.canMove = true;
		obj_TitleCursor.visible = true;
	}
}

x = lerp(x, movedX, 0.05);

y += movedY;