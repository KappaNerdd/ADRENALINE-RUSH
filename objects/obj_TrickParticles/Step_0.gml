if createTimer > 0 {
	createTimer -= 1;
}

if createTimer <= 0 {
	if image_alpha > 0 {
		image_alpha -= 0.1;
	}
	
	if image_alpha <= 0 {
		instance_destroy();
	}
}



if movedX > 0 {
	movedX -= 0.1;
} else if movedX < 0 {
	movedX += 0.1;
}

if movedY > 0 {
	movedY -= 0.1;
} else if movedY < 0 {
	movedY += 0.1;
}


drawX += movedX;
drawY += movedY;