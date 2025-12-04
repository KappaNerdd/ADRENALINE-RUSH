#region //Sprites
	if global.PlayerCostume == 0 {
		scr_SpriteDataSarahNormal();
	}
#endregion

#region //Character Data
	#region //Mask Collisions
		idle_Mask = sarah_Idle_Mask;
		crouch_Mask = sarah_Crouch_Mask;
		slide_Mask = sarah_Slide_Mask;
	#endregion

	#region //Idles
		sprIdleRight = sarah_IdleRight;
		sprIdleLeft = sarah_IdleLeft;
	
		sprCrouchRight = sarah_DuckingRight;
		sprCrouchLeft = sarah_DuckingLeft;
		sprLook_upRight = sarah_Look_UpRight;
		sprLook_upLeft = sarah_Look_UpLeft;

		sprSpecialIdle = sarah_Special_Idle;
		sprPrepare = sarah_Prepare;
		sprGoal = sarah_Goal;
	#endregion

	#region //Runnings
		sprWalkRight = sarah_WalkingRight;
		sprWalkLeft = sarah_WalkingLeft;
		sprRunRight = sarah_RunningRight;
		sprRunLeft = sarah_RunningLeft;
		sprFullSpeedRunRight = sarah_FullSpeedRight;
		sprFullSpeedRunLeft = sarah_FullSpeedLeft;
	#endregion
	
	#region //Jumpings
		sprJumpRight = sarah_jumpingRight;
		sprJumpLeft = sarah_jumpingLeft;
		sprFallRight = sarah_FallingRight;
		sprFallLeft = sarah_FallingLeft;
		sprFallingRight = sarah_Falling_LoopRight;
		sprFallingLeft = sarah_Falling_LoopLeft
		sprDJump = sarah_DJumping;
	#endregion
	
	#region //Sliding
		sprSlideRight = sarah_SlidingRight;
		sprSlideLeft = sarah_SlidingLeft;
	#endregion

	#region //Extras
		sprStomping = sarah_Stomping;
		sprOmegaStomping = sarah_OmegaStomping
		sprStomp = sarah_Stomp;

		sprWallSlideRight = sarah_WallSlideRight;
		sprWallSlideLeft = sarah_WallSlideLeft;
		sprWallJumpRight = sarah_WallJumpRight;
		sprWallJumpLeft = sarah_WallJumpLeft;

		sprSkidRight = sarah_SkidRight;
		sprSkidLeft = sarah_SkidLeft;
	#endregion

	#region //Rail-Grind
		sprRailGrindRight = sarah_RailGrindRight;
		sprRailGrindCrouchRight = sarah_RailGrindCrouchRight;

		sprRailGrindLeft = sarah_RailGrindLeft;
		sprRailGrindCrouchLeft = sarah_RailGrindCrouchLeft;

		sprRailJump = sarah_RailJump;
	#endregion

	#region //Tricking
		sprTrickUpPreRight = sarah_TrickUpPreRight;
		sprTrickUpRight = sarah_TrickUpRight;

		sprTrickUpPreLeft = sarah_TrickUpPreLeft;
		sprTrickUpLeft = sarah_TrickUpLeft;

		sprTrickRightPre = sarah_TrickRightPre;
		sprTrickRight = sarah_TrickRight;

		sprTrickLeftPre = sarah_TrickLeftPre;
		sprTrickLeft = sarah_TrickLeft;

		sprTrick1Right = sarah_Trick1Right;
		sprTrick2Right = sarah_Trick2Right;
		sprTrick3Right = sarah_Trick3Right;
		sprTrick3FinRight = sarah_TrickFinishRight;

		sprTrick1Left = sarah_Trick1Left;
		sprTrick2Left = sarah_Trick2Left;
		sprTrick3Left = sarah_Trick3Left;
		sprTrick3FinLeft = sarah_TrickFinishLeft;
	#endregion

	#region //Death
		sprOmegaFallRight = sarah_OmegaFallRight;
		sprOmegaFallLeft = sarah_OmegaFallLeft;
		sprDeath = sarah_Death;
	#endregion
	
	#region //Special
		sprPullyRight = sarah_PullyRight;
		sprPullyLeft = sarah_PullyLeft;
	#endregion
#endregion

#region //Character Data Variables
	scr_CharDataSarah();
#endregion

#region //Basic Variables
	scr_BasicVariablesSpeedCreate();
#endregion

#region //Girly/Left-Facing/Sonic & Blaze Rush
	//Choose if your character has unique left-facing sprites or not
	leftFacer = true;
	
	//Choose if your character should play Sonic's boost sound or Blaze's boost sound.
	sonicRush = false;
	blazeRush = true;
#endregion

#region //Rail Jspd
	railJspd = -20;
	sideWallJump = false;
#endregion

#region //Hovering
	hover = false;
#endregion

#region //Stomping
	stomping = false;
	stomped = false;
	stompingTimer = 30;
	stompingFrames = 30;
	stompedSound = false;
	
	normalStomp = false;
	omegaStomp = false;
	omegaStompingTimer = 0;
	omegaTermVel = full_TermVel;
#endregion