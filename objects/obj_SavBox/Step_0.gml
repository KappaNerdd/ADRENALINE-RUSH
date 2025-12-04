getCharacterControls();

y += yspd;


if yspd > 0 {
	yspd -= 0.5;
}

if saveConfirmed == true && omegaConfirmed == false && yspd == 0 && (jump_Key or action_Key) {
	omegaConfirmed = true;
}

if omegaConfirmed == true {
	yspd += 1;
}

if yspd >= 30 {
	obj_Player.can_MoveFULL = true;
	instance_destroy();
} else {
	obj_Player.can_MoveFULL = false;
}