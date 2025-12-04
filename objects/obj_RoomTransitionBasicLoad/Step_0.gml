if image_index <= 1 {
	instance_destroy();
	
	if instance_exists(obj_Player) {
		obj_Player.can_MoveFULL = true;
		obj_Player.can_Move = true;
	}
}

if image_index <= 15 && image_index > 10 {
	if file_exists(string(global.MainDataFile) + string(global.saveFile) + ".sav") {
		if instance_exists(obj_Player) {
			obj_Player.x = global.statData[0].save_x;
			obj_Player.y = global.statData[0].save_y;
		}
	}
}