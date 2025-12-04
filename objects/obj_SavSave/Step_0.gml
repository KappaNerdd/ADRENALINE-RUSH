getCharacterControls();

confirm_Key = jump_Key;
cancel_Key = action_Key;


if hovered == true {
	sprCol = c_white;
} else {
	sprCol = c_grey;
}



if hovered == true && (right_Key_Once) {
	hovered = false;
	obj_SavCancel.hovered = true;
	obj_SFXManager.menuTap = true;
}



if hovered == true && confirm_Key {
	global.Health = global.MaxHealth;
	
	save_game(global.saveFile);
	scr_SaveFiles();
	instance_create_depth(x, y, depth, obj_SaveIcon);
	
	global.RespawnX = obj_Player.x;
	global.RespawnY = obj_Player.y;

	obj_SFXManager.omegaConfirm = true;
	obj_SavBox.saveConfirmed = true;

	instance_destroy(obj_SavCancel);
	instance_destroy();
}
