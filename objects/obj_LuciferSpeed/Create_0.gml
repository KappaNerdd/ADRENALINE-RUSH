#region //Sprites
	scr_SpriteDataLuciferNormal();
#endregion

#region //Character Data Variables
	scr_CharDataLucifer();
#endregion

#region //Basic Variables
	scr_BasicVariablesSpeedCreate();
#endregion

#region //Girly/Left-Facing/Sonic & Blaze Rush
	//Choose if your character has unique left-facing sprites or not
	leftFacer = false;
	
	//Choose if your character should play Sonic's boost sound or Blaze's boost sound.
	sonicRush = false;
	blazeRush = true;
#endregion

#region //Glide
	glide = false;
	glideTimer = 0;
	glideFrames = 150;
	afterGlide = false;
	glided = false;
	
	glideBurstTimer = 0;
	glideBurstFrames = 7;
#endregion

#region //Stomping
	preStomp = false;
	stomping = false;
	stomped = false;
#endregion

#region //Extra Trick Shit
	burstTrickTimer = 0;
	burstTrickFrames = 15;
	bursted = false;
	bursting = false;
#endregion

#region //Extra Special Idle
	specialAngle = 0;
#endregion