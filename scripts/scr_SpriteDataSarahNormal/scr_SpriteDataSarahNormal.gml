function scr_SpriteDataSarahNormal() {
	
	///-----Mask Collisions-----///

	//Idle + Look Up + Walk + Run + Jump + Double Jump + Fall + Guard + Stomp + Air Dash + Wall Jump
	sarah_Idle_Mask = spr_SarahIdleMask;

	//Crouch
	sarah_Crouch_Mask = spr_SarahCrouchMask;

	//Slide
	sarah_Slide_Mask = spr_SarahSlideMask;



	///-----Animations-----///

	//Idle Right
	sarah_IdleRight = spr_SarahIdleRight;
	sarah_Special_Idle = spr_SarahSpecialIdle;
	sarah_Prepare = spr_SarahPrepare;
	sarah_Goal = spr_SarahGoal;
	
	//Idle Left
	sarah_IdleLeft = spr_SarahIdleLeft;
	


	//Movement Right
	sarah_WalkingRight = spr_SarahWalkRight;
	sarah_RunningRight = spr_SarahRunRight;
	sarah_FullSpeedRight = spr_SarahFullSpeedRight;
	sarah_SkidRight = spr_SarahSkidRight;
	
	//Movement Left
	sarah_WalkingLeft = spr_SarahWalkLeft;
	sarah_RunningLeft = spr_SarahRunLeft;
	sarah_FullSpeedLeft = spr_SarahFullSpeedLeft;
	sarah_SkidLeft = spr_SarahSkidLeft;
	


	//Jumping Right
	sarah_jumpingRight = spr_SarahJumpRight;
	sarah_DJumping = spr_SarahDoubleJump;
	
	//Jumping Left
	sarah_jumpingLeft = spr_SarahJumpLeft;
	
	//Hover
	sarah_Hover = spr_SarahDoubleJump;



	//Falling Right
	sarah_FallingRight = spr_SarahFallRight;
	sarah_Falling_LoopRight = spr_SarahFallingRight;
	sarah_WallSlideRight = spr_SarahWallClingRight;
	sarah_OmegaFallRight = spr_SarahHurtRight;
	
	//Falling Left
	sarah_FallingLeft = spr_SarahFallLeft;
	sarah_Falling_LoopLeft = spr_SarahFallingLeft;
	sarah_WallSlideLeft = spr_SarahWallClingLeft;
	sarah_OmegaFallLeft = spr_SarahHurtLeft;



	//Look Up & Crouching Right
	sarah_DuckingRight = spr_SarahCrouchRight;
	sarah_Look_UpRight = spr_SarahLookUpRight;
	
	//Look Up & Crouching Left
	sarah_DuckingLeft = spr_SarahCrouchLeft;
	sarah_Look_UpLeft = spr_SarahLookUpLeft;



	//Actions Right
	sarah_SlidingRight = spr_SarahSlideRight;
	sarah_RailGrindRight = spr_SarahRailGrindRight;
	sarah_RailGrindCrouchRight = spr_SarahRailGrindCrouchRight;
	sarah_WallJumpRight = spr_SarahWallJumpRight;
	
	//Actions Left
	sarah_SlidingLeft = spr_SarahSlideLeft;
	sarah_RailGrindLeft = spr_SarahRailGrindLeft;
	sarah_RailGrindCrouchLeft = spr_SarahRailGrindCrouchLeft;
	sarah_WallJumpLeft = spr_SarahWallJumpLeft;
	
	
	
	//Other Actions
	sarah_Stomping = spr_SarahStomping;
	sarah_OmegaStomping = spr_SarahOmegaStomping;
	sarah_Stomp = spr_SarahStomped;

	
	//Tricks
	sarah_RailJump = spr_SarahDoubleJump;
	
	sarah_TrickUpPreRight = spr_SarahTrickUpPreRight;
	sarah_TrickUpRight = spr_SarahTrickUpRight;
	
	sarah_TrickUpPreLeft = spr_SarahTrickUpPreLeft;
	sarah_TrickUpLeft = spr_SarahTrickUpLeft;
	
	sarah_TrickRightPre = spr_SarahTrickRightPre;
	sarah_TrickRight = spr_SarahTrickRight;
	
	sarah_TrickLeftPre = spr_SarahTrickLeftPre;
	sarah_TrickLeft = spr_SarahTrickLeft;
	
	sarah_Trick1Right = spr_SarahTrick1Right;
	sarah_Trick2Right = spr_SarahTrick2Right;
	sarah_Trick3Right = spr_SarahTrick3FinRight;
	sarah_TrickFinishRight = spr_SarahTrick3FinRight;
	
	sarah_Trick1Left = spr_SarahTrick1Left;
	sarah_Trick2Left = spr_SarahTrick2Left;
	sarah_Trick3Left = spr_SarahTrick3FinLeft;
	sarah_TrickFinishLeft = spr_SarahTrick3FinLeft;
	
	//Death
	sarah_Death = spr_SarahDeath;
	
	//Special
	sarah_PullyRight = spr_SarahPullyRight;
	sarah_PullyLeft = spr_SarahPullyLeft;
}