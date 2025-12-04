if instance_exists(obj_RoomTransitionBasicStage) {
	x = obj_RoomTransitionBasicStage.target_x;
	y = obj_RoomTransitionBasicStage.target_y;
} else

if instance_exists(obj_RoomTransitionBasicStage) {
	x = obj_RoomTransitionBasic.target_x;
	y = obj_RoomTransitionBasic.target_y;
}

leftFacer = true;
sonicRush = false;
blazeRush = true;

createTimer = 15;

//Variables
scr_CharDataSarah();

//Angles
scr_AngleShitCreate();

//Sprites
scr_SpriteDataSarahNormal();


//Mask Collisions
idle_Mask = sarah_Idle_Mask;
crouch_Mask = sarah_Crouch_Mask;
slide_Mask = sarah_Slide_Mask;


//Animations
sprIdleRight = sarah_IdleRight;
sprIdleLeft = sarah_IdleLeft;

sprSpecialIdle = sarah_Special_Idle;
sprPrepare = sarah_Prepare;
sprGoal = sarah_Goal;

sprWalkRight = sarah_WalkingRight;
sprWalkLeft = sarah_WalkingLeft;
sprRunRight = sarah_RunningRight;
sprRunLeft = sarah_RunningLeft;
sprFullSpeedRunRight = sarah_FullSpeedRight;
sprFullSpeedRunLeft = sarah_FullSpeedLeft;

sprCrouchRight = sarah_DuckingRight;
sprCrouchLeft = sarah_DuckingLeft;
sprLook_upRight = sarah_Look_UpRight;
sprLook_upLeft = sarah_Look_UpLeft;

sprJumpRight = sarah_jumpingRight;
sprJumpLeft = sarah_jumpingLeft;
sprFallRight = sarah_FallingRight;
sprFallLeft = sarah_FallingLeft;
sprFallingRight = sarah_Falling_LoopRight;
sprFallingLeft = sarah_Falling_LoopLeft
sprDJump = sarah_DJumping;

sprSlideRight = sarah_SlidingRight;
sprSlideLeft = sarah_SlidingLeft;

sprStomping = sarah_Stomping;
sprOmegaStomping = sarah_OmegaStomping
sprStomp = sarah_Stomp;


sprWallSlideRight = sarah_WallSlideRight;
sprWallSlideLeft = sarah_WallSlideLeft;
sprWallJumpRight = sarah_WallJumpRight;
sprWallJumpLeft = sarah_WallJumpLeft;

sprSkidRight = sarah_SkidRight;
sprSkidLeft = sarah_SkidLeft;

sprOmegaFallRight = sarah_OmegaFallRight;
sprOmegaFallLeft = sarah_OmegaFallLeft;

sprRailGrindRight = sarah_RailGrindRight;
sprRailGrindLeft = sarah_RailGrindLeft;

sprRailJump = sarah_RailJump;

sprTrickUpPre = sarah_TrickUpPre;
sprTrickUp = sarah_TrickUp;

sprTrickRightPre = sarah_TrickRightPre;
sprTrickRight = sarah_TrickRight;

sprTrickLeftPre = sarah_TrickLeftPre;
sprTrickLeft = sarah_TrickLeft;

sprTrick1 = sarah_Trick1;
sprTrick2 = sarah_Trick2;
sprTrick3 = sarah_Trick3;
sprTrick3Fin = sarah_TrickFinish;


//Starting Frame for Animations
image_index = 0;
mask_index = idle_Mask;
drawAngle = 0;
face_Left = false;


//Speed
acc = sarah_Acc;
dcc = sarah_Dcc;
fric = sarah_Fric;

max_Speed = sarah_Max_Speed;
full_Speed = sarah_Full_Speed;


vel = 0;
slowSkid = false;


//Jump Speed & Gravity
grav = sarah_Grav;
normalGrav = sarah_Grav;
jspd = sarah_Jspd;
normalJspd = sarah_Jspd;
railJspd = -20;
termVel = sarah_TermVel;
normalTermVel = sarah_TermVel;
omegaTermVel = sarah_Full_TermVel;
yspd = 0;


//Prepare
prepare = false;


//Special Idle
specialIdle = false;
specialIdleTimer = 300;
specialIdleFrames = 300;


//Jumping Checks
jumping = false;
dJumping = false;
noDJumping = false;

//---Jump Key Buffering---//
scr_jumpKeyBuffering();


//Checks
ground = true;
can_Move = true;
can_MoveFULL = true;
slow_Down = false;
falling = false;
skid = false;


//Look Up & Crouching
ducking = false;
look_up = false;


//Actions
guarding = false;
sliding = false;

//--Hovering--//
hover = false;

//--Stomping--//
stomping = false;
stomped = false;
stompingTimer = 30;
normalStomp = false;
omegaStomp = false;
omegaStompingTimer = 0;
stompedTimer = sarah_StompedTimer;
stompedFrames = sarah_StompedFrames;

//Wall Jump
scr_WallClingCreate();
sideWallJump = false;

//Rail-Grinding
railGrind = false;

afterRailJump = false;
afterRailJumpTimer = 0;
afterRailJumpFrames = 20;



//Wall Running
onSlope = false;
wallRunning = false;

//Speed-Break
scr_SpeedBreakCreate();

//Boost
scr_BoostCreate();

//Tricks
scr_AirTricksCreate();

//Rush Mode Color
scr_RushModeColorCreate();