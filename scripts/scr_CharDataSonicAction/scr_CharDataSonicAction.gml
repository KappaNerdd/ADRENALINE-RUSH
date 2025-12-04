function scr_CharDataSonicAction() {
	//Left Facer
	leftFacer = false;
	face_Left = false;
	
	//Movement
	moveSpd = 3;
	moveMult = 1.5;

	//Jumping
	jumpCount = 0;
	ogJumpCount = 2;
	jspd = 7;
	normalJspd = 7;
	
	//Falling
	grav = 0.3;
	ogGrav = 0.3;
	floatGrav = ogGrav / 10;
	termVel = 10;

	//Dashing
	dashCount = 0;
	ogDashCount = 2;
	dashSpd = 5;
	
	//Sound
	blazeRush = false;
}