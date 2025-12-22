function scr_CharDataIvy() {
	
	///-----Number Variables-----///
	
	//Angle
	drawAngle = 0;

	//Speed
	acc = 0.045;
	normalAcc = 0.045;
	
	dcc = 0.08;
	fric = 0.045;
	vel = 0;
	max_Speed = 9;
	full_Speed = 14;
	boost_Speed = 16;

	//Jump Speed & Gravity
	grav = 0.21;
	yspd = 0;
	jspd = 6.75;
	normalJspd = 6.75;
	
	termVel = 19;
	normalTermVel = 19;
	
	backTrickBoost = 7;
	backTrickUpBoost = -7;
	sideTrickBoost = 9;
	fullTrickBoost = 14;
	upTrickBoost = -10;
	
	//360 movement
	acos = 1;
	asin = 0;

	//Stomp Recovery
	stompedTimer = 0;
	stompedFrames = 26;

}