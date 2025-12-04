getCharacterControls();

confirm_Key = jump_Key;
cancel_Key = action_Key;

left_Key = left_Key_Once;
right_Key = right_Key_Once;


if hovered == true {
	sprCol = c_white;
} else {
	sprCol = c_grey;
}

if hovered == true && confirmed == false && left_Key {
	hovered = false;
	obj_FileBoxYes.hovered = true;
	
	obj_SFXManager.menuTap = true;
}


if hovered == true && confirmed == false && confirm_Key {	
	confirmed = true;
}


if confirmed == true {
	if instance_exists(obj_FileBoxChecker) {
		obj_FileBoxChecker.yspd += 1;
	}
}

if !instance_exists(obj_FileBoxChecker) {
	instance_destroy();
}