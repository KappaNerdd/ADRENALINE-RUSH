spinSpeed = 0;

playerTouched = false;


vel = 0;
yspd = random_range(-4, -8);
grav = 0.1;
scaleSpeed = random_range(0.001, 0.005);

kysTimer = 300;


if instance_exists(obj_Player) {
	depth = obj_Player.depth + 1;
}