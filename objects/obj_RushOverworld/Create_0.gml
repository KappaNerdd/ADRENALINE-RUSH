#region //Sprites
	if global.PlayerCostume == 0 {
		scr_SpriteDataRushNormal();
	}
#endregion

#region //Character Data
	#region //Mask Collisions
		idle_Mask = rush_Idle_Mask;
		crouch_Mask = rush_Crouch_Mask;
		slide_Mask = rush_Slide_Mask;
	#endregion

	#region //Idles
		sprIdle = rush_Idle;
		sprSpecialIdle = rush_Special_Idle;
		sprPrepare = rush_Prepare;
		sprCrouch = rush_Ducking;
		sprLook_up = rush_Look_Up;
	#endregion
	
	#region //Running
		sprWalk = rush_Walking;
		sprRun = rush_Running;
		sprFullSpeedRun = rush_FullSpeed;
		sprPeelout = rush_Peelout;
		sprSpindash = rush_Spindash;
		sprSpindashRev = rush_SpindashRev;
		sprPeeloutRev = rush_PeeloutRev;
	#endregion
	
	#region //Jumping
		sprJump = rush_jumping;
		sprFall = rush_Falling;
		sprFalling = rush_Falling_Loop;
		sprDJump = rush_DJumping;
		sprDropdash = rush_Dropdash;
	#endregion

	#region //Extras
		sprPreStomp = rush_PreStomp;
		sprStomping = rush_Stomping;
		sprStomp = rush_Stomping;

		sprWallSlide = rush_WallSlide;
		sprWallJump = rush_AirDash;
		sprSkid = rush_Skid;
		sprSlide = rush_Sliding;
	#endregion

	#region //Rail-Grind
		sprRailGrind = rush_RailGrind;
		sprRailGrindCrouch = rush_RailGrindCrouch;
		sprRailJump = rush_RailJump;
	#endregion

	#region //Tricks
		sprTrickUpPre = rush_TrickUpPre;
		sprTrickUp = rush_TrickUp;
		sprTrickSidePre = rush_TrickSidePre;
		sprTrickSide = rush_TrickSide;
		sprTrick1 = rush_Trick1;
		sprTrick2 = rush_Trick2;
		sprTrick3 = rush_Trick3;
		sprTrick3Fin = rush_TrickFinish;
	#endregion

	#region //Hurt
		sprOmegaFall = rush_OmegaFall;
		sprDeath = rush_Death;
	#endregion
	
	#region //Special
		sprPully = rush_Pully;
	#endregion
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