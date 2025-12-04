vSpeed += grav;
y += vSpeed;

if (place_meeting(x, y, obj_Solid) or place_meeting(x, y, obj_Player)) {
	repeat(selRandom) {
		instance_create_depth(x, y + 20, depth, obj_RainSplash);
	}
	
	instance_destroy();
}

