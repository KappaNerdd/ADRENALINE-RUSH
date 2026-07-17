baseX = 0;
baseY = 0;

moveX = 0;
moveY = 0;

createTimer = 120;

miss = false;
parry = false;
amount = 0;

col = c_white;

if baseX > 384 {
	xspd = -2;
} else {
	xspd = 2;
}

yspd = -2;

image_yscale = 0;
image_xscale = 1.5;
depth = -8;