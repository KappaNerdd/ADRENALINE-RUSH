if fireTimer > 0 {
	fireTimer -= 1;
}


if fireTimer <= 0 {
	obj_SFXManager.UndertaleFireLoop = true;
}


if global.Particles == true {
	if !instance_exists(obj_HeadSmoke) {
		instance_create_depth(obj_HeadCarFire.x + 10 + random_range(0, 190), obj_HeadCarFire.y + 100, depth, obj_HeadSmoke);
	}
}