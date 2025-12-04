if !created {
	created = true;
	with(instance_create_depth(x - (27 * image_xscale), y + zipY, depth, obj_Pully)) {
		pullyBase = other.id;
	}
}