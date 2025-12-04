if !instance_exists(obj_PauseMenuOverworld) {
	if instance_exists(obj_Player) {
		draw_sprite_ext(sprite_index, image_index, obj_Player.x - 25, obj_Player.y - 40, 0.75, 0.75, 0, c_white, image_alpha);
	} else {
		draw_self();
	}
}