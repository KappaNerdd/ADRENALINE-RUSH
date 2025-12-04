if place_meeting(x, y, obj_Solid) {
	collide = true;
} else {
	collide = false;
}

if instance_number(obj_PlayerHurtJump) > 1 {
	instance_destroy();
}