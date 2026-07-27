getCharacterControls();

#region //Animation
	#region //Background Shit
		extraScale = lerp(extraScale, 0, 0.15);
		
		if realBPM > 0 {
			realBPM -= delta_time;
		} else {
			realBPM += conBPM;
			
			if !global.SimplifyVFX {
				extraScale = 1;
				pressStart = !pressStart;
			}
		}
	
		if !global.SimplifyVFX {
			backTextX--;
			otherBackTextX++;
		
			if backTextX <= -384 {
				backTextX = baseTextX;
				otherBackTextX = otherBaseTextX;
			}
			
			srSpikesIndex++;
			
			if srSpikesIndex >= 20 {
				srSpikesIndex = 0;
			}
		}
	#endregion
#endregion

if !confirm {
	menuX = lerp(menuX, 0, 0.15);
	menuY = lerp(menuY, 0, 0.15);
	
	if jump_Key or pause_Key {
		obj_SFXManager.funkinCheckpoint = true;
		confirm = true;
	}
} else {
	if confirmTimer > 0 {
		confirmTimer--;
		
		if confirmTimer > 45 {
			menuX = lerp(menuX, 0, 0.15);
			menuY = lerp(menuY, 0, 0.15);
		}
	} else {
		global.BaseX = backTextX;
		global.BaseScale = extraScale;
		global.BaseSpikes = srSpikesIndex;
		room_goto(rm_MainMenuNew);
	}
	
	if confirmTimer <= 45 {
		menuX = lerp(menuX, 300, 0.1);
		menuY = lerp(menuY, -200, 0.1);
	}
	
	if !global.SimplifyVFX {
		if pressedTimer > 0 {
			pressedTimer--;
		} else {
			pressed = !pressed;
			pressedTimer = 5;
		}
	}
}