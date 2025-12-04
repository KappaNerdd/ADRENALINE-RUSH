image_alpha = 0;

depth = obj_Player.depth + 1;
xspd = random_range(-1, 1);
yspd = random_range(-1, 1);

changeAlpha = 0.01;
alphaDown = false;

runText = "";

runTextRandom = ceil(random(4));

if runTextRandom == 1 {
	runText = "RUN";
} else if runTextRandom == 2 {
	runText = "LEAVE";
} else if runTextRandom == 3 {
	runText = "GO BACK";
} else if runTextRandom == 4 {
	runText = "PLEASE";
}


obj_SFXManager.menuTap = true;