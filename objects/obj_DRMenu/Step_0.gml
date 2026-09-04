getCharacterControls();

if !menuDone {
	#region //Animations
		#region //Sonic Rush Spikes
			if !global.SimplifyVFX {
				srSpikesIndex++;
				
				if srSpikesIndex >= 20 {
					srSpikesIndex = 0;
				}
			}
			
			menuY = lerp(menuY, 0, 0.1);
		#endregion
	
		#region //Base Menu
			for(var i = 0; i < menuCount; i++) {
				var _extraX = 0;
			
				if menuChoice == i {
					_extraX = 30;
				}
			
			    if menuTimer >= menuDelay[i] {
			        menuX[i] = lerp(menuX[i], 50 + _extraX, 0.1);
			    } else {
					menuX[i] = lerp(menuX[i], -200, 0.1);
				}
			}
			
			charX = lerp(charX, 150, 0.1);
		
			if !item && !pow && !equip {
				if menuTimer < 40 {
					menuTimer++;
				}
				
				tarSOULX = 150;
				tarSOULY = 50 + (230 / menuCount) * menuChoice;
			} else {
				if menuTimer > 0 {
					menuTimer--;
				}
			}
			
			
		#endregion
	#endregion
	
	if !instance_exists(obj_NewOptions) {
		#region //Navigate
			if down_Key or up_Key or right_Key or left_Key {
				moveTimer--;
			} else {
				moveTimer = 1;
			}
	
			if moveTimer <= 0 {
				moveTimer = moveFrames;
				
				if !item && !pow && !equip {
					#region //Base Menu
						obj_SFXManager.homingLockOn = true;
					
						if down_Key {
							if menuChoice < menuCount - 1 {
								menuChoice++;
							} else {
								menuChoice = 0;
							}
						}
					
						if up_Key {
							if menuChoice > 0 {
								menuChoice--;
							} else {
								menuChoice = menuCount - 1;
							}
						}
					#endregion
				}
			}
		#endregion
	
		#region //Confirm
			if jump_Key or pause_Key {
				#region //Base Menus
					switch(menus[menuChoice][0]) {
						case "dr_Items":
							if array_length(global.DRItems) > 0 {
								obj_SFXManager.menuConfirm = true;
							} else {
								obj_SFXManager.menuCancel = true;
							}
						break;
						
						case "dr_Equip":
							
						break;
						
						case "dr_Power":
							
						break;
						
						case "title_Options":
							instance_create_depth(-1000, 0, -2, obj_NewOptions);
							obj_SFXManager.menuConfirm = true;
						break;
					}
				#endregion
			}
		#endregion
	
		#region //Cancel
			if action_Key {
				if !item && !pow && !equip {
					obj_SFXManager.UNDERTALEBombFly = true;
					menuDone = true;
					scr_SetCharDRMove(true, true, false, false);
				}
			}
		#endregion
		
		#region //Alt Close Menu
			if action1_Key {
				if !item && !pow && !equip {
					obj_SFXManager.UNDERTALEBombFly = true;
					menuDone = true;
					scr_SetCharDRMove(true, true, false, false);
				}
			}
		#endregion
	}
} else {
	for(var i = 0; i < menuCount; i++) {
		menuX[i] = lerp(menuX[i], -200, 0.2);
	}
	
	menuY = lerp(menuY, 400, 0.2);
	charX = lerp(charX, 0, 0.15);
	
	tarSOULX = scr_GetCharCamX();
	tarSOULY = scr_GetCharCamY();
	
	if menuY > 299.5 {
		scr_DRSOULVFX(global.DRPlayerID, global.DRPlayerID.soulSpr[SOUL.SIL]);
		instance_destroy();
	}
}