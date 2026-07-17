#region //Ivy Exclusives
	instance_create_depth(x, y, depth, obj_IvyRevolverUI);
	instance_create_depth(x, y, depth, obj_IvyCharge);
	instance_create_depth(x, y, depth, obj_IvyChargeSoul);
#endregion

#region //Sprites
	if global.PlayerCostume == 0 {
		scr_SpriteDataIvyNormal();
	}
#endregion

#region //Character Data Variables
	scr_CharDataIvy();
#endregion

#region //Basic Variables
	scr_BasicVariablesSpeedCreate();
#endregion

#region //Girly/Left-Facing/Sonic & Blaze Rush
	smallChar = true;

	//Choose if your character has unique left-facing sprites or not
	leftFacer = false;
	
	//Choose if your character should play Sonic's boost sound or Blaze's boost sound.
	sonicRush = false;
	blazeRush = true;
	
	railJspd = -20;
#endregion

#region //Shooting
	shootGround = false;
	shootAir = false;
	
	hShootWeak = false;
	hShootWeakTimer = 0;
	hShootWeakFrames = 15;
	
	hShoot = false;
	hShootFinish = false;
	hShootTimer = 0;
	hShootFrames = 15;

	revolverAmmo = 6;

	chargeTimer = 0;
	chargeFrames = 50;
	chargeTimer = chargeFrames;

	fullCharge = false;
	fullChargeAuraTimer = 0;
	fullChargeAuraFrames = 25;

	reload = false;
	reloadTimer = 0;
	reloadFrames = 60;
	reloadFramesAir = 150;
	reloadFramesAir2 = 240;
#endregion

#region //Stomping
	preStomp = false;
	preStompTimer = 0;
	preStompFrames = 15;

	stomping = false;
	stomped = false;
	stompPow = false;
#endregion

#region //Extras
	sensorTopDistance = 14;
#endregion
	