grav = 0.25;
image_alpha = 1;

image_xscale = 1;
image_yscale = 1;

randomize();

xspd = random_range(-10, 10);
yspd = random_range(-5, -15);

horiFloatAmplitude = 1;
horiFloatSpeed = 1;
horiFloatingOffset = 0;

moveX = random_range(0, 640);
moveY = 440;

kysTimer = 120;

image_speed = random_range(-3, 3);
image_index = random_range(0, 5);

var _colRandom = round(random(array_length(global.ColorBase) - 1));

sprColor = global.ColorBase[_colRandom][0];