//Back from options
if place_meeting(x, y, obj_TitleCursor) && room == rm_OptionsHead && !instance_exists(obj_RoomTransParent) && (keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(0, gp_face1)) {
	obj_SFXManager.menuTap = true;
	
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
	
	if file_exists(string(global.OptionsDataFile) + ".sav") {
		file_delete(string(global.OptionsDataFile) + ".sav");
	}
	
	if file_exists(string(global.ControlsDataFile) + ".sav") {
		file_delete(string(global.ControlsDataFile) + ".sav");
	}
}