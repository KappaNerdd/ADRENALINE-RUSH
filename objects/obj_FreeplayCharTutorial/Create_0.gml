depth = -20;

target_rm = 0;

image_xscale = 4;
image_yscale = 4;

scr_GetCharTextboxes();

waiting = false;
waitTimer = 90;


if global.SimplifyVFX {
	image_speed = 0;
} else {
	image_speed = 1;
}