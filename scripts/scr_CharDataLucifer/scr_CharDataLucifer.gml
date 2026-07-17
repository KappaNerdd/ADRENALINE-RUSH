function scr_CharDataLucifer() {
	///-----Number Variables-----///
	
	//Angle
	drawAngle = 0;

	//Speed
	acc = 0.08;
	normalAcc = 0.08;
	
	dcc = 0.16;
	fric = 0.08;
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