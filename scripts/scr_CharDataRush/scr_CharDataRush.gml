function scr_CharDataRush() {
	
	///-----Number Variables-----///
	
	//Angle
	drawAngle = 0;

	//Speed
	acc = 0.08;
	normalAcc = 0.08;
	
	dcc = 0.16;
	fric = 0.08;
	vel = 0;
	max_Speed = 12;
	full_Speed = 17;
	boost_Speed = 19;

	//Jump Speed & Gravity
	grav = 0.26;
	yspd = 0;
	jspd = 7.25;
	normalJspd = 7.25;
	
	termVel = 25;
	normalTermVel = 25;
	
	backTrickBoost = 10;
	backTrickUpBoost = -6;
	sideTrickBoost = 14;
	fullTrickBoost = 19;
	upTrickBoost = -11;
	
	//360 movement
	acos = 1;
	asin = 0;

	//Stomp Recovery
	stompedTimer = 0;
	stompedFrames = 26;

}