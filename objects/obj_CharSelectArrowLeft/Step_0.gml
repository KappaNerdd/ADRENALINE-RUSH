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


if (left_Key) && !global.ChooseCostume && pressed == false && !instance_exists(obj_CharSelectGirlyChoose) && obj_CharSelectWhiteBall.partner2Confirmed == false {
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
	
	do {
        global.SelectedPlayer -= 1;
		
        if (global.SelectedPlayer < 0) {
            global.SelectedPlayer = global.PlayerNum - 1; //Wrap around
        }
    } until (global.PlayerSelection[global.SelectedPlayer][1]); //Skip unplayable characters
	
	if instance_exists(obj_CharSelectChar) {
		obj_CharSelectChar.waitTimer = 2;
	}
	
	obj_CharSelectWhiteBall.image_alpha = 0;
	obj_SFXManager.menuPop = true;
}

if pressed == true {
	image_speed = 2;
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