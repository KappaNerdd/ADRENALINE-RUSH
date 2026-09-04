function scr_CreateAfterImage(_x, _y, _depth, _solidCol = false, _col = c_white) {
	if !global.SimplifyVFX {
		with(instance_create_depth(_x, _y, _depth, obj_PlayerTrail)) {
			solidCol = _solidCol;
			
			sprite_index = other.sprite_index;
			image_index = other.image_index;
			image_angle = other.image_angle;
			image_xscale = other.image_xscale;
			image_yscale = other.image_yscale;
			image_speed = 0;
			image_blend = _col;
		}
	}
}