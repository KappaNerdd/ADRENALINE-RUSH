function scr_CharDataKappa() {
	
	///-----Number Variables-----///
	
	//Angle
	drawAngle = 0;

	//Speed
	acc = 0.07;
	normalAcc = 0.07;
	
	dcc = 0.12;
	fric = 0.07;
	vel = 0;
	max_Speed = 11;
	full_Speed = 16;
	boost_Speed = 18;

	//Jump Speed & Gravity
	grav = 0.25;
	yspd = 0;
	
	jspd = 7.1;
	normalJspd = 7.1;
	railJspd = -14.2;
	
	termVel = 25;
	normalTermVel = 25;
	
	backTrickBoost = 9;
	backTrickUpBoost = -5.5;
	sideTrickBoost = 11;
	fullTrickBoost = 16;
	upTrickBoost = -11;
	
	//360 movement
	acos = 1;
	asin = 0;

	//Stomp Recovery
	stompedTimer = 0;
	stompedFrames = 26;

}