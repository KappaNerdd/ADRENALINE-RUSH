function scr_SpriteDataRushNormal() {
	///-----Mask Collisions-----///

	//Idle + Look Up + Walk + Run + Jump + Double Jump + Fall + Guard + Stomp + Air Dash + Wall Jump
	rush_Idle_Mask = spr_RushIdleMask;

	//Crouch
	rush_Crouch_Mask = spr_RushCrouchMask;

	//Slide
	rush_Slide_Mask = spr_RushSlideMask;



	///-----Animations-----///

	//Idle
	rush_Idle = spr_RushIdle;
	rush_Special_Idle = spr_RushSpecialIdle;
	rush_Prepare = spr_RushPrepare;


	//Movement
	rush_Walking = spr_RushWalk;
	rush_Running = spr_RushRun;
	rush_FullSpeed = spr_RushFullSpeedRun;
	rush_Peelout = spr_RushSuperPeelout;
	rush_Skid = spr_RushSkid;


	//Jumping
	rush_jumping = spr_RushJump;
	rush_DJumping = spr_RushJump;


	//Falling
	rush_Falling = spr_RushFall;
	rush_Falling_Loop = spr_RushFalling;
	rush_WallSlide = spr_RushWallCling;
	rush_OmegaFall = spr_RushHurt;


	//Look Up & Crouching
	rush_Ducking = spr_RushCrouch;
	rush_Look_Up = spr_RushLookUp;


	//Actions
	rush_Dropdash = spr_RushDropdash;
	
	rush_Spindash = spr_RushSpindash;
	rush_SpindashRev = spr_RushSpindashRev;
	
	rush_PeeloutRev = spr_RushPeeloutDash;
	
	rush_Sliding = spr_RushRolling;
	
	rush_AirDash = spr_RushWallJump;

	rush_PreStomp = spr_RushPreStomp;
	rush_Stomping = spr_RushStomping;

	rush_RailGrind = spr_RushRailGrind;
	rush_RailGrindCrouch = spr_RushRailGrindCrouch;
	rush_RailJump = spr_RushRailJump;
	
	rush_TrickUpPre = spr_RushTrickUpPre;
	rush_TrickUp = spr_RushTrickUp;
	
	rush_TrickSidePre = spr_RushTrickSidePre;
	rush_TrickSide = spr_RushTrickSide;
	
	rush_Trick1 = spr_RushTrick1;
	rush_Trick2 = spr_RushTrick2;
	rush_Trick3 = spr_RushTrick3Fin;
	rush_TrickFinish = spr_RushTrick3Fin;
	
	rush_Death = spr_RushDeath;
	
	//Special
	rush_Pully = spr_RushPully;
}