getCharacterControls();

if place_meeting(x, y, obj_Player) && obj_Player.can_Move && obj_Player.can_MoveFULL
&& !obj_Player.stomped && !obj_Player.specialIdle && obj_Player.ground && !obj_Player.ducking && !obj_Player.look_up
&& obj_Player.vel == 0 && obj_Player.canTalk && !instance_exists(obj_HintBox) && action2_Key {
	obj_SFXManager.funkinFav = true;
	obj_Player.can_Move = false;
	obj_Player.can_MoveFULL = false;
	global.DisableHUD = true;
	
	with(instance_create_depth(-100, 0, -10, obj_HintBox)) {
		hint = other.checkCons;
		hintName = other.moveHint;
		hintDesc = other.descHint;
		sprite_index = other.charHint;
	}
}