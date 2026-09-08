grav = 0.1;
sprColor = c_white;
image_alpha = 1;
vspeed = random_range(-1, -5);

image_xscale = 1;
image_yscale = 1;

randomize();

hspeed = random_range(-3, 3);

image_speed = random_range(-1, 1);
image_index = random_range(0, 5);

var _colRandom = round(random(array_length(global.ColorBase) - 1));

sprColor = global.ColorBase[_colRandom][0];
