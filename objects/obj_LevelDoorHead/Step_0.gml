getCharacterControls();

if !locked && instance_exists(obj_Player) && place_meeting(x, y, obj_Player) && (obj_Player.can_MoveFULL) && (action2_Key) && obj_Player.ground == true && obj_Player.vel == 0 && obj_Player.stomped == false {
	if !instance_exists(obj_RoomTransitionBasicStage) {
		var instantiated = instance_create_depth(0, 0, -999999999, obj_RoomTransitionBasicStage);
		instantiated.target_rm = rm_LevelCard;
	}
	
	global.SpeedSelected = setLevel;
} else if locked && instance_exists(obj_Player) && place_meeting(x, y, obj_Player) && (obj_Player.can_MoveFULL) && (action2_Key) && obj_Player.ground == true && obj_Player.vel == 0 && obj_Player.stomped == false {
	obj_SFXManager.funkinLocked = true;
}


if locked == false {
	image_alpha = 1;
} else {
	image_alpha = 0.5;
}