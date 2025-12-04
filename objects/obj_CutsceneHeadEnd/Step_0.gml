obj_CameraCutscene.followPlayer = true;

if fixCameraTimer > 0 {
	fixCameraTimer -= 1;
	
	with (obj_CameraParent) {
		finalCamX = (obj_Player.x - camera_get_view_width(view_camera[0]) / 2);
		finalCamY = (obj_Player.y - camera_get_view_height(view_camera[0]) / 2);
	}
}

//Text 1
if text1Timer > 0 {
	text1Timer -= 1;
	
	obj_Player.can_Move = false;
	
	with(obj_Player) {
		sprite_index = sprIdle;
		image_speed = 1;
		image_xscale = 1;
	}
}

if text1Timer < 10 && text1Timer > 5 {
	if !instance_exists(obj_Textbox) {
		create_textbox(text_id1);
	}
}

if text1Timer <= 0 && !instance_exists(obj_Textbox) {
	text1Confirmed = true;
}


//Player run
if text1Confirmed == true {
	if playerRunTimer > 0 {
		
		with(obj_Player) {
			sprite_index = sprRun;
			image_speed = 2.25;
			vel = 10;
		}
		
		playerRunTimer -= 1;
	}
	
	if playerRunTimer <= 0 {
		playerRunConfirmed = true;
	}
}


//After run
if playerRunConfirmed == true {
	if waitTimer > 0 {
		waitTimer -= 1;
		
		with(obj_Player) {
			sprite_index = sprIdle;
			image_speed = 1;
			vel = 0;
		}
	}
	
	if waitTimer <= 0 {
		
		if crouchTimer > 0 {
			
			with(obj_Player) {
				sprite_index = sprPrepare;
				image_index = 39;
				image_speed = 0;
			}
			
			crouchTimer -= 1;
		}
	}
	
	if crouchTimer <= 0 {
		crouchConfirmed = true;
	}
	
}


//Text 2
if crouchConfirmed == true {
	if text2Timer > 0 {
		text2Timer -= 1;
	}

	if text2Timer > 1 {
		if !instance_exists(obj_Textbox) {
			create_textbox(text_id2);
		}
	}

	if text2Timer <= 0 && !instance_exists(obj_Textbox) {
		if !saiyanMeow {
			saiyanMeow = true;
			obj_SFXManager.catMeow = true;
		}
	}
}

if saiyanMeow {
	if saiyanMeowTimer > 0 {
		saiyanMeowTimer -= 1;
	}
	
	if saiyanMeowTimer < 5 && saiyanMeowTimer > 0 && !instance_exists(obj_Textbox) {
		create_textbox(text_id4);
	}
	
	if saiyanMeowTimer <= 0 && !instance_exists(obj_Textbox) {
		text2Confirmed = true;
	}
}


//After text 2
if text2Confirmed == true {
	if playerRunTimer2 > 0 {
		
		with(obj_Player) {
			sprite_index = sprWalk;
			image_speed = 1;
			vel = 4.5;
		}
		
		playerRunTimer2 -= 1;
	}
	
	if playerRunTimer2 <= 0 {
		if playerWaitTimer > 0 {
			playerWaitTimer -= 1;
			
			with(obj_Player) {
				sprite_index = sprIdle;
				image_speed = 1;
				vel = 0;
			}
		}
	}
}


//Player crouch
if playerWaitTimer <= 0 {
	if playerCrouchTimer > 0 {
		with(obj_Player) {
			sprite_index = spr_KappaDamageDownHead;
			image_index = 2;
			image_speed = 0;
		}
		
		playerCrouchTimer -= 1;
	}
}


//Text 3
if playerCrouchTimer <= 0 {
	if text3Timer > 0 {
		text3Timer -= 1;
	}
	
	if text3Timer > 1 {
		if !instance_exists(obj_Textbox) {
			create_textbox(text_id3);
		}
	}

	if text3Timer <= 0 && !instance_exists(obj_Textbox) {
		byeSaiyan = true;
	}
}


//Bye Saiyan
if byeSaiyan {
	if instance_exists(obj_SaiyanCutsceneHeadEnd) {
		obj_SaiyanCutsceneHeadEnd.image_alpha -= 0.01;
		
		if obj_SaiyanCutsceneHeadEnd.image_alpha <= 0 {
			instance_destroy(obj_SaiyanCutsceneHeadEnd);
		}
	} else {
		if byeSaiyanTimer > 0 {
			byeSaiyanTimer -= 1;
		}
		
		if byeSaiyanTimer < 5 && byeSaiyanTimer > 0 && !instance_exists(obj_Textbox) {
			create_textbox(text_id5);
		}
		
		if byeSaiyanTimer <= 0 && !instance_exists(obj_Textbox) {
			text3Confirmed = true;
		}
	}
}


//After text 3
if text3Confirmed == true {
	if walkBack > 0 {
		walkBack -= 1;
		
		with(obj_Player) {
			sprite_index = sprWalk;
			image_speed = 0.75;
			image_xscale = -1;
			vel = -2.5;
		}
		
		if walkBackArrow > 0 {
			walkBackArrow -= 1;
		}
		
		if walkBackArrow <= 0 {
			if !instance_exists(obj_HeadArrowBomb) {
				instance_create_depth(obj_Player.x - 700, obj_Player.y - 90, depth, obj_HeadArrowBomb);
			}
		}
	}
	
	if walkBack <= 0 {
		walkBackConfirmed = true;
	}
}


//After car explosion
if walkBackConfirmed == true {
	
	if carExplodeTimer > 0 {
		carExplodeTimer -= 1;
		
		with(obj_Player) {
			sprite_index = sprGuard;
			image_index = 0;
			image_xscale = 1;
			image_speed = 0;
			vel = 0;
		}
	}
	
	if carExplodeTimer <= 0 {
		if playerWaitTimer2 > 0 {
			playerWaitTimer2 -= 1;
			
			with(obj_Player) {
				sprite_index = sprIdle
				image_speed = 1;
			}
		}
		
		if playerWaitTimer2 <= 0 {
			if playerWalkBack > 0 {
				playerWalkBack -= 1;
			
				with(obj_Player) {
					sprite_index = sprWalk;
					image_speed = -0.5;
					vel = -2;
				}
			}
			
			if playerWalkBack < 2 && playerWalkBack > 0 {
				instance_create_depth(obj_HeadCarFire.x, obj_HeadCarFire.y, depth, obj_HeadEndBeam);
			}
			
			if playerWalkBack <= 0 {
				if walkBackTimer > 0 {
					walkBackTimer -= 1;
					
					with(obj_Player) {
						sprite_index = sprGuard;
						image_speed = 0;
						image_index = 0;
						vel = 0;
					}
				}
			}
			
			if walkBackTimer <= 0 {
				walkBack2Confirmed = true;
			}
		}
	}
}


if walkBack2Confirmed {
	if headHurtTimer > 0 {
		headHurtTimer -= 1;
		
		if headHurtTextTimer > 0 {
			headHurtTextTimer -= 1;
		}
		
		if headHurtTextTimer <= 0 {
			headHurtTextTimer = headHurtTextFrames;
			
			instance_create_depth(obj_Player.x, obj_Player.y, depth, obj_CutHeadEndText);
		}
		
		if headHurtTimer > 240 {
			headHurtTextFrames = 30;
		} else if headHurtTimer <= 240 && headHurtTimer > 120 {
			headHurtTextFrames = 15;
		} else if headHurtTimer <= 120 {
			headHurtTextFrames = 7;
		}
	}
	
	if headHurtTimer <= 0 && !headDoneHurting {
		headDoneHurting = true;
		
		instance_create_depth(obj_HeadCarFire.x + 200, obj_HeadCarFire.y, depth, obj_HeadBeamHead10);
		
		obj_Player.yspd = -6;
		obj_Player.vel = -7;
		obj_Player.ground = false;
		obj_Player.playerHurt = true;
		obj_SFXManager.playerHurt = true;
		
		with(obj_Player) {
			sprite_index = sprOmegaFall;
			image_speed = 0;
			image_index = 0;
		}
	}
}


if headDoneHurting {
	if obj_Player.ground && obj_Player.yspd > 0 && !createHeadHurt {
		createHeadHurt = true;
		
		instance_create_depth(0, 0, 0, obj_CutHeadEndRUNText);
		instance_create_depth(x, y, depth, obj_MusicTag);
		
		obj_Player.boostEnergy = 301;
		obj_Player.vel = -obj_Player.full_Speed;
		obj_Player.speedBreak = true;
		
		instance_destroy();
	}
}
