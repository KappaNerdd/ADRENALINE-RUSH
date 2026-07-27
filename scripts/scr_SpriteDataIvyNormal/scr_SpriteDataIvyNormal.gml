function scr_SpriteDataIvyNormal() {
	//Particles & VFX
	trinkPart = spr_BoostEmblemIvy;
	trickFinalePart = spr_IvyTrickFinalVFX;
	
	//Palettes
	basePal = spr_IvyPalette;
	
	if !global.MIND && global.PlayerChar != 0 {
		headPal = spr_IvyPalette;
	} else {
		headPal = spr_IvyPaletteHead;
	}
	
	//Particles
	if !global.MIND && global.PlayerChar != 0 {
		boostingSprite = spr_IvyBoost;
		boostingSpriteSimple = spr_IvyBoostSimple;
	
		stompingSprite = spr_IvyStompingVFX;
		stompedSprite = spr_IvyStompedVFX;
	
		speedBreakSprite = spr_IvySpeedBreakVFX;
	} else {
		boostingSprite = spr_KappaHeadBoost;
		boostingSpriteSimple = spr_KappaHeadBoostSimple;
	
		stompingSprite = spr_HeadStompingVFX;
		stompedSprite = spr_HeadStompedVFX;
	
		speedBreakSprite = spr_HeadSpeedBreakVFX;
	}
	
	///-----Mask Collisions-----///

	//Idle + Look Up + Walk + Run + Jump + Double Jump + Fall + Guard + Stomp + Air Dash + Wall Jump
	idle_Mask = spr_IvyIdleMask;

	//Crouch
	crouch_Mask = spr_IvyCrouchMask;

	//Slide
	slide_Mask = spr_IvySlideMask;



	///-----Animations-----///

	//Idle
	sprIdle = spr_IvyIdle;
	sprSpecialIdle = spr_IvySpecialIdle;
	sprPrepare = spr_IvyPrepareSolo;


	//Movement
	sprWalk = spr_IvyWalk;
	sprRun = spr_IvyRun;
	sprFullSpeedRun = spr_IvyFullSpeedRun;
	sprSkid = spr_IvySkid;


	//Jumping
	sprJump = spr_IvyJump;
	sprDJump = spr_IvyJump;


	//Falling
	sprFall = spr_IvyFall;
	sprFalling = spr_IvyFalling;


	//Look Up & Crouching
	sprCrouch = spr_IvyCrouch;
	sprLook_up = spr_IvyLookUp;


	//Actions
	sprSlide = spr_IvySlide;

	sprPreStomp = spr_IvyPreStomp;
	sprStomping = spr_IvyStomping;
	sprHShooting = spr_IvyHoriShoot;
	sprStomp = spr_IvyStomped;

	sprRailGrind = spr_IvyRailGrind;
	
	sprShootGround = spr_IvyShootGround;
	sprShootAir = spr_IvyShootAir;
	
	//Launchers
	sprRailJump = spr_IvyRailJump;
	sprUpLaunch = spr_IvyRailJump;
	sprSideLaunch = spr_IvyRailJump;
	
	//Tricking
	sprTrickUpPre = spr_IvyTrickUpPre;
	sprTrickUp = spr_IvyTrickUp;
	
	sprTrickSidePre = spr_IvyTrickRightPre;
	sprTrickSide = spr_IvyTrickRight;
	
	sprTrick1 = spr_IvyTrick1;
	sprTrick2 = spr_IvyTrick2;
	sprTrick3 = spr_IvyTrick3Fin;
	sprTrick3Fin = spr_IvyTrick3Fin;
	
	sprRailTrick1 = spr_IvyRailGrindCrouch;
	sprRailTrick2 = spr_IvyRailGrind;
	sprRailTrick3 = spr_IvyRailGrindCrouch;
	
	//Special
	sprPully = spr_IvyPully;
	
	//Hurting
	sprDeath = spr_IvyDeath;
	sprOmegaFall = spr_IvyHurt;
	sprSpiral = spr_IvyHurt;
	
	
	//Victory
	sprVictory = spr_IvyIdle;
	
	//Balance
	sprBalanceFor = spr_IvyIdle;
	sprBalanceBack = spr_IvyIdle;
	
	//Pushing
	sprPush = spr_IvyWalk;
	
	//Free-Fall
	sprFreeFall = spr_IvyRailJump;
	sprFallDash = spr_IvySlide;
}