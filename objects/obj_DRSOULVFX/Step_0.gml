image_alpha -= changeShit / 1.5;
newScale += changeShit;

image_xscale = newScale * 1.5;
image_yscale = newScale;

if image_alpha <= 0 {
	instance_destroy();
}