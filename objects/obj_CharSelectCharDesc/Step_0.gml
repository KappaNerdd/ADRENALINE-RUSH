scr_GlobalControls();

if gamepad_is_connected(global.Player2Con) {
	if !obj_CharSelectWhiteBall.playerConfirmed {
		getCharacterControls();
	} else {
		getCharacterControlsP2();
	}
} else {
	getCharacterControls();
}


//Sprite
scr_GetCharTextboxes();


if action1_Key && !obj_CharSelectWhiteBall.partnerConfirmed && !global.ChooseCostume && !obj_CharSelectCharMoveList.active {
	if active {
		active = false;
	} else {
		active = true;
	}
	
	obj_SFXManager.menuPop = true;
} else if obj_CharSelectWhiteBall.partnerConfirmed {
	active = false;
}

if global.ChooseCostume or obj_CharSelectCharMoveList.active {
	active = false;
	visible = false;
} else {
	visible = true;
}


if gamepad_is_connected(global.Player1Con) {
	buttonSprite = 8;
} else {
	buttonSprite = 16;
}


if active {
	if x < xSave + 352 {
		x += 6;
	}
	
	if x >= xSave + 352 {
		x = xSave + 352;
	}
} else {
	if x > xSave {
		x -= 6;
	}
	
	if x <= xSave {
		x = xSave;
	}
}


//Simple Shit
if global.SimplifyVFX {
	image_speed = 0;
} else {
	image_speed = 1;
}



///Change Char Shit
if !global.PlayerSelection[global.SelectedPlayer][2] {
	charName = global.PlayerSelection[global.SelectedPlayer][0][0];
	charAge = global.PlayerSelection[global.SelectedPlayer][13][0];
	charAcc = global.PlayerSelection[global.SelectedPlayer][13][1];
	charJspd = global.PlayerSelection[global.SelectedPlayer][13][2];
	charGrav = global.PlayerSelection[global.SelectedPlayer][13][3];
	charMaxSpeed = global.PlayerSelection[global.SelectedPlayer][13][4];
	charFullSpeed = global.PlayerSelection[global.SelectedPlayer][13][5];
} else {
	charName = "???";
	charAge = "??";
	charAcc = 0;
	charJspd = 0;
	charGrav = 0;
	charMaxSpeed = 0;
	charFullSpeed = 0;
}

