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


if action3_Key && !obj_CharSelectWhiteBall.partnerConfirmed && !global.ChooseCostume && !obj_CharSelectCharDesc.active {
	if active {
		active = false;
	} else {
		active = true;
	}
	
	obj_SFXManager.menuPop = true;
} else if obj_CharSelectWhiteBall.partnerConfirmed {
	active = false;
}

if global.ChooseCostume or obj_CharSelectCharDesc.active {
	active = false;
	visible = false;
} else {
	visible = true;
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
	if global.SelectedPlayer == 2 {
		move1 = "DOUBLE-JUMP: PRESS " + string(obj_CustomJumpKeySpeed.keyText) + " (MID-AIR)";
		move2 = "HOVER: HOLD " + string(obj_CustomAct3KeySpeed.keyText) + " (MID-AIR)";
		move3 = "OMEGA-STOMP: HOLD " + string(obj_CustomAct1KeySpeed.keyText) + " WHILE STOMPING";
		move4 = "WALL-JUMP: PRESS " + string(obj_CustomAct3KeySpeed.keyText) + " (WALL-CLING)";
		move5 = "";
		move6 = "";
	} else if global.SelectedPlayer == 3 {
		move1 = "";
		move2 = "";
		move3 = "";
		move4 = "";
		move5 = "";
		move6 = "";
	} else if global.SelectedPlayer == 4 {
		move1 = "";
		move2 = "";
		move3 = "";
		move4 = "";
		move5 = "";
		move6 = "";
	} else if global.SelectedPlayer == 5 {
		move1 = "";
		move2 = "";
		move3 = "";
		move4 = "";
		move5 = "";
		move6 = "";
	} else if global.SelectedPlayer == 6 {
		move1 = "";
		move2 = "";
		move3 = "";
		move4 = "";
		move5 = "";
		move6 = "";
	} else if global.SelectedPlayer == 7 {
		move1 = "";
		move2 = "";
		move3 = "";
		move4 = "";
		move5 = "";
		move6 = "";
	} else if global.SelectedPlayer == 8 {
		move1 = "";
		move2 = "";
		move3 = "";
		move4 = "";
		move5 = "";
		move6 = "";
	} else if global.SelectedPlayer == 9 {
		move1 = "";
		move2 = "";
		move3 = "";
		move4 = "";
		move5 = "";
		move6 = "";
	} else if global.SelectedPlayer == 10 {
		move1 = "DOUBLE-JUMP: PRESS " + string(obj_CustomJumpKeySpeed.keyText) + " (MID-AIR)";
		move2 = "SPINDASH: HOLD " + string(obj_CustomDownKeySpeed.keyText) + " & SPAM " + string(obj_CustomJumpKeySpeed.keyText) + " or " + string(obj_CustomAct1KeySpeed.keyText);
		move3 = "PEELOUT: HOLD " + string(obj_CustomUpKeySpeed.keyText) + " & SPAM " + string(obj_CustomJumpKeySpeed.keyText) + " or " + string(obj_CustomAct1KeySpeed.keyText);
		move4 = "DROPDASH: HOLD " + string(obj_CustomAct1KeySpeed.keyText) + " (MID-AIR)";
		move5 = "HOMING-ATTACK: PRESS " + string(obj_CustomAct3KeySpeed.keyText) + " (MID-AIR)";
		move6 = "";
	} else if global.SelectedPlayer == 11 {
		move1 = "";
		move2 = "";
		move3 = "";
		move4 = "";
		move5 = "";
		move6 = "";
	} else if global.SelectedPlayer == 12 {
		move1 = "";
		move2 = "";
		move3 = "";
		move4 = "";
		move5 = "";
		move6 = "";
	} else if global.SelectedPlayer == 13 {
		move1 = "";
		move2 = "";
		move3 = "";
		move4 = "";
		move5 = "";
		move6 = "";
	} else if global.SelectedPlayer == 14 {
		move1 = "REVOLVER (GROUND): PRESS " + string(obj_CustomAct3KeySpeed.keyText) + " (CHARGABLE)";
		move2 = "REVOLVER (JUMP): HOLD " + string(obj_CustomJumpKeySpeed.keyText) + " OR " + string(obj_CustomUpKeySpeed.keyText) + " AND ";
		move3 = "PRESS " + string(obj_CustomAct3KeySpeed.keyText) + " (CHARGEABLE)";
		move4 = "REVOLVER (AIR-DASH): PRESS " + string(obj_CustomAct3KeySpeed.keyText);
		move5 = "(CHARGEABLE)";
		move6 = "REVOLVER (RELOAD): PRESS " + string(obj_CustomAct5KeySpeed.keyText);
	} else if global.SelectedPlayer == 15 {
		move1 = "";
		move2 = "";
		move3 = "";
		move4 = "";
		move5 = "";
		move6 = "";
	} else if global.SelectedPlayer == 16 {
		move1 = "";
		move2 = "";
		move3 = "";
		move4 = "";
		move5 = "";
		move6 = "";
	} else {
		move1 = "DOUBLE-JUMP: PRESS " + string(obj_CustomJumpKeySpeed.keyText) + " (MID-AIR)";
		move2 = "AIR-DASH: PRESS " + string(obj_CustomAct3KeySpeed.keyText) + " (MID-AIR)";
		move3 = "";
		move4 = "";
		move5 = "";
		move6 = "";
	}
} else {
	move1 = "??";
	move2 = "??";
	move3 = "??";
	move4 = "??";
	move5 = "??";
	move6 = "??";
}

