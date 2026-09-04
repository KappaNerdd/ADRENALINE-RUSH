function scr_CharDataRush() {
	///-----RGB Colors-----///
	if !global.MIND && global.PlayerChar != 0 {
		charR = 000; 
		charG = 200; 
		charB = 248;
	} else {
		charR = 255;
		charG = 255;
		charB = 255;
	}
	
	///-----Number Variables-----///
	
	//Angle
	drawAngle = 0;

	//Speed
	acc = 0.1;
	normalAcc = 0.1;
	
	dcc = 0.15;
	fric = 0.1;
	vel = 0;
	max_Speed = 12;
	full_Speed = 17;
	boost_Speed = 19;

	//Jump Speed & Gravity
	grav = 0.26;
	yspd = 0;
	jspd = 7.25;
	normalJspd = 7.25;
	
	termVel = 30;
	normalTermVel = 30;
	
	backTrickBoost = 10;
	backTrickUpBoost = -6;
	sideTrickBoost = 15;
	fullTrickBoost = 20;
	upTrickBoost = -11;
	
	//360 movement
	acos = 1;
	asin = 0;

	//Stomp Recovery
	stompedTimer = 0;
	stompedFrames = 26;

}