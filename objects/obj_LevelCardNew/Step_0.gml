getCharacterControls();

if !completed {
	#region //Timer
		if incompleteTimer > 0 {
			incompleteTimer -= 1;
			
			with(obj_Player) {
				image_speed = 0;
				can_Move = false;
				prepare = true;
			}
		
			if jump_Key or pause_Key {
				if !instance_exists(obj_RoomTransParent) {
					with(instance_create_depth(-1000000, 0, 0, obj_RoomTransitionSEGAMenu)) {
						target_rm = global.speedStageData[global.SpeedSelected].stage_RM;
						division = 0.5;
						other.completed = true;
					}
				}
			}
		}
	
		if incompleteTimer <= 0 {
			completed = true;
		}
	#endregion
	
	#region //Background Box
		image_alpha = lerp(image_alpha, 0.5, 0.1);
	#endregion
	
	#region //Sonic Rush Spikes
		moveRight = lerp(moveRight, moveRightEnd, 0.2);
		moveUp = lerp(moveUp, moveUpEnd, 0.2);
		moveDown = lerp(moveDown, moveDownEnd, 0.2);
	#endregion
	
	#region //Stage BS
		//Stage Name
		if moveRight >= moveRightEnd - 0.5 {
			stageNameMoveX = lerp(stageNameMoveX, stageNameEndX, 0.4);
		}
		
		//Level Type
		if stageNameMoveX >= stageNameEndX - 0.5 {
			if !stageSound {
				stageSound = true;
				obj_SFXManager.rushTrick = true;
				
				scr_ControllerRumble();
				scr_ScreenShake();
			}
			
			levelTypeMoveX = lerp(levelTypeMoveX, levelTypeEndX, 0.4);
		}
		
		//Level Number
		if levelTypeMoveX >= levelTypeEndX - 0.5 {
			if !levelTypeSound {
				levelTypeSound = true;
				obj_SFXManager.rushTrick = true;
				
				scr_ControllerRumble();
				scr_ScreenShake();
			}
			
			levelNumberMoveX = lerp(levelNumberMoveX, levelNumberEndX, 0.4);
			
			if levelNumberMoveX >= levelNumberEndX - 0.5 {
				if !levelNumSound {
					levelNumSound = true;
					obj_SFXManager.rushTrick = true;
					
					scr_ControllerRumble();
					scr_ScreenShake();
				}
			}
		}
	#endregion
	
	#region //Player
		if levelTypeMoveX >= levelTypeEndX - 0.5 {
			playerMoveX = lerp(playerMoveX, playerEndX, 0.1);
		}
	#endregion
	
	#region //Saved Time, Rank, & Character
		savedMoveY = lerp(savedMoveY, savedEndY, 0.1);
	#endregion
} else {
	#region //Timer
		if completedTimer > 0 {
			completedTimer -= 1;
		}
	
		if completedTimer <= 0 {
			instance_destroy();
			
			if !instance_exists(obj_RoomTransParent) {
				with(instance_create_depth(-1000000, 0, 0, obj_RoomTransitionSEGAMenu)) {
					target_rm = global.speedStageData[global.SpeedSelected].stage_RM;
					division = 0.5;
				}
			}
		}
	#endregion
	
	#region //Background Box
		image_alpha = lerp(image_alpha, 0, 0.1);
	#endregion
	
	#region //Sonic Rush Spikes
		moveRight = lerp(moveRight, moveRightStart, 0.2);
		moveUp = lerp(moveUp, moveUpStart, 0.2);
		moveDown = lerp(moveDown, moveDownStart, 0.2);
	#endregion
	
	#region //Stage BS
		stageNameMoveX = lerp(stageNameMoveX, 800, 0.2);
		levelTypeMoveX = lerp(levelTypeMoveX, 800, 0.2);
		levelNumberMoveX = lerp(levelNumberMoveX, 800, 0.2);
	#endregion
	
	#region //Player
		playerMoveX = lerp(playerMoveX, -400, 0.3);
	#endregion
	
	#region //Sonic Rush Boss Ball
		srBallMoveY = lerp(srBallMoveY, -400, 0.1);
	#endregion
	
	#region //Saved Time, Rank, & Character
		savedMoveY = lerp(savedMoveY, savedStartY, 0.1);
	#endregion
}


//Animations
if !global.SimplifyVFX {
	srBallRotate += 10;
	mindImageIndex += 1 / 12;
	srSpikesImageIndex += 1;
	srSpikesImageIndexBack -= 1;
}

if srBallMoveX > 0 {
	srBallMoveX -= 10;
}

if mindImageIndex >= 3 {
	mindImageIndex = 0;
}

if srSpikesImageIndex >= 20 {
	srSpikesImageIndex = 0;
}

if srSpikesImageIndexBack <= 0 {
	srSpikesImageIndexBack = 20;
}
