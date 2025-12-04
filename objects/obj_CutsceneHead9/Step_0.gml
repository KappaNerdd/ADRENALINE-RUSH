//Cam Down & player shit
if cameraDown > 0 {
	obj_Player.can_Move = false;
	
	with(obj_Player) {
		image_speed = 0.5;
		sprite_index = sprWalk;
		mask_index = idle_Mask;
		
		vel = 2;
	}
	
	with(obj_CameraParent) {
		finalCamY += 1.8;
	}
	
	cameraDown -= 1;
}

if cameraDown <= 0 {
	with(obj_Player) {
		image_speed = 1;
		sprite_index = sprIdle;
		mask_index = idle_Mask;
		
		vel = 0;
	}
	
	camDownConfirmed = true;
}


//Spawn Textbox
if camDownConfirmed == true {
	if waitStand > 0 {
		waitStand -= 1;
	}
}

if waitStand <= 0 {
	waitStandConfirmed = true;
}

if waitStandConfirmed == true {
	with(obj_Player) {
		image_speed = 1;
		sprite_index = sprLook_up;
		mask_index = idle_Mask;
		
		vel = 0;
	}
	
	if waitTextbox > 0 {
		waitTextbox -= 1;
	}
}


//Spawn textbox
if waitTextbox <= 0 && textboxConfirmed == false {
	if !instance_exists(obj_Textbox) {
		create_textbox(text_id);
	}
	
	textboxConfirmed = true;
}

if textboxConfirmed == true && !instance_exists(obj_Textbox) {
	if afterText > 0 {
		afterText -= 1;
	}
}

if afterText <= 0 {
	set_song_ingame(mus_DISCONNECTED, 60, 120);
	
	obj_Player.can_Move = true;
	
	global.statData[1].head_Overworld9_Check1 = true;
	instance_destroy();
}