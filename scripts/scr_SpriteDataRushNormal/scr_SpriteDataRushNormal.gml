function scr_SpriteDataRushNormal() {
	//Palettes
	basePal = spr_RushPalette;
	
	if !global.MIND && global.PlayerChar != 0 {
		headPal = spr_RushPalette;
	} else {
		headPal = spr_RushPaletteHead;
	}
	
	//Particles
	if !global.MIND && global.PlayerChar != 0 {
		boostingSprite = spr_RushBoost;
		boostingSpriteSimple = spr_RushBoostSimple;
	
		stompingSprite = spr_RushStompingVFX;
		stompedSprite = spr_RushStompedVFX;
	
		speedBreakSprite = spr_RushSpeedBreakVFX;
	} else {
		boostingSprite = spr_KappaHeadBoost;
		boostingSpriteSimple = spr_KappaHeadBoostSimple;
	
		stompingSprite = spr_HeadStompingVFX;
		stompedSprite = spr_HeadStompedVFX;
	
		speedBreakSprite = spr_HeadSpeedBreakVFX;
	}
	
	///-----Mask Collisions-----///

	//Idle + Look Up + Walk + Run + Jump + Double Jump + Fall + Guard + Stomp + Air Dash + Wall Jump
	idle_Mask = spr_RushIdleMask;

	//Crouch
	crouch_Mask = spr_RushCrouchMask;

	//Slide
	slide_Mask = spr_RushSlideMask;



	///-----Animations-----///

	//Idle
	sprIdle = spr_RushIdle;
	sprSpecialIdle = spr_RushSpecialIdle;
	sprPrepare = spr_RushPrepare;


	//Movement
	sprWalk = spr_RushWalk;
	sprRun = spr_RushRun;
	sprFullSpeedRun = spr_RushFullSpeedRun;
	sprPeelout = spr_RushSuperPeelout;
	sprSkid = spr_RushSkid;


	//Jumping
	sprJump = spr_RushJump;
	sprDJump = spr_RushJump;


	//Falling
	sprFall = spr_RushFall;
	sprFalling = spr_RushFalling;
	sprWallSlide = spr_RushWallCling;


	//Look Up & Crouching
	sprCrouch = spr_RushCrouch;
	sprLook_up = spr_RushLookUp;


	//Actions
	sprDropdash = spr_RushDropdash;
	
	sprSpindash = spr_RushSpindash;
	sprSpindashRev = spr_RushSpindashRev;
	
	sprPeeloutRev = spr_RushPeeloutDash;
	
	sprSlide = spr_RushRolling;
	
	sprAirDash = spr_RushWallJump;

	sprPreStomp = spr_RushPreStomp;
	sprStomping = spr_RushStomping;

	sprRailGrind = spr_RushRailGrind;
	sprRailJump = spr_RushRailJump;
	
	sprTrickUpPre = spr_RushTrickUpPre;
	sprTrickUp = spr_RushTrickUp;
	
	sprTrickSidePre = spr_RushTrickSidePre;
	sprTrickSide = spr_RushTrickSide;
	
	sprTrick1 = spr_RushTrick1;
	sprTrick2 = spr_RushTrick2;
	sprTrick3 = spr_RushTrick3Fin;
	sprTrick3Fin = spr_RushTrick3Fin;
	
	
	//Hurt
	sprOmegaFall = spr_RushHurt;
	sprDeath = spr_RushDeath;
	
	//Special
	sprPully = spr_RushPully;
}