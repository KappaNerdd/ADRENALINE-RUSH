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


randomize();

var _colRandom = ceil(random(7));

if _colRandom == 1 {
	sprColor = global.colRed;
} else if _colRandom == 2 {
	sprColor = global.colOrange;
} else if _colRandom == 3 {
	sprColor = global.colYellow;
} else if _colRandom == 4 {
	sprColor = global.colGreen;
} else if _colRandom == 5 {
	sprColor = global.colBlue;
} else if _colRandom == 6 {
	sprColor = global.colPurple;
} else if _colRandom == 7 {
	sprColor = global.colPink;
}