getCharacterControls();

if splashConfirm == false && (pause_Key or jump_Key) {
	splashConfirm = true;
}

if splashConfirm == true {
	if splashTimer > 0 {
		splashTimer -= 1;
	}
}


if splashTimer <= 0 {
	if !instance_exists(obj_RoomTransitionBasic) {
		var instantiated = instance_create_depth(0, 0, -999999, obj_RoomTransitionBasic);
		instantiated.target_rm = target_rm;
	}
}


sprite_index = obj_CustomJumpKeySpeed.sprite_index;
image_index = obj_CustomJumpKeySpeed.image_index;