function scr_SpriteDataKappaNormal() {
	///-----Mask Collisions-----///

	//Idle + Look Up + Walk + Run + Jump + Double Jump + Fall + Guard + Stomp + Air Dash + Wall Jump
	kappa_Idle_Mask = spr_KappaIdleMask;

	//Crouch
	kappa_Crouch_Mask = spr_KappaCrouchMask;

	//Slide
	kappa_Slide_Mask = spr_KappaSlideMask;



	///-----Animations-----///

	//Idle
	kappa_Idle = spr_KappaIdle;
	kappa_Special_Idle = spr_KappaSpecialIdle;
	kappa_Prepare = spr_KappaPrepareSolo;


	//Movement
	kappa_Walking = spr_KappaWalk;
	kappa_Running = spr_KappaRun;
	kappa_FullSpeed = spr_KappaFullSpeedRun;
	kappa_Skid = spr_KappaSkid;


	//Jumping
	kappa_jumping = spr_KappaJump;
	kappa_DJumping = spr_KappaDoubleJump;


	//Falling
	kappa_Falling = spr_KappaFall;
	kappa_Falling_Loop = spr_KappaFalling;
	kappa_WallSlide = spr_KappaWallCling;
	kappa_OmegaFall = spr_KappaHurt;


	//Look Up & Crouching
	kappa_Ducking = spr_KappaCrouch;
	kappa_Look_Up = spr_KappaLookUp;


	//Actions
	kappa_Guarding = spr_KappaGuard;

	kappa_Sliding = spr_KappaSlide;

	kappa_AirDash = spr_KappaAirDash;

	kappa_Stomping = spr_KappaStomping;
	kappa_Stomp = spr_KappaStomp;

	kappa_RailGrind = spr_KappaRailGrind;
	kappa_RailGrindCrouch = spr_KappaRailGrindCrouch;
	kappa_RailJump = spr_KappaRailJump;
	
	
	//Tricking
	kappa_TrickUpPre = spr_KappaTrickUpPre;
	kappa_TrickUp = spr_KappaTrickUp;
	
	kappa_TrickSidePre = spr_KappaTrickRightPre;
	kappa_TrickSide = spr_KappaTrickRight;
	
	kappa_Trick1 = spr_KappaTrick1;
	kappa_Trick2 = spr_KappaTrick2;
	kappa_Trick3 = spr_KappaTrick3Fin;
	kappa_TrickFinish = spr_KappaTrick3Fin;
	
	kappa_Death = spr_KappaDeath;

	//Special
	kappa_Pully = spr_KappaPully;
}