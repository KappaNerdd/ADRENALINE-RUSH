getCharacterControls();

confirm_Key = jump_Key;
cancel_Key = action_Key;


if hovered == true {
	sprCol = c_white;
} else {
	sprCol = c_grey;
}


if hovered == true && (left_Key_Once) {
	hovered = false;
	obj_SavSave.hovered = true
	obj_SFXManager.menuTap = true;
}

if hovered == true && confirm_Key {
	obj_SFXManager.menuCancel = true;
	obj_Player.can_MoveFULL = true;
	
	instance_destroy(obj_SavBox);
	instance_destroy(obj_SavSave);
	instance_destroy();
}