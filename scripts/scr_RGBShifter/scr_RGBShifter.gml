enum COLORS {
	KAPPA = make_colour_rgb(010, 036, 203),
	LUCIFER = make_colour_rgb(207, 041, 229),
	SARAH = make_colour_rgb(064, 245, 255),
	SARAHALT = make_colour_rgb(255, 054, 144),
	LONE = make_colour_rgb(114, 070, 217),
	BROCK = make_colour_rgb(220, 067, 030),
	NEEGI = make_colour_rgb(114, 000, 255),
	CLOEE = make_colour_rgb(255, 132, 025),
	AKIRA = make_colour_rgb(143, 000, 000),
	TAYLOR = make_colour_rgb(198, 025, 064),
	AYANA = make_colour_rgb(207, 046, 087),
	ROXXANE = make_colour_rgb(241, 139, 176),
	RUSH = make_colour_rgb(000, 200, 248),
	EDGE = make_colour_rgb(046, 036, 052),
	IVY = make_colour_rgb(255, 189, 000),
}

function scr_CreateRBG() {
	global.r = 255;
	global.g = 255;
	global.b = 255;
	
	global.realR = 255;
	global.realG = 255;
	global.realB = 255;
	
	global.fullRGB = 0;
}

function scr_ShiftRGB() {
	global.realR = lerp(global.realR, global.r, 0.05);
	global.realG = lerp(global.realG, global.g, 0.05);
	global.realB = lerp(global.realB, global.b, 0.05);
	
	if !global.MIND {
		if global.ColorCode {
			global.fullRGB = make_color_rgb(global.realR, global.realG, global.realB);
		} else {
			global.fullRGB = global.ColorBase[global.ChangeColor][0];
		}
	} else {
		global.r = 255;
		global.g = 255;
		global.b = 255;
		
		global.fullRGB = make_color_rgb(global.realR, global.realG, global.realB);
	}
	
	//gamepad_set_colour(global.Player1Con, global.fullRGB);
}
