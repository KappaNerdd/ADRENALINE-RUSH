getCharacterControls();

///-----Pause Menu-----///
if (pause_Key) {
	if instance_exists(obj_Textbox) or global.Death or instance_exists(obj_SonicRushIntroCard) or instance_exists(obj_LevelCardNew) or instance_exists(obj_ResultsCardNew) or instance_exists(obj_LevelCard) or instance_exists(obj_ResultsCard) or instance_exists(obj_RoomTransParent) {
		exit;
	} else { 
		if !instance_exists(obj_NewerPauseMenu) {
			instance_create_depth(-100000, 0, depth, obj_NewerPauseMenu);
		}
	}
}



//Old
/*if (keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0, gp_start)) {
	if instance_exists(obj_Textbox) or instance_exists(obj_LevelCard) or instance_exists(obj_ResultsCard) or instance_exists(obj_RoomTransParent) or instance_exists(obj_CutsceneParent) {
		exit;
	} else { 
		if !instance_exists(obj_PauseMenuOverworld) {
			instance_create_depth(x, y, -10000000, obj_PauseMenuOverworld);
		}
	}
}