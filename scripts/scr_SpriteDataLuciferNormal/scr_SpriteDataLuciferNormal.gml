function scr_SpriteDataLuciferNormal() {
	//Particles & VFX
	trinkPart = spr_BoostEmblemLucifer;
	trickFinalePart = spr_LuciferTrickFinalVFX;
	
	//Palettes
	basePal = spr_LuciferPalette;
	
	if !global.MIND && global.PlayerChar != 0 {
		headPal = spr_LuciferPalette;
	} else {
		headPal = spr_LuciferPaletteHead;
	}
	
	//Particles
	if !global.MIND && global.PlayerChar != 0 {
		boostingSprite = spr_LuciferBoost;
		boostingSpriteSimple = spr_LuciferBoostSimple;
	
		stompingSprite = spr_LuciferStompingVFX;
		stompedSprite = spr_LuciferStompedVFX;
	
		speedBreakSprite = spr_LuciferSpeedBreakVFX;
	} else {
		boostingSprite = spr_KappaHeadBoost;
		boostingSpriteSimple = spr_KappaHeadBoostSimple;
	
		stompingSprite = spr_HeadStompingVFX;
		stompedSprite = spr_HeadStompedVFX;
	
		speedBreakSprite = spr_HeadSpeedBreakVFX;
	}
	
	///-----Mask Collisions-----///

	//Idle + Look Up + Walk + Run + Jump + Double Jump + Fall + Guard + Stomp + Air Dash + Wall Jump
	idle_Mask = spr_LuciferIdleMask;

	//Crouch
	crouch_Mask = spr_LuciferCrouchMask;

	//Slide
	slide_Mask = spr_LuciferSlideMask;



	///-----Animations-----///

	//Idle
	sprIdle = spr_LuciferIdle;
	sprSpecialIdle = spr_LuciferSpecialIdle;
	sprPrepare = spr_KappaPrepareSolo;


	//Movement
	sprWalk = spr_LuciferWalk;
	sprRun = spr_LuciferRun;
	sprFullSpeedRun = spr_LuciferFullSpeedRun;
	sprSkid = spr_LuciferSkid;


	//Jumping
	sprJump = spr_LuciferJump;
	sprDJump = spr_LuciferDJump;


	//Falling
	sprFall = spr_LuciferFalling;
	sprFalling = spr_LuciferFalling;
	sprWallSlide = spr_KappaWallCling;


	//Look Up & Crouching
	sprCrouch = spr_LuciferCrouch;
	sprLook_up = spr_LuciferLookUp;


	//Actions
	sprGuard = spr_KappaGuard;
	sprSlide = spr_LuciferSlide;
	sprGlide = spr_LuciferGlide;

	sprStomping = spr_LuciferStomping;
	sprStomp = spr_LuciferStomp;

	sprRailGrind = spr_LuciferRailGrind;
	sprRailGrindCrouch = spr_KappaRailGrindCrouch;
	
	
	//Launches
	sprRailJump = spr_LuciferRailJump;
	sprUpLaunch = spr_LuciferLauncherUp;
	sprSideLaunch = spr_LuciferLauncher;
	
	
	//Tricking
	sprTrickUpPre = spr_LuciferTrickPre;
	sprTrickUp = spr_LuciferTrickUp;
	
	sprTrickSidePre = spr_LuciferTrickPre;
	sprTrickSide = spr_LuciferTrickRight;
	
	sprTrick1 = spr_LuciferTrick1;
	sprTrick2 = spr_LuciferTrick2;
	sprTrick3 = spr_LuciferTrick3;
	sprTrick3Fin = spr_LuciferTrickFin;
	
	sprRailTrick1 = spr_LuciferRailTrick1;
	sprRailTrick2 = spr_LuciferRailTrick2;
	sprRailTrick3 = spr_LuciferRailTrick3;

	//Special
	sprPully = spr_KappaPully;
	
	
	//Hurting
	sprDeath = spr_KappaDeath;
	sprOmegaFall = spr_LuciferHurt;
	sprSpiral = spr_LuciferSpiral;
	
	
	//Victory
	sprVictory = spr_LuciferVictory;
	
	//Balance
	sprBalanceFor = spr_LuciferBalanceForward;
	sprBalanceBack = spr_LuciferBalanceBackward;
	
	//Pushing
	sprPush = spr_LuciferPush;
	
	//Free-Fall
	sprFreeFall = spr_LuciferCDTwirl;
	sprFallDash = spr_LuciferFallDash;
}