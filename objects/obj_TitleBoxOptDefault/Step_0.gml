getCharacterControls();

sprite_index = obj_TitleBoxParent.sprite_index;


if place_meeting(x, y, obj_TitleCursor) && global.TitleOpt == "OPTIONS" {
	image_blend = c_blue;
	
	if !hovered {
		obj_SFXManager.homingLockOn = true;
		hovered = true;
	}
	
	if action3_Key {
		obj_SFXManager.menuPop = true;
					
		if file_exists(string(global.OptionsDataFile) + ".sav") {
			file_delete(string(global.OptionsDataFile) + ".sav");
		}
	
		if file_exists(string(global.ControlsDataFile) + ".sav") {
			file_delete(string(global.ControlsDataFile) + ".sav");
		}
		
		//Audio
		global.MASTER_VOL = 1;
		global.MUSIC_VOL = 1;
		global.SFX_VOL = 1;
		global.TEXT_VOL = 1;
		global.AMBIENCE_VOL = 1;
		global.UniquePauseTheme = false;

		//Visual
		global.SimplifyVFX = false;
		global.ScreenShake = true;
		global.Particles = true;
		global.Language = 1;

		//Misc
		global.FullScreen = false;
		global.SongTag = true;
		global.ConRumble = true
		global.ConType = 0;
		global.ExtendCamera = true;
		global.FPSOn = true;
		global.ControllerOnly = false;
		global.KeyboardP1 = false;

		//Controls
		global.ConDeadZone = 0.5;
		global.TrigDeadZone = 0.5;


		///-----Speed & Menu-----///

		//Controls Keyboard
		global.LeftKeySpeed = vk_left;
		global.RightKeySpeed = vk_right;
		global.UpKeySpeed = vk_up;
		global.DownKeySpeed = vk_down;
		global.JumpKeySpeed = ord("Z");
		global.ActionKeySpeed = ord("X");
		global.Action1KeySpeed = ord("C");
		global.Action2KeySpeed = vk_space;
		global.Action3KeySpeed = ord("V");
		global.Action4KeySpeed = vk_lshift;
		global.PauseKeySpeed = vk_enter;
		global.SelectKeySpeed = vk_tab;


		//Controls Controller
		global.LeftPadSpeed = gp_padl;
		global.RightPadSpeed = gp_padr;
		global.UpPadSpeed = gp_padu;
		global.DownPadSpeed = gp_padd;
		global.JumpButtonSpeed = gp_face1;
		global.ActionButtonSpeed = gp_face2;
		global.Action1ButtonSpeed = gp_face3;
		global.Action2ButtonSpeed = gp_shoulderr;
		global.Action3ButtonSpeed = gp_face4;
		global.Action4ButtonSpeed = gp_shoulderl;
		global.PauseButtonSpeed = gp_start;
		global.SelectButtonSpeed = gp_select;
	}
	
	if jump_Key && obj_TitleCursor.canMove {
		obj_SFXManager.menuPop = true;
		
		file_delete("TBAHSOptionsData.sav");
		file_delete("TBAHSOptionsControls.sav");
		
		//Audio
		global.MASTER_VOL = 1;
		global.MUSIC_VOL = 1;
		global.SFX_VOL = 1;
		global.TEXT_VOL = 1;
		global.AMBIENCE_VOL = 1;
		global.UniquePauseTheme = false;

		//Visual
		global.SimplifyVFX = false;
		global.ScreenShake = true;
		global.Particles = true;
		global.Language = 1;

		//Misc
		global.FullScreen = false;
		global.SongTag = true;
		global.ConRumble = true
		global.ConType = 0;
		global.ExtendCamera = true;
		global.FPSOn = true;
		global.ControllerOnly = false;
		global.KeyboardP1 = false;

		//Controls
		global.ConDeadZone = 0.5;
		global.TrigDeadZone = 0.5;


		///-----Speed & Menu-----///

		//Controls Keyboard
		global.LeftKeySpeed = vk_left;
		global.RightKeySpeed = vk_right;
		global.UpKeySpeed = vk_up;
		global.DownKeySpeed = vk_down;
		global.JumpKeySpeed = ord("Z");
		global.ActionKeySpeed = ord("X");
		global.Action1KeySpeed = ord("C");
		global.Action2KeySpeed = vk_space;
		global.Action3KeySpeed = ord("V");
		global.Action4KeySpeed = vk_lshift;
		global.PauseKeySpeed = vk_enter;
		global.SelectKeySpeed = vk_tab;


		//Controls Controller
		global.LeftPadSpeed = gp_padl;
		global.RightPadSpeed = gp_padr;
		global.UpPadSpeed = gp_padu;
		global.DownPadSpeed = gp_padd;
		global.JumpButtonSpeed = gp_face1;
		global.ActionButtonSpeed = gp_face2;
		global.Action1ButtonSpeed = gp_face3;
		global.Action2ButtonSpeed = gp_shoulderr;
		global.Action3ButtonSpeed = gp_face4;
		global.Action4ButtonSpeed = gp_shoulderl;
		global.PauseButtonSpeed = gp_start;
		global.SelectButtonSpeed = gp_select;
	}
} else {
	image_blend = c_white;
	hovered = false;
}


if global.TitleOpt != "OPTIONS" {
	if y < mainY + 100 {
		y += 10;
	}
	
	if y >= mainY + 100 {
		y = mainY + 100;
	}
} else {
	if y > mainY {
		y -= 10;
	}
	
	if y <= mainY {
		y = mainY;
	}
}