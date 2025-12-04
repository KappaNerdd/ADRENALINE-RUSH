if global.Particles {
	randomize();
	var _rainRandom = ceil(random(0));

	if _rainRandom == 0 {
		instance_create_depth(0, -100, -1000, obj_Rain);
	}
}