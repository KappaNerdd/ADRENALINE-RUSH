function scr_CharDataSarah() {
	///-----Number Variables-----///
	
	//Angle
	drawAngle = 0;

	//Speed
	acc = 0.05;
	normalAcc = 0.05;
	
	dcc = 0.1;
	fric = 0.05;
	vel = 0;
	max_Speed = 10;
	full_Speed = 15;
	boost_Speed = 17;

	//Jump Speed & Gravity
	grav = 0.225;
	normalGrav = 0.225;
	yspd = 0;
	jspd = 7.25;
	normalJspd = 7.25;
	
	termVel = 20;
	normalTermVel = 20;
	full_TermVel = 35;
	
	backTrickBoost = 8;
	backTrickUpBoost = -5;
	sideTrickBoost = 10;
	fullTrickBoost = 15;
	upTrickBoost = -10;

	//Stomp Recovery
	stompedTimer = 0;
	stompedFrames = 20;
	
	//360 Movement
	acos = 1;
	asin = 0;
}