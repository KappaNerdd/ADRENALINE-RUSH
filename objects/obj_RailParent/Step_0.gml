// Inherit the parent event
event_inherited();


if instance_exists(obj_Player) {
	if obj_Player.y < y - 8 {
		active = true;
	} else {
		active = false;
	}
}