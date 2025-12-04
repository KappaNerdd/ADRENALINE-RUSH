horiFloatAmplitude = random_range(0.05, 0.15);
horiFloatSpeed = random_range(0.05, 0.15);
horiFloatingOffset = 0;

floatAmplitude = random_range(0.001, 0.1);
floatSpeed = random_range(0.001, 0.01);
floatingOffset = 0;

rotationAmplitude = random_range(0.001, 0.01);
rotationSpeed = random_range(0.001, 0.01);
rotationOffset = 0;

xspd = random_range(-1, 1);
yspd = random_range(-0.1, -4);

changeScale = random_range(-0.1, 1.5);

image_xscale = changeScale;
image_yscale = changeScale;


image_angle = random_range(0, 360);
image_alpha = 1;

image_index = random(3);

depth = random_range(-120000000, -130000000);

timer = 3 * 60;

scr_GetCharBoostIcon();

sprite_index = iconSprite;
	