randomize();

x = random(room_width);

grav = 0.25;
vSpeed = 1;


var _size = random_range(0.5, 3);

image_xscale = _size;
image_yscale = _size + 2;

image_alpha = random_range(0.25, 1);

alarm_set(0, 240);

var _random = ceil(random(8));
selRandom = _random;