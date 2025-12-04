getCharacterControls();
scr_GetCharTextboxes();

if imageProgress < 30 {
	imageProgress += 1 / 6;
}

if imageProgress >= 30 {
	imageProgress = 0;
}

var _modCount = array_length(global.speedStageData);
var _mod = global.speedStageData[global.SpeedSelected];

//Hover over levels
if (obj_FreeplaySpeedStages.speedStageActive or obj_FreeplayActionStages.actionStageActive) && !confirmed {
	if down_Key_Once && !hitDown {
		hitDown = true;
	    global.SpeedSelected = (global.SpeedSelected + 1) mod _modCount;
		obj_SFXManager.homingLockOn = true;
		
		musicPlay = false;
	}

	if down_Key {
		if holdDownTimer > 0 {
			holdDownTimer -= 1;
		}
	
		if holdDownTimer <= 0 {
			if scrollTimer > 0 {
				scrollTimer -= 1;
			}
		}
	} else {
		holdDownTimer = holdFrames;
	}


	if up_Key_Once && !hitUp {
		hitUp = true;
	    global.SpeedSelected = (global.SpeedSelected - 1 + _modCount) mod _modCount;
		obj_SFXManager.homingLockOn = true;
		
		musicPlay = false;
	}

	if up_Key {
		if holdUpTimer > 0 {
			holdUpTimer -= 1;
		}
	
		if holdUpTimer <= 0 {
			if scrollTimer > 0 {
				scrollTimer -= 1;
			}
		}
	} else {
		holdUpTimer = holdFrames;
	}

	if !up_Key && !down_Key {
		scrollTimer = 5;
	}
	
	if !up_Key {
		hitUp = false;
	} 
	
	if !down_Key {
		hitDown = false;
	}


	if scrollTimer <= 0 {
		scrollTimer = 5;
		obj_SFXManager.homingLockOn = true;
		
		musicPlay = false;
	
		if down_Key {
			global.SpeedSelected = (global.SpeedSelected + 1) mod _modCount;
		}
	
		if up_Key {
			global.SpeedSelected = (global.SpeedSelected - 1 + _modCount) mod _modCount;
		}
	}
	
	if !_mod.locked {
		if (jump_Key or pause_Key) && !confirmed {
			instance_destroy(obj_TitleCursor);
			instance_destroy(obj_FreeplayPressTab)
			obj_SFXManager.funkinCheckpoint = true;
			global.Health = global.MaxHealth;
		
			obj_FreeplayChar.yspd = 2;
		
			if instance_exists(obj_FreeplayCharPartner) {
				obj_FreeplayCharPartner.yspd = 2;
			}	
			
			if instance_exists(obj_FreeplayCharPartner2) {
				obj_FreeplayCharPartner2.yspd = 2;
			}
		
			confirmed = true;
			set_song_ingame(noone, 60, 0);
			global.LevelForced = global.speedStageData[global.SpeedSelected].levelForced;
		}
	} else {
		if (jump_Key or pause_Key) && !confirmed {
			obj_SFXManager.funkinLocked = true;
			pressedLock = true;
			image_blend = c_red;
			
			if !instance_exists(obj_FreeplayRequirement) {
				with(instance_create_depth(350, 150, depth, obj_FreeplayRequirement)) {
					requirementText = other.requirement;
				}
			} else {
				with(obj_FreeplayRequirement) {
					alphaDown = false;
					alphaDownTimer = alphaDownFrames;
					requirementText = other.requirement;
				}
			}
		}
	}
}


requirement = _mod.requirement;


//Change Offset
setSpeed = scrollSpacing * (global.SpeedSelected + 1);
scrollY = lerp(scrollY, setSpeed, 0.1);
		
scrollOffset = scrollY;

var _visibleStart = scrollOffset div scrollSpacing;
var _visibleEnd = (scrollOffset + y - scrollSpacing) div scrollSpacing;

/*if global.SpeedSelected < _visibleStart {
    scrollOffset = global.SpeedSelected * scrollSpacing;
}

if global.SpeedSelected > _visibleEnd {
    scrollOffset = (global.SpeedSelected - (y - scrollSpeed) div scrollSpeed) * scrollSpacing;
}*/

var _totalHeight = array_length(global.speedStageData) * scrollSpacing;
var _maxHeight = max(0, _totalHeight + scrollSpacing);
scrollOffset = clamp(scrollOffset, 0, _maxHeight);

x = obj_FreeplayMenuParent.x + movedX + 300;

if confirmed { 
	obj_FreeplayChar.yspd -= 0.1;
	
	if instance_exists(obj_FreeplayCharPartner) {
		obj_FreeplayCharPartner.yspd -= 0.1;
	}
	
	if instance_exists(obj_FreeplayCharPartner2) {
		obj_FreeplayCharPartner2.yspd -= 0.1;
	}
	
	if confirmedTimer > 0 {
		confirmedTimer -= 1;
	}
	
	if !global.SimplifyVFX {
		if confirmedFlashTimer > 0 {
			confirmedFlashTimer -= 1;
		}
	}
	
	if confirmedFlashTimer <= 0 {
		confirmedFlashTimer = confirmedFlashFrames;
		if confirmedBlue {
			confirmedBlue = false;
		} else {
			confirmedBlue = true;
		}
	}
	
	if confirmedBlue {
		image_blend = c_white;
	} else {
		image_blend = global.fullRGB;
	}
}

if confirmedTimer <= 0 {
	if !instance_exists(obj_RoomTransitionSEGAMenu) {
		var instantiated = instance_create_depth(0, 0, -99999999, obj_RoomTransitionSEGAMenu);
		
		if global.LevelForced {
			instantiated.target_rm = global.speedStageData[global.SpeedSelected].stage_RM;
		} else {
			instantiated.target_rm = rm_LevelCard;
		}
	}
}