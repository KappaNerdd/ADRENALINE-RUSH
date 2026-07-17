#region //Sprites
	if global.PlayerCostume == 0 {
		scr_SpriteDataRushNormal();
	}
#endregion

#region //Character Data Variables
	scr_CharDataRush();
#endregion

#region //Basic Variables
	scr_BasicVariablesSpeedCreate();
#endregion

#region //Girly/Left-Facing/Sonic & Blaze Rush
	//Choose if your character has unique left-facing sprites or not
	leftFacer = false;
	
	//Choose if your character should play Sonic's boost sound or Blaze's boost sound.
	sonicRush = true;
	blazeRush = false;
#endregion

#region //Sleeping
	sleepTimer = 0;
	sleepFrames = 10;
#endregion

#region //Extras
	airDash = false;
	railJspd = -20;
#endregion

#region //Spindash
	spindash = false;
	spindashRev = false;
	spindashTimer = 0;
	spindashMax = 200;
#endregion

#region //Dropdash
	dropdash = false;
	dropdashTimer = 0;
	dropdashFrames = 10;
	dropdashing = false;
#endregion

#region //Super Peelout
	superPeelout = false;
	superPeeloutTimer = 0;
	superPeeloutMax = 300;
#endregion

#region //Stomping
	stomping = false;
	stomped = false;

	preStomp = false;
	preStompTimer = 0;
	preStompFrames = 15;
	alreadyStomped = false;
#endregion

#region //Homing-Attack
	scr_HomingAttackCreate();
#endregion