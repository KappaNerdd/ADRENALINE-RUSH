image_alpha -= 0.1;

if (image_alpha <= 0) {
	instance_destroy();
}



if lookingTimer > 0 {
	lookingTimer -= 1;
}

if !global.SimplifyVFX {
	visible = !visible;
}