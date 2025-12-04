image_blend = global.fullRGB;

if global.SelectedPlayer == 0 {
	sprite_index = spr_SideBarHead;
} else {
	sprite_index = spr_SideBar;
}



//Character Descriptions
if global.PlayerChar == 2 {
	charName = "SARAH SUKI";
	charAge = "16";
	charDesc = "A cheerful girl with \na lot of spirit.";

	charAcc = 0.04;
	charDcc = 0.08;

	charMaxSpeed = 11;
	charFullSpeed = 16;

	charJspd = 7.25;
	charGravForce = 0.21;
} else if global.PlayerChar == 12 {
	charName = "IVY";
	charAge = "13";
	charDesc = "";

	charAcc = 0.03;
	charDcc = 0.06;

	charMaxSpeed = 9;
	charFullSpeed = 14;

	charJspd = 5.5;
	charGravForce = 0.18;
} else {
	charName = "KAPPA SUKI";
	charAge = "17";
	charDesc = "Lost.";

	charAcc = 0.05;
	charDcc = 0.1;

	charMaxSpeed = 12;
	charFullSpeed = 17;

	charJspd = 7;
	charGravForce = 0.25;
}