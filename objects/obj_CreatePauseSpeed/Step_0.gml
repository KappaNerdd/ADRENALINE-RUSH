getCharacterControls();

///-----Pause Menu-----///
if (pause_Key) {
	if instance_exists(obj_Textbox) or instance_exists(obj_LevelCardNew) or instance_exists(obj_ResultsCardNew) or instance_exists(obj_LevelCard) or instance_exists(obj_ResultsCard) or instance_exists(obj_RoomTransParent) {
		exit;
	} else { 
		if !instance_exists(obj_NewerPauseMenu) {
			instance_create_depth(-1000000, 0, depth, obj_NewerPauseMenu);
		}
	}
}


//Old
/*if (keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0, gp_start)) {
	if instance_exists(obj_Textbox) or instance_exists(obj_LevelCard) or instance_exists(obj_ResultsCard) or instance_exists(obj_RoomTransParent) or instance_exists(obj_CutsceneParent) or obj_Player.prepare == true {
		exit;
	} else {
		if global.LevelForced == false {
			if !instance_exists(obj_PauseMenuSpeed) {
				instance_create_depth(x, y, -10000000, obj_PauseMenuSpeed);
			}
		} else if global.LevelForced == true {
			if !instance_exists(obj_PauseMenuSpeedForced) {
				instance_create_depth(x, y, -10000000, obj_PauseMenuSpeedForced);
			}
		}
	}
}