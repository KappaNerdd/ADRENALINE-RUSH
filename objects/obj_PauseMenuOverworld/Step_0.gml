up_Key = keyboard_check_pressed(vk_up) or gamepad_button_check_pressed(0, gp_padu);
down_Key = keyboard_check_pressed(vk_down) or gamepad_button_check_pressed(0, gp_padd);

accept_Key = keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(0, gp_face1);
cancel_Key = keyboard_check_pressed(ord("X")) or gamepad_button_check_pressed(0, gp_face2);

close_Key = keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0, gp_start);

sprite_index = menu_Box;


//Close pause menu and save settings by pressing ENTER or start button on controller
if close_Key {
	save_options();
	instance_activate_all();
	instance_destroy();
}


//Store number of options in current menu
op_Length = array_length(option[menu_Level]);

if down_Key or up_Key {
	obj_SFXManager.menuTap = true;
}


//Move through menu
pos += down_Key - up_Key;


if pos >= op_Length {
	pos = 0;
}

if pos < 0 {
	pos = op_Length - 1;
}

if accept_Key {
	//Using the options
	
	var _sml = menu_Level
	
	
	switch(menu_Level) {
		
		//Pause Menu
		case 0:
		
		if cancel_Key {
			save_options();
			instance_activate_all(); 
			instance_destroy();
		}
		
			switch(pos) {
	
			//Resume
			case 0: save_options(); instance_activate_all(); instance_destroy(); obj_SFXManager.menuConfirm = true; break;

			//Options
			case 1: menu_Level = 1; obj_SFXManager.menuConfirm = true; break;

			//Main Menu
			case 2: menu_Level = 2; obj_SFXManager.menuConfirm = true; break;
			
			//Quit
			case 3: menu_Level = 3; obj_SFXManager.menuConfirm = true; break;

	
		}
		break;
		
		//Options Menu
		case 1:
		
		if cancel_Key {
			menu_Level = 0;
		}
		
			switch(pos) {
				
				//Audio
				case 0:
					menu_Level = 4;
					obj_SFXManager.menuConfirm = true;
				break;
				
				//Visual
				case 1:
					menu_Level = 5;
					obj_SFXManager.menuConfirm = true;
				break;
				
				//Misc
				case 2:
					menu_Level = 6;
					obj_SFXManager.menuConfirm = true;
				break;
				
				//Back
				case 3:
					menu_Level = 0;
					obj_SFXManager.menuConfirm = true;
					save_options(); 
				break;
				
				
			}
		break;
			
		//Return to Main Menu	
		case 2:
		
		if cancel_Key {
			menu_Level = 0;
		}
		
			switch(pos) {
				
				//Return to Main Menu
				case 0:
					instance_activate_all();
					instance_destroy();
					if !instance_exists(obj_RoomTransitionBasic) {
						var instantiated = instance_create_depth(0, 0, -999999, obj_RoomTransitionBasic);
						instantiated.target_rm = target_rm;
					}
				break;
				
				//Go back to previous menu
				case 1:
					menu_Level = 0;
				break;
				
				
			}
		break;
		
		//Quit Game
		case 3:
		
		if cancel_Key {
			menu_Level = 0;
		}
		
			switch(pos) {
				
				//Quit Game
				case 0:
					game_end();
				break;
				
				
				//Go back to previous menu
				case 1:
					menu_Level = 0;
				break;
			}
		break;
		
		//Audio Options
		case 4:
		
		if cancel_Key {
			menu_Level = 1;
		}
		
			switch(pos) {
				
				//Master Volume
				case 0:
					global.MASTER_VOL -= 0.1;
					obj_SFXManager.menuTap = true;
					if global.MASTER_VOL < 0 {
						global.MASTER_VOL = 1;
					}
				break;
				
				//Music Volume
				case 1:
					global.MUSIC_VOL -= 0.1;
					obj_SFXManager.menuTap = true;
					if global.MUSIC_VOL < 0 {
						global.MUSIC_VOL = 1;
					}
				break;
				
				//SFX Volume
				case 2:
					global.SFX_VOL -= 0.1;
					obj_SFXManager.menuTap = true;
					if global.SFX_VOL < 0 {
						global.SFX_VOL = 1;
					}
				break;
				
				//Text Volume
				case 3:
					global.TEXT_VOL -= 0.1;
					obj_SFXManager.menuTap = true;
					if global.TEXT_VOL < 0 {
						global.TEXT_VOL = 1;
					}
				break;
				
				//Ambience Volume
				case 4:
					global.AMBIENCE_VOL -= 0.1;
					obj_SFXManager.menuTap = true;
					if global.AMBIENCE_VOL < 0 {
						global.AMBIENCE_VOL = 1;
					}
				break;
				
				//Back
				case 5:
					menu_Level = 1;
					obj_SFXManager.menuConfirm = true;
				break;
				
			}
		break;
		
		//Visual Options
		case 5:
		
		if cancel_Key {
			menu_Level = 1;
		}
		
			switch(pos) {
				
				//Simplify VFX
				case 0:   
					if global.SimplifyVFX == true {
						global.SimplifyVFX = false;
						obj_SFXManager.menuTap = true;
					} else {
						global.SimplifyVFX = true;
						obj_SFXManager.menuTap = true;
					}
				break;
				
				//Screen Shake
				case 1:   
					if global.ScreenShake == true {
						global.ScreenShake = false;
						obj_SFXManager.menuTap = true;
					} else if global.ScreenShake == false {
						global.ScreenShake = true;
						obj_SFXManager.menuTap = true;
					}
				break;
				
				//Particles
				case 2:   
					if global.Particles == true {
						global.Particles = false;
						obj_SFXManager.menuTap = true;
					} else {
						global.Particles = true;
						obj_SFXManager.menuTap = true;
					}
				break;
				
				//Language
				case 3:
					global.Language += 1;
					if global.Language > 2 {
						global.Language = 1;
					}
				break;
				
				//Back
				case 4:
					menu_Level = 1;
					obj_SFXManager.menuConfirm = true;
				break;
				
			}
		break;
		
		case 6:
		
		if cancel_Key {
			menu_Level = 1;
		}
		
			switch(pos) {
				
				//Fullscreen
				case 0:  
					if global.FullScreen == true {
						global.FullScreen = false;
						obj_SFXManager.menuTap = true;
					} else {
						global.FullScreen = true;
						obj_SFXManager.menuTap = true;
					}
				break;
				
				
				//Song Tag
				case 1:   
					if global.SongTag == true {
						global.SongTag = false;
						obj_SFXManager.menuTap = true;
					} else if global.SongTag == false {
						global.SongTag = true;
						obj_SFXManager.menuTap = true;
					}
				break;
				
				//Controller Type
				case 2:   
					global.ConType += 1
					
					if global.ConType > 2 {
						global.ConType = 0;
					}
				break;
				
				//Controller Rumble
				case 3:   
					if global.ConRumble == true {
						global.ConRumble = false;
						obj_SFXManager.menuTap = true;
					} else if global.ConRumble == false {
						global.ConRumble = true;
						obj_SFXManager.menuTap = true;
					}
				break;
				
				//Extended Camera
				case 4:   
					if global.ExtendCamera == true {
						global.ExtendCamera = false;
						obj_SFXManager.menuTap = true;
					} else if global.ExtendCamera == false {
						global.ExtendCamera = true;
						obj_SFXManager.menuTap = true;
					}
				break;
				
				//FPS
				case 5:
					if global.FPSOn == true {
						global.FPSOn = false;	
					} else if global.FPSOn == false {
						global.FPSOn = true;
					}
					
					obj_SFXManager.menuTap = true;
				break;
				
				//Back
				case 6:
					menu_Level = 1;
					obj_SFXManager.menuConfirm = true;
				break;
				
			}
		break;
	}
		
		//Set position back
		if _sml != menu_Level {
			pos = 0;
		}
		
		//Correct options length
		//Store number of options in current menu
		op_Length = array_length(option[menu_Level]);
}


if bg_Alpha < 0.1 {
	bg_Alpha += 0.001;
}

if xspd > 0 {
	xspd -= 0.1;
}

x += xspd;