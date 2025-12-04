sprMessage = noone;

message1 = spr_MessKappaDamnHead;
message2 = spr_MessKappaComeHead;
message3 = spr_MessKappaBruhHead;
message4 = spr_MessKappaTryinHead;

obj_SFXManager.menuCancel = true;


///-----Character Messages-----///
if global.PlayerChar == 1 { //Kappa
	message1 = spr_MessKappaDamn;
	message2 = spr_MessKappaCome;
	message3 = spr_MessKappaBruh;
	message4 = spr_MessKappaTryin;
} else if global.PlayerChar == 2 { //Sarah
	message1 = spr_MessSarahDontGive;
	message2 = spr_MessSarahGotThis;
	message3 = spr_MessSarahBeOk;
	message4 = spr_MessSarahNoRush;
} else if global.PlayerChar == 12 { //Ivy
	message1 = spr_MessIvyDoBetter;
	message2 = spr_MessIvyGoAgain;
	message3 = spr_MessIvyYeesh;
	message4 = spr_MessIvyNotherShot;
} else { //Kappa (Head)
	message1 = spr_MessKappaDamnHead;
	message2 = spr_MessKappaComeHead;
	message3 = spr_MessKappaBruhHead;
	message4 = spr_MessKappaTryinHead;
}


randomize();

messRandom = ceil(random(4));

if messRandom == 1 {
	sprMessage = message1;
} else if messRandom == 2 {
	sprMessage = message2;
} else if messRandom == 3 {
	sprMessage = message3;
} else if messRandom == 4 {
	sprMessage = message4;
}


sprite_index = sprMessage;

x = -100000000;

alarm_set(0, 60);

image_xscale = 0.5;
image_yscale = 0.5;

visible = false;


if !global.Freeplay && global.PlayerExtraLives > 0 {
	global.PlayerExtraLives = global.PlayerExtraLives - 1;
}