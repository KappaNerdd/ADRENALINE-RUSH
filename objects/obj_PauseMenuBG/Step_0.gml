if image_alpha < 0.15 {
	image_alpha += 0.005;
}

if !instance_exists(obj_PauseMenuOverworld) && !instance_exists(obj_PauseMenuSpeed) && !instance_exists(obj_PauseMenuSpeed) {
	instance_destroy();
}

sprite_index = box;

if global.PlayerChar == 0 {
	box = spr_PauseMenuBGBasic;
} if global.PlayerChar == 1 {
	box = spr_KappaTextbox;
}