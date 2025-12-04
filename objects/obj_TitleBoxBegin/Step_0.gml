getCharacterControls();

sprite_index = obj_TitleBoxParent.sprite_index;

if global.TitleOpt == "START" && (jump_Key or pause_Key) && !start {
	start = true;
	obj_SFXManager.funkinCheckpoint = true;
	y += 10;
}


if start {
	startTimer -= 1;
	
	if !global.SimplifyVFX {
		if flashingTimer > 0 {
			flashingTimer -= 1;
		}
		
		if flashingTimer <= 0 {
			flashingTimer = 5;
			
			if image_blend == c_white {
				image_blend = c_blue;
			} else {
				image_blend = c_white;
			}
		}
	} else {
		image_blend = c_blue;
	}
}

if global.TitleOpt != "START" {
	if x < mainX + 200 {
		x += 10;
	}
	
	if x >= mainX + 200 {
		x = mainX + 200;
	}
} else {
	if x > mainX {
		x -= 10;
	}
	
	if x <= mainX {
		x = mainX;
	}
}

if y > mainY {
	y -= 2;
}



if startTimer <= 0 && global.TitleOpt != "MAIN MENU" {
	global.TitleOpt = "MAIN MENU";
	start = false;
	startTimer = 60;
	
	
	var _changeX = 828;
	
	instance_create_depth(640 / 2, 360 / 2, depth, obj_TitleCursor);
	
	///-----Socials-----///
	with (instance_create_depth(20, 400, depth, obj_Socials)) {
		image_index = 0;
	}
	
	with (instance_create_depth(60, 400, depth, obj_Socials)) {
		image_index = 1;
	}
	
	with (instance_create_depth(100, 400, depth, obj_Socials)) {
		image_index = 2;
	}
	
	with (instance_create_depth(140, 400, depth, obj_Socials)) {
		image_index = 3;
	}
	
	
	///-----Boxes-----///
	
	//Main Menu
	instance_create_depth(_changeX, 30, depth, obj_TitleBoxNew);
	instance_create_depth(_changeX, 66, depth, obj_TitleBoxContinue);
	instance_create_depth(_changeX, 102, depth, obj_TitleBoxFreeplay);
	instance_create_depth(_changeX, 138, depth, obj_TitleBoxFileSelect);
	instance_create_depth(_changeX, 174, depth, obj_TitleBoxOptions);
	instance_create_depth(_changeX, 210, depth, obj_TitleBoxQuitGame);
	
	
	///-----Options-----///
	
	//Main
	instance_create_depth(_changeX, 30, depth, obj_TitleBoxMainOpt);
	instance_create_depth(540, 400, depth, obj_TitleBoxOptBack);
	instance_create_depth(400, 400, depth, obj_TitleBoxOptDefault);
	
	//Audio
	instance_create_depth(_changeX, 102, depth, obj_TitleBoxOptMaster);
	instance_create_depth(_changeX, 138, depth, obj_TitleBoxOptMusic);
	instance_create_depth(_changeX, 174, depth, obj_TitleBoxOptSFX);
	instance_create_depth(_changeX, 210, depth, obj_TitleBoxOptText);
	instance_create_depth(_changeX, 246, depth, obj_TitleBoxOptAmbience);
	instance_create_depth(_changeX, 282, depth, obj_TitleBoxOptPauseTheme);
	
	//Visual
	instance_create_depth(_changeX, 102, depth, obj_TitleBoxOptSimVFX);
	instance_create_depth(_changeX, 138, depth, obj_TitleBoxOptParticles);
	instance_create_depth(_changeX, 174, depth, obj_TitleBoxOptScreenShake);
	instance_create_depth(_changeX, 210, depth, obj_TitleBoxOptLanguage);
	
	//Misc
	instance_create_depth(_changeX, 102, depth, obj_TitleBoxOptFullscreen);
	instance_create_depth(_changeX, 138, depth, obj_TitleBoxOptSongTag);
	instance_create_depth(_changeX, 174, depth, obj_TitleBoxOptConRum);
	instance_create_depth(_changeX, 210, depth, obj_TitleBoxOptConType);
	instance_create_depth(_changeX, 246, depth, obj_TitleBoxOptExtCam);
	instance_create_depth(_changeX, 282, depth, obj_TitleBoxOptFPS);
	
	
	//---Controls---//
	
	//Speed 1
	instance_create_depth(_changeX, 102, depth, obj_TitleBoxOptCustomLeftSpeed);
	instance_create_depth(_changeX, 138, depth, obj_TitleBoxOptCustomRightSpeed);
	instance_create_depth(_changeX, 174, depth, obj_TitleBoxOptCustomUpSpeed);
	instance_create_depth(_changeX, 210, depth, obj_TitleBoxOptCustomDownSpeed);
	instance_create_depth(_changeX, 246, depth, obj_TitleBoxOptCustomJumpSpeed);
	instance_create_depth(_changeX, 282, depth, obj_TitleBoxOptCustomAct1Speed);
	
	//Speed 2
	instance_create_depth(_changeX, 102, depth, obj_TitleBoxOptCustomAct2Speed);
	instance_create_depth(_changeX, 138, depth, obj_TitleBoxOptCustomAct3Speed);
	instance_create_depth(_changeX, 174, depth, obj_TitleBoxOptCustomAct4Speed);
	instance_create_depth(_changeX, 210, depth, obj_TitleBoxOptCustomAct5Speed);
	instance_create_depth(_changeX, 246, depth, obj_TitleBoxOptCustomPauseSpeed);
	instance_create_depth(_changeX, 282, depth, obj_TitleBoxOptCustomSelSpeed);
	
}
