getCharacterControls();

//Change message if controller is connected and what controller type is active.

if gamepad_is_connected(0) {
	if global.ConType == 0 {
		hintMessageGeneral = hintMessageXbox;
	} else if global.ConType == 1 {
		hintMessageGeneral = hintMessagePS4;
	} else if global.ConType == 2 {
		hintMessageGeneral = hintMessageSwitch;
	}
} else {
	hintMessageGeneral = hintMessageKeyboard;
}


//Move Textbox
y += yspd;


if confirmed == false {
	if yspd > 0 {
		yspd -= 0.5;
	}
} else {
	yspd += 1;
	
	if yspd >= 40 {
		obj_Player.can_MoveFULL = true;
		instance_destroy();
	}
}


if confirmed == false && (jump_Key) {
	confirmed = true;
	
	obj_SFXManager.menuPop = true;
}