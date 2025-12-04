sprite_index = thunderSpr;

if thunderComplete == true {
	if image_alpha > 0 {
		image_alpha -= 0.01;
	}
}

if image_alpha <= 0 {
	instance_destroy();
}

if global.ThunderOpacity > 0 {
	global.ThunderOpacity -= 0.008;
}