function scr_SpriteDataKappaHead() {
	///-----Mask Collisions-----///

	//Idle + Look Up + Walk + Run + Jump + Double Jump + Fall + Guard + Stomp + Air Dash + Wall Jump
	kappa_Idle_Mask = spr_KappaIdleMask;

	//Crouch
	kappa_Crouch_Mask = spr_KappaCrouchMask;

	//Slide
	kappa_Slide_Mask = spr_KappaSlideMask;



	///-----Animations-----///

	//Idle
	kappa_Idle = spr_KappaIdleHead;
	kappa_Special_Idle = spr_KappaSpecialIdleHead;
	kappa_Prepare = spr_KappaPrepareHead;


	//Movement
	kappa_Walking = spr_KappaWalkHead;
	kappa_Running = spr_KappaRunHead;
	kappa_FullSpeed = spr_KappaFullSpeedRunHead;
	kappa_Skid = spr_KappaSkidHead;


	//Jumping
	kappa_jumping = spr_KappaJumpHead;
	kappa_DJumping = spr_KappaDJumpHead;


	//Falling
	kappa_Falling = spr_KappaFallHead;
	kappa_Falling_Loop = spr_KappaFallingHead;
	kappa_WallSlide = spr_KappaWallClingHead;
	kappa_OmegaFall = spr_KappaHurtHead;


	//Look Up & Crouching
	kappa_Ducking = spr_KappaCrouchHead;
	kappa_Look_Up = spr_KappaLookUpHead;


	//Actions
	kappa_Guarding = spr_KappaGuardHead;

	kappa_Sliding = spr_KappaSlideHead;

	kappa_AirDash = spr_KappaAirDashHead;

	kappa_Stomping = spr_KappaStompingHead;
	kappa_Stomp = spr_KappaStompHead;

	kappa_RailGrind = spr_KappaRailGrindHead;
	kappa_RailGrindCrouch = spr_KappaRailGrindCrouchHead;
	kappa_RailJump = spr_KappaRailJumpHead;
	
	
	//Tricking
	kappa_TrickUpPre = spr_KappaTrickUpPreHead;
	kappa_TrickUp = spr_KappaTrickUpHead;
	
	kappa_TrickSidePre = spr_KappaTrickRightPreHead;
	kappa_TrickSide = spr_KappaTrickRightHead;
	
	kappa_Trick1 = spr_KappaTrick1Head;
	kappa_Trick2 = spr_KappaTrick2Head;
	kappa_Trick3 = spr_KappaTrick3FinHead;
	kappa_TrickFinish = spr_KappaTrick3FinHead;
	
	kappa_Death = spr_KappaDeathHead;
	
	//Special
	kappa_Pully = spr_KappaPullyHideki;
}