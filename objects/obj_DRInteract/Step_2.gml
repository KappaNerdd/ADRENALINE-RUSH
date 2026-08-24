visible = global.DEBUG;

x = followChar.x;
y = followChar.y;

if kysTimer > 0 {
	kysTimer--;
} else {
	instance_destroy();
}