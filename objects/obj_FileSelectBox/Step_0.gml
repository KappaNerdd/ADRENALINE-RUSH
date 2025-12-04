x = obj_FileSelectParent.x + movedX;
y = obj_FileSelectParent.y + movedY;

getCharacterControls();

var _bgCol = make_color_rgb(obj_FileSelectSideBar.localR, obj_FileSelectSideBar.localG, obj_FileSelectSideBar.localB);


if !global.copyFile && global.copyingFile {
	global.copyingFile = false;
	room_restart();
	scr_LoadFiles();
}


if !global.deleteFile && global.deletingFile {
	global.deletingFile = false;
	room_restart();
	scr_LoadFiles();
}



if !global.copyFile && !global.deleteFile {
	if !fileConfirmed {
		if place_meeting(x, y, obj_TitleCursor) {
			with(obj_TitleCursor) {
				if !place_meeting(x, y, obj_FileSelectUI) && !place_meeting(x, y, obj_FileSelectCopy) && !place_meeting(x, y, obj_FileSelectDelete) && !place_meeting(x, y, obj_FileSelectArrow) {
					other.image_blend = c_white;
					other.confirmColor = c_white;
	
					if !other.fileHovered {
						other.fileHovered = true;
						obj_SFXManager.homingLockOn = true;
					}
	
					if other.jump_Key or device_mouse_check_button_pressed(0, mb_left) {
						obj_SFXManager.funkinCheckpoint = true;
						set_song_ingame(noone, 120, 0);
						global.saveFile = other.fileNum;
						other.fileConfirmed = true;
						instance_destroy();
					}
				} else {
					other.image_blend = c_grey;
					other.confirmColor = c_grey;
	
					if other.fileHovered {
						other.fileHovered = false;
					}
				}
			}
		} else {
			image_blend = c_grey;
			confirmColor = c_grey;
	
			if fileHovered {
				fileHovered = false;
			}
		}
	}


	if fileConfirmed {
		if !global.SimplifyVFX {
			if colorTimer > 0 {
				colorTimer -= 1;
			}
		
			if colorTimer <= 0 {
				colorTimer = 5;
			
				if !confirming {
					confirmColor = c_white;
					confirming = true;
				} else {
					confirmColor = _bgCol;
					confirming = false;
				}
			}
		}
	
	
		if confirmedTimer > 115 {
			if file_exists(string(global.MainDataFile) + string(global.saveFile) + ".sav") {
				load_Speed_Stage(global.saveFile);
			}
		}
	
		if confirmedTimer > 0 {
			confirmedTimer -= 1;
		}
	
		if confirmedTimer <= 0 {
			if !instance_exists(obj_RoomTransitionSEGAMenu) {
				var instantiated = instance_create_depth(0, 0, -99999999, obj_RoomTransitionSEGAMenu);
			
				if file_exists(string(global.MainDataFile) + string(global.saveFile) + ".sav") {
					if !file_exists(string(global.NoMindDataFile) + string(global.saveFile) + ".sav") {
						instantiated.target_rm = rm_Splash1;
					} else {
						instantiated.target_rm = rm_Splash1Normal;
					}
				} else {
					instantiated.target_rm = rm_SplashDisc;
				}
			}
		}
	}
} else if global.copyFile {
	if place_meeting(x, y, obj_TitleCursor) {
		global.saveFile = fileNum;
		image_blend = c_white;
		
		if !fileHovered {
			fileHovered = true;
			obj_SFXManager.homingLockOn = true;
		}
		
		
		if !global.copyingFile {
			if jump_Key or device_mouse_check_button_pressed(0, mb_left) {
				if !file_exists(string(global.MainDataFile) + string(global.saveFile) + ".sav") {
					obj_SFXManager.menuCancel = true;
					image_blend = c_red;
				} else {
					obj_SFXManager.menuPop = true;
					image_blend = _bgCol;
				
					global.copiedFileNum = fileNum;
				
					global.playerCopy = player;
					global.playerCostumeCopy = playerCostume;
					global.playerSpriteCopy = playerSprite;
					global.TextboxSprCopy = textboxSpr;
					
					global.partnerCopy = partner;
					global.partnerCostumeCopy = partnerCostume;
					
					global.partner2Copy = partner2;
					global.partner2CostumeCopy = partner2Costume;
				
					global.playerNameCopy = playerName;
					global.secondsCopy = seconds;
					global.minutesCopy = minutes;
					global.hoursCopy = hours;
					global.playHealthCopy = playHealth;
					global.playExtraLivesCopy = playExtraLives;

					global.savRMCopy = savRM;
				
					global.copyingFile = true;
				}
			}
		} else {
			if jump_Key or device_mouse_check_button_pressed(0, mb_left) {
				if global.copiedFileNum == global.saveFile {
					obj_SFXManager.funkinLocked = true;
					image_blend = c_red;
				} else {
					obj_SFXManager.rushTrickFinish = true;
					
					if file_exists(string(global.MainDataFile) + string(global.copiedFileNum) + ".sav") {
						file_copy(string(global.MainDataFile) + string(global.copiedFileNum) + ".sav", string(global.MainDataFile) + string(global.saveFile) + ".sav");
					}
	
					//Delete saved rank data
					if file_exists(string(global.SpeedDataFile) + string(global.copiedFileNum) + ".sav") {
						file_copy(string(global.SpeedDataFile) + string(global.copiedFileNum) + ".sav", string(global.SpeedDataFile) + string(global.saveFile) + ".sav");
					}
	
					//Delete saved rank data
					if file_exists(string(global.ActionDataFile) + string(global.copiedFileNum) + ".sav") {
						file_copy(string(global.ActionDataFile) + string(global.copiedFileNum) + ".sav", string(global.ActionDataFile) + string(global.saveFile) + ".sav");
					}
					
					if file_exists(string(global.NoMindDataFile) + string(global.copiedFileNum) + ".sav") {
						file_copy(string(global.NoMindDataFile) + string(global.copiedFileNum) + ".sav", string(global.NoMindDataFile) + string(global.saveFile) + ".sav");
					}
				
				
					if global.saveFile == 1 {
						global.file1.player_Char = global.playerCopy;
						global.file1.player_Costume = global.playerCostumeCopy;
						global.file1.player_Sprite = global.playerSpriteCopy;
						global.file1.textbox_Spr = global.TextboxSprCopy;
						
						global.file1.partner_Char = global.partnerCopy;
						global.file1.partner_Costume = global.partnerCostumeCopy;
						
						global.file1.partner2_Char = global.partner2Copy;
						global.file1.partner2_Costume = global.partner2CostumeCopy;

						global.file1.player_Name = global.playerNameCopy;
						global.file1.player_TimeSeconds = global.secondsCopy;
						global.file1.player_TimeMinutes = global.minutesCopy;
						global.file1.player_TimeHours = global.hoursCopy;
						global.file1.player_Health = global.playHealthCopy;
						global.file1.player_ExtraLives = global.playExtraLivesCopy;

						global.file1.save_rm = global.savRMCopy;
					}
				
					if global.saveFile == 2 {
						global.file2.player_Char = global.playerCopy;
						global.file2.player_Costume = global.playerCostumeCopy;
						global.file2.player_Sprite = global.playerSpriteCopy;
						global.file2.textbox_Spr = global.TextboxSprCopy;
						
						global.file2.partner_Char = global.partnerCopy;
						global.file2.partner_Costume = global.partnerCostumeCopy;
						
						global.file2.partner2_Char = global.partner2Copy;
						global.file2.partner2_Costume = global.partner2CostumeCopy;

						global.file2.player_Name = global.playerNameCopy;
						global.file2.player_TimeSeconds = global.secondsCopy;
						global.file2.player_TimeMinutes = global.minutesCopy;
						global.file2.player_TimeHours = global.hoursCopy;
						global.file2.player_Health = global.playHealthCopy;
						global.file2.player_ExtraLives = global.playExtraLivesCopy;

						global.file2.save_rm = global.savRMCopy;
					}
				
					if global.saveFile == 3 {
						global.file3.player_Char = global.playerCopy;
						global.file3.player_Costume = global.playerCostumeCopy;
						global.file3.player_Sprite = global.playerSpriteCopy;
						global.file3.textbox_Spr = global.TextboxSprCopy;
						
						global.file3.partner_Char = global.partnerCopy;
						global.file3.partner_Costume = global.partnerCostumeCopy;
						
						global.file3.partner2_Char = global.partner2Copy;
						global.file3.partner2_Costume = global.partner2CostumeCopy;

						global.file3.player_Name = global.playerNameCopy;
						global.file3.player_TimeSeconds = global.secondsCopy;
						global.file3.player_TimeMinutes = global.minutesCopy;
						global.file3.player_TimeHours = global.hoursCopy;
						global.file3.player_Health = global.playHealthCopy;
						global.file3.player_ExtraLives = global.playExtraLivesCopy;

						global.file3.save_rm = global.savRMCopy;
					}
				
					if global.saveFile == 4 {
						global.file4.player_Char = global.playerCopy;
						global.file4.player_Costume = global.playerCostumeCopy;
						global.file4.player_Sprite = global.playerSpriteCopy;
						global.file4.textbox_Spr = global.TextboxSprCopy;
						
						global.file4.partner_Char = global.partnerCopy;
						global.file4.partner_Costume = global.partnerCostumeCopy;
						
						global.file4.partner2_Char = global.partner2Copy;
						global.file4.partner2_Costume = global.partner2CostumeCopy;

						global.file4.player_Name = global.playerNameCopy;
						global.file4.player_TimeSeconds = global.secondsCopy;
						global.file4.player_TimeMinutes = global.minutesCopy;
						global.file4.player_TimeHours = global.hoursCopy;
						global.file4.player_Health = global.playHealthCopy;
						global.file4.player_ExtraLives = global.playExtraLivesCopy;

						global.file4.save_rm = global.savRMCopy;
					}
				
					if global.saveFile == 5 {
						global.file5.player_Char = global.playerCopy;
						global.file5.player_Costume = global.playerCostumeCopy;
						global.file5.player_Sprite = global.playerSpriteCopy;
						global.file5.textbox_Spr = global.TextboxSprCopy;
						
						global.file5.partner_Char = global.partnerCopy;
						global.file5.partner_Costume = global.partnerCostumeCopy;
						
						global.file5.partner2_Char = global.partner2Copy;
						global.file5.partner2_Costume = global.partner2CostumeCopy;

						global.file5.player_Name = global.playerNameCopy;
						global.file5.player_TimeSeconds = global.secondsCopy;
						global.file5.player_TimeMinutes = global.minutesCopy;
						global.file5.player_TimeHours = global.hoursCopy;
						global.file5.player_Health = global.playHealthCopy;
						global.file5.player_ExtraLives = global.playExtraLivesCopy;

						global.file5.save_rm = global.savRMCopy;
					}
				
					if global.saveFile == 6 {
						global.file6.player_Char = global.playerCopy;
						global.file6.player_Costume = global.playerCostumeCopy;
						global.file6.player_Sprite = global.playerSpriteCopy;
						global.file6.textbox_Spr = global.TextboxSprCopy;
						
						global.file6.partner_Char = global.partnerCopy;
						global.file6.partner_Costume = global.partnerCostumeCopy;
						
						global.file6.partner2_Char = global.partner2Copy;
						global.file6.partner2_Costume = global.partner2CostumeCopy;

						global.file6.player_Name = global.playerNameCopy;
						global.file6.player_TimeSeconds = global.secondsCopy;
						global.file6.player_TimeMinutes = global.minutesCopy;
						global.file6.player_TimeHours = global.hoursCopy;
						global.file6.player_Health = global.playHealthCopy;
						global.file6.player_ExtraLives = global.playExtraLivesCopy;

						global.file6.save_rm = global.savRMCopy;
					}
				
					if global.saveFile == 7 {
						global.file7.player_Char = global.playerCopy;
						global.file7.player_Costume = global.playerCostumeCopy;
						global.file7.player_Sprite = global.playerSpriteCopy;
						global.file7.textbox_Spr = global.TextboxSprCopy;
						
						global.file7.partner_Char = global.partnerCopy;
						global.file7.partner_Costume = global.partnerCostumeCopy;
						
						global.file7.partner2_Char = global.partner2Copy;
						global.file7.partner2_Costume = global.partner2CostumeCopy;

						global.file7.player_Name = global.playerNameCopy;
						global.file7.player_TimeSeconds = global.secondsCopy;
						global.file7.player_TimeMinutes = global.minutesCopy;
						global.file7.player_TimeHours = global.hoursCopy;
						global.file7.player_Health = global.playHealthCopy;
						global.file7.player_ExtraLives = global.playExtraLivesCopy;

						global.file7.save_rm = global.savRMCopy;
					}
				
				
				
					if global.copyFile {
						global.copyFile = false;
						scr_SaveFiles();
					}
				}	
			}
		}
	} else {
		image_blend = c_grey;
		fileHovered = false;
	}
} else if global.deleteFile {
	if place_meeting(x, y, obj_TitleCursor) {
		global.saveFile = fileNum;
		image_blend = c_white;
		
		if !fileHovered {
			fileHovered = true;
			obj_SFXManager.homingLockOn = true;
		}
		
		
		if !global.deletingFile {
			if jump_Key or device_mouse_check_button_pressed(0, mb_left) {
				if !file_exists(string(global.MainDataFile) + string(global.saveFile) + ".sav") {
					obj_SFXManager.menuCancel = true;
					image_blend = c_red;
				} else {
					obj_SFXManager.menuPop = true;
					image_blend = _bgCol;
					global.deletingFile = true;
				}
			}
		} else {
			if jump_Key or device_mouse_check_button_pressed(0, mb_left) {
				obj_SFXManager.crowdAww = true;
				obj_SFXManager.funkinLocked = true;
				
				if file_exists(string(global.MainDataFile) + string(global.saveFile) + ".sav") {
					file_delete(string(global.MainDataFile) + string(global.saveFile) + ".sav");
				}
	
				//Delete saved rank data
				if file_exists(string(global.SpeedDataFile) + string(global.saveFile) + ".sav") {
					file_delete(string(global.SpeedDataFile) + string(global.saveFile) + ".sav");
				}
	
				//Delete saved rank data
				if file_exists(string(global.ActionDataFile) + string(global.saveFile) + ".sav") {
					file_delete(string(global.ActionDataFile) + string(global.saveFile) + ".sav");
				}
				
				if file_exists(string(global.NoMindDataFile) + string(global.saveFile) + ".sav") {
					file_delete(string(global.NoMindDataFile) + string(global.saveFile) + ".sav");
				}
				
				
				if global.saveFile == 1 {
					global.file1.player_Char = global.playerCopy;
					global.file1.player_Costume = global.playerCostumeCopy;
					global.file1.player_Sprite = global.playerSpriteCopy;
					global.file1.textbox_Spr = global.TextboxSprCopy;
						
					global.file1.partner_Char = global.partnerCopy;
					global.file1.partner_Costume = global.partnerCostumeCopy;
						
					global.file1.partner2_Char = global.partner2Copy;
					global.file1.partner2_Costume = global.partner2CostumeCopy;

					global.file1.player_Name = global.playerNameCopy;
					global.file1.player_TimeSeconds = global.secondsCopy;
					global.file1.player_TimeMinutes = global.minutesCopy;
					global.file1.player_TimeHours = global.hoursCopy;
					global.file1.player_Health = global.playHealthCopy;
					global.file1.player_ExtraLives = global.playExtraLivesCopy;

					global.file1.save_rm = global.savRMCopy;
				}
				
				if global.saveFile == 2 {
					global.file2.player_Char = global.playerCopy;
					global.file2.player_Costume = global.playerCostumeCopy;
					global.file2.player_Sprite = global.playerSpriteCopy;
					global.file2.textbox_Spr = global.TextboxSprCopy;
						
					global.file2.partner_Char = global.partnerCopy;
					global.file2.partner_Costume = global.partnerCostumeCopy;
						
					global.file2.partner2_Char = global.partner2Copy;
					global.file2.partner2_Costume = global.partner2CostumeCopy;

					global.file2.player_Name = global.playerNameCopy;
					global.file2.player_TimeSeconds = global.secondsCopy;
					global.file2.player_TimeMinutes = global.minutesCopy;
					global.file2.player_TimeHours = global.hoursCopy;
					global.file2.player_Health = global.playHealthCopy;
					global.file2.player_ExtraLives = global.playExtraLivesCopy;

					global.file2.save_rm = global.savRMCopy;
				}
				
				if global.saveFile == 3 {
					global.file3.player_Char = global.playerCopy;
					global.file3.player_Costume = global.playerCostumeCopy;
					global.file3.player_Sprite = global.playerSpriteCopy;
					global.file3.textbox_Spr = global.TextboxSprCopy;
						
					global.file3.partner_Char = global.partnerCopy;
					global.file3.partner_Costume = global.partnerCostumeCopy;
						
					global.file3.partner2_Char = global.partner2Copy;
					global.file3.partner2_Costume = global.partner2CostumeCopy;

					global.file3.player_Name = global.playerNameCopy;
					global.file3.player_TimeSeconds = global.secondsCopy;
					global.file3.player_TimeMinutes = global.minutesCopy;
					global.file3.player_TimeHours = global.hoursCopy;
					global.file3.player_Health = global.playHealthCopy;
					global.file3.player_ExtraLives = global.playExtraLivesCopy;

					global.file3.save_rm = global.savRMCopy;
				}
				
				if global.saveFile == 4 {
					global.file4.player_Char = global.playerCopy;
					global.file4.player_Costume = global.playerCostumeCopy;
					global.file4.player_Sprite = global.playerSpriteCopy;
					global.file4.textbox_Spr = global.TextboxSprCopy;
						
					global.file4.partner_Char = global.partnerCopy;
					global.file4.partner_Costume = global.partnerCostumeCopy;
						
					global.file4.partner2_Char = global.partner2Copy;
					global.file4.partner2_Costume = global.partner2CostumeCopy;

					global.file4.player_Name = global.playerNameCopy;
					global.file4.player_TimeSeconds = global.secondsCopy;
					global.file4.player_TimeMinutes = global.minutesCopy;
					global.file4.player_TimeHours = global.hoursCopy;
					global.file4.player_Health = global.playHealthCopy;
					global.file4.player_ExtraLives = global.playExtraLivesCopy;

					global.file4.save_rm = global.savRMCopy;
				}
				
				if global.saveFile == 5 {
					global.file5.player_Char = global.playerCopy;
					global.file5.player_Costume = global.playerCostumeCopy;
					global.file5.player_Sprite = global.playerSpriteCopy;
					global.file5.textbox_Spr = global.TextboxSprCopy;
						
					global.file5.partner_Char = global.partnerCopy;
					global.file5.partner_Costume = global.partnerCostumeCopy;
						
					global.file5.partner2_Char = global.partner2Copy;
					global.file5.partner2_Costume = global.partner2CostumeCopy;

					global.file5.player_Name = global.playerNameCopy;
					global.file5.player_TimeSeconds = global.secondsCopy;
					global.file5.player_TimeMinutes = global.minutesCopy;
					global.file5.player_TimeHours = global.hoursCopy;
					global.file5.player_Health = global.playHealthCopy;
					global.file5.player_ExtraLives = global.playExtraLivesCopy;

					global.file5.save_rm = global.savRMCopy;
				}
				
				if global.saveFile == 6 {
					global.file6.player_Char = global.playerCopy;
					global.file6.player_Costume = global.playerCostumeCopy;
					global.file6.player_Sprite = global.playerSpriteCopy;
					global.file6.textbox_Spr = global.TextboxSprCopy;
						
					global.file6.partner_Char = global.partnerCopy;
					global.file6.partner_Costume = global.partnerCostumeCopy;
						
					global.file6.partner2_Char = global.partner2Copy;
					global.file6.partner2_Costume = global.partner2CostumeCopy;

					global.file6.player_Name = global.playerNameCopy;
					global.file6.player_TimeSeconds = global.secondsCopy;
					global.file6.player_TimeMinutes = global.minutesCopy;
					global.file6.player_TimeHours = global.hoursCopy;
					global.file6.player_Health = global.playHealthCopy;
					global.file6.player_ExtraLives = global.playExtraLivesCopy;

					global.file6.save_rm = global.savRMCopy;
				}
				
				if global.saveFile == 7 {
					global.file7.player_Char = global.playerCopy;
					global.file7.player_Costume = global.playerCostumeCopy;
					global.file7.player_Sprite = global.playerSpriteCopy;
					global.file7.textbox_Spr = global.TextboxSprCopy;
						
					global.file7.partner_Char = global.partnerCopy;
					global.file7.partner_Costume = global.partnerCostumeCopy;
						
					global.file7.partner2_Char = global.partner2Copy;
					global.file7.partner2_Costume = global.partner2CostumeCopy;

					global.file7.player_Name = global.playerNameCopy;
					global.file7.player_TimeSeconds = global.secondsCopy;
					global.file7.player_TimeMinutes = global.minutesCopy;
					global.file7.player_TimeHours = global.hoursCopy;
					global.file7.player_Health = global.playHealthCopy;
					global.file7.player_ExtraLives = global.playExtraLivesCopy;

					global.file7.save_rm = global.savRMCopy;
				}
				
				
				
				if global.deleteFile {
					global.deleteFile = false;
					scr_SaveFiles();
				}
			}
		}
	} else {
		image_blend = c_grey;
		fileHovered = false;
	}
}


scr_GetCharTextboxesLocal();

_charCheck = player;
sprite_index = textboxSpr;

if !global.SimplifyVFX {
	image_speed = 1;
} else {
	image_speed = 0;
}