getCharacterControls();

if action2_Key && obj_Player.vel == 0 && !instance_exists(obj_CutsceneHead7) {
	instance_create_depth(x, y, depth, obj_CutsceneHead7);
}


if obj_Player.x < x {
	image_xscale = -1;
} else if obj_Player.x > x {
	image_xscale = 1;
}