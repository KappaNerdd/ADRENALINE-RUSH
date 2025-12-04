function scr_SpriteDataIvyNormal() {
	///-----Mask Collisions-----///

	//Idle + Look Up + Walk + Run + Jump + Double Jump + Fall + Guard + Stomp + Air Dash + Wall Jump
	ivy_Idle_Mask = spr_IvyIdleMask;

	//Crouch
	ivy_Crouch_Mask = spr_IvyCrouchMask;

	//Slide
	ivy_Slide_Mask = spr_IvySlideMask;



	///-----Animations-----///

	//Idle
	ivy_Idle = spr_IvyIdle;
	ivy_Special_Idle = spr_IvySpecialIdle;
	ivy_Prepare = spr_IvyPrepareSolo;


	//Movement
	ivy_Walking = spr_IvyWalk;
	ivy_Running = spr_IvyRun;
	ivy_FullSpeed = spr_IvyFullSpeedRun;
	ivy_Skid = spr_IvySkid;


	//Jumping
	ivy_jumping = spr_IvyJump;
	ivy_DJumping = spr_IvyJump;


	//Falling
	ivy_Falling = spr_IvyFall;
	ivy_Falling_Loop = spr_IvyFalling;
	ivy_OmegaFall = spr_IvyHurt;


	//Look Up & Crouching
	ivy_Ducking = spr_IvyCrouch;
	ivy_Look_Up = spr_IvyLookUp;


	//Actions
	ivy_Sliding = spr_IvySlide;

	ivy_PreStomp = spr_IvyPreStomp;
	ivy_Stomping = spr_IvyStomping;
	ivy_HShooting = spr_IvyHoriShoot;
	ivy_Stomp = spr_IvyStomped;

	ivy_RailGrind = spr_IvyRailGrind;
	ivy_RailGrindCrouch = spr_IvyRailGrindCrouch;
	ivy_RailJump = spr_IvyRailJump;
	
	ivy_ShootGround = spr_IvyShootGround;
	ivy_ShootAir = spr_IvyShootAir;
	
	
	//Tricking
	ivy_TrickUpPre = spr_IvyTrickUpPre;
	ivy_TrickUp = spr_IvyTrickUp;
	
	ivy_TrickSidePre = spr_IvyTrickRightPre;
	ivy_TrickSide = spr_IvyTrickRight;
	
	ivy_Trick1 = spr_IvyTrick1;
	ivy_Trick2 = spr_IvyTrick2;
	ivy_Trick3 = spr_IvyTrick3Fin;
	ivy_TrickFinish = spr_IvyTrick3Fin;
	
	ivy_Death = spr_IvyDeath;
	
	//Special
	ivy_Pully = spr_IvyPully;
}