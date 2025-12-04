getCharacterControls();

if jump_Key or pause_Key {
	if !instance_exists(obj_RoomTransitionBasic) {
		var instantiated = instance_create_depth(0, 0, -999999, obj_RoomTransitionBasic);
		instantiated.target_rm = target_rm;
	}
}


if global.Language == 1 {	
	sprite_index = spr_GMSplashHead;
} else if global.Language == 2 {
	sprite_index = spr_GMSplashLatam;
}
