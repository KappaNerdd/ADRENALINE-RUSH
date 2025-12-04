if obj_CharSelectWhiteBall.playerConfirmed && !obj_CharSelectWhiteBall.partnerConfirmed {
	if gamepad_is_connected(global.Player2Con) {
		getCharacterControlsP2();
	} else {
		getCharacterControls();
	}
} else if obj_CharSelectWhiteBall.playerConfirmed && obj_CharSelectWhiteBall.partnerConfirmed {
	if gamepad_is_connected(global.Player3Con) {
		getCharacterControlsP3();
	} else {
		getCharacterControls();
	}
} else {
	getCharacterControls();
}


if (down_Key) && global.ChooseCostume && pressed == false {
	pressed = true;
	
	obj_CharSelectRushBossBG.ballX = 300;
	obj_CharSelectRushBossBG.ballY = -300;
	
	if !obj_CharSelectWhiteBall.playerConfirmed && !obj_CharSelectWhiteBall.partnerConfirmed {
		obj_CharSelectChar.moveX = obj_CharSelectChar.x + 300;
	} else if obj_CharSelectWhiteBall.playerConfirmed && !obj_CharSelectWhiteBall.partnerConfirmed {
		obj_CharSelectChar.moveXP2 = obj_CharSelectChar.x + 300;
	} else {
		obj_CharSelectChar.moveXP3 = obj_CharSelectChar.x + 300;
	}
	
	global.SelectedCostume -= 1;
		
    if (global.SelectedCostume < 0) {
        global.SelectedCostume = global.CostumeNum - 1; //Wrap around
    }
	
	
	obj_CharSelectWhiteBall.image_alpha = 0;
	obj_SFXManager.homingLockOn = true;
}

if pressed == true {
	image_speed = 2;
}

if global.ChooseCostume {
	visible = true;
} else {
	visible = false;
}


//Bounce on-beat
if global.RealBPM <= 0.02 {
	image_xscale = -1.5;
	image_yscale = 1.5;
}


if image_xscale < -1 {
	image_xscale += 0.05;
}

if image_yscale > 1 {
	image_yscale -= 0.05;
}