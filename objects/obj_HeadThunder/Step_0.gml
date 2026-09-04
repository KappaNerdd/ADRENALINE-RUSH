sprite_index = thunderSpr;

if thunderComplete {
	if image_alpha > 0 {
		image_alpha -= 0.01;
	} else {
		instance_destroy();
	}
}

if global.ThunderOpacity > 0 {
	global.ThunderOpacity -= 0.008;
}