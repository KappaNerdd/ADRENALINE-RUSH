fx_set_parameter(hueFX, "g_HueShift", hueColor);
fx_set_parameter(hueFX, "g_HueSaturation", hueSat);


if keyboard_check(vk_alt) {
	hueColor += 0.005;
}

if keyboard_check(vk_backspace) {
	hueColor -= 0.005;
}

if hueColor > 1 {
	hueColor = 0;
}
