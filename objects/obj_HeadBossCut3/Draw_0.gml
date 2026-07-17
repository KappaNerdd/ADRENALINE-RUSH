if raiseMeUpTimer <= 0 && !playerMove {
	draw_sprite_ext(spr_MoveArrows, 0, 384, 216, 2, 2, 0, c_white, 0.5);
}

if spawnEnemies && !playerMove2 {
	draw_sprite_ext(spr_MoveArrows, 0, 234, 216, 2, 2, 0, c_white, 0.5);
	draw_sprite_ext(obj_CustomJumpKeySpeed.sprite_index, obj_CustomJumpKeySpeed.image_index, 454, 216, 2, 2, 0, c_white, 0.5);
}