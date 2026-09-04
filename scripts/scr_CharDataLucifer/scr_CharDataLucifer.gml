function scr_CharDataLucifer() {
	///-----RGB Colors-----///
	if !global.MIND && global.PlayerChar != 0 {
		charR = 207; 
		charG = 041; 
		charB = 229;
	} else {
		charR = 255;
		charG = 255;
		charB = 255;
	}
	
	///-----Number Variables-----///
	
	//Angle
	drawAngle = 0;

	//Speed
	acc = 0.075;
	normalAcc = 0.075;
	
	dcc = 0.15;
	fric = 0.075;
	vel = 0;
	max_Speed = 10;
	full_Speed = 15;
	boost_Speed = 17;

	//Jump Speed & Gravity
	grav = 0.25;
	normalGrav = 0.25;
	yspd = 0;
	
	jspd = 7.25;
	normalJspd = 7.25;
	railJspd = -14.5;
	
	termVel = 30;
	normalTermVel = 30;
	
	backTrickBoost = 9;
	backTrickUpBoost = -5.5;
	sideTrickBoost = 25;
	fullTrickBoost = 25;
	upTrickBoost = -16;
	
	//360 movement
	acos = 1;
	asin = 0;

	//Stomp Recovery
	stompedTimer = 0;
	stompedFrames = 26;
}