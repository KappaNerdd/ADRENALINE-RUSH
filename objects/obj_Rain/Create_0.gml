randomize();

x = camera_get_view_x(view_camera[0]) - 500 + (random(camera_get_view_width(view_camera[0]) + 800));
y = camera_get_view_y(view_camera[0]) - 50;

grav = 0.25;
vSpeed = 8;


var _size = random_range(0.5, 3);

image_xscale = _size;
image_yscale = _size + 2;

image_alpha = random_range(0.5, 1);

alarm_set(0, 240);

var _random = ceil(random(8));
selRandom = _random;