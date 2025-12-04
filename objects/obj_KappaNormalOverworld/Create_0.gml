#region //Sprites
	if global.PlayerCostume == 0 {
		scr_SpriteDataKappaNormal();
	} else if global.PlayerCostume == 1 {
		scr_SpriteDataKappaHideki();
	}
#endregion

#region //Character Data
	#region //Mask Collisions
		idle_Mask = kappa_Idle_Mask;
		crouch_Mask = kappa_Crouch_Mask;
		slide_Mask = kappa_Slide_Mask;
	#endregion

	#region //Idles
		sprIdle = kappa_Idle;
		sprSpecialIdle = kappa_Special_Idle;
		sprPrepare = kappa_Prepare;
		sprCrouch = kappa_Ducking;
		sprLook_up = kappa_Look_Up;
		sprGuard = kappa_Guarding;
	#endregion

	#region //Runnings
		sprWalk = kappa_Walking;
		sprRun = kappa_Running;
		sprFullSpeedRun = kappa_FullSpeed;
	#endregion
	
	#region //Jumpings
		sprJump = kappa_jumping;
		sprFall = kappa_Falling;
		sprFalling = kappa_Falling_Loop;
		sprDJump = kappa_DJumping;
	#endregion
	
	#region //Extras
		sprAirDash = kappa_AirDash;
		sprSlide = kappa_Sliding;
		sprStomping = kappa_Stomping;
		sprStomp = kappa_Stomp;
		sprWallSlide = kappa_WallSlide;
		sprSkid = kappa_Skid;
	#endregion
	
	#region //Rail-Grinds
		sprRailGrind = kappa_RailGrind;
		sprRailGrindCrouch = kappa_RailGrindCrouch;
		sprRailJump = kappa_RailJump;
	#endregion
	
	#region //Tricks
		sprTrickUpPre = kappa_TrickUpPre;
		sprTrickUp = kappa_TrickUp;
		sprTrickSidePre = kappa_TrickSidePre;
		sprTrickSide = kappa_TrickSide;
		sprTrick1 = kappa_Trick1;
		sprTrick2 = kappa_Trick2;
		sprTrick3 = kappa_Trick3;
		sprTrick3Fin = kappa_TrickFinish;
	#endregion
	
	#region //Hurts
		sprOmegaFall = kappa_OmegaFall;
		sprDeath = kappa_Death;
	#endregion
	
	#region //Special
		sprPully = kappa_Pully;
	#endregion
#endregion

#region //Character Data Variables
	scr_CharDataKappa();
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

#region //Air Dash
	airDash = false;
	airDashTimer = 0;
	airDashFrames = 10;
#endregion

#region //Stomping
	stomping = false;
	stomped = false;
#endregion
