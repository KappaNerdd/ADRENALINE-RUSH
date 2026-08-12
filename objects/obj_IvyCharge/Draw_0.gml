for(var i = 0; i < 4; i++) {
	var _newX = lengthdir_x(15 * image_xscale, image_angle + (90 * i)) + obj_Player.x - obj_Player.angleSin * 10;
	var _newY = lengthdir_y(15 * image_xscale, image_angle + (90 * i)) + obj_Player.y - obj_Player.angleCos * 10;
	
	draw_sprite_ext(sprite_index, image_index, _newX, _newY, 1, 1, 0, image_blend, image_alpha);
}

