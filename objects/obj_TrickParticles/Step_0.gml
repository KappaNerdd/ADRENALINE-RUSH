if createTimer > 0 {
	createTimer -= 1;
} else {
	if image_alpha > 0 {
		image_alpha -= 0.1;
	} else {
		instance_destroy();
	}
}

movedX = lerp(movedX, 0, 0.05);
movedY = lerp(movedY, 0, 0.05);

drawX += movedX;
drawY += movedY;