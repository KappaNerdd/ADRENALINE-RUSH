with(instance_create_depth(-100000, 0, -10, obj_ActionCombo)) {
	playChar = other.id;
	player = other.player;
}

if player {
	global.ActionPlayer = id;
} else {
	global.ActionEnemy = id;
}