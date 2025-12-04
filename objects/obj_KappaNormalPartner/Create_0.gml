if instance_exists(obj_RoomTransitionBasicStage) {
	x = obj_RoomTransitionBasicStage.target_x;
	y = obj_RoomTransitionBasicStage.target_y;
}

//Variables
scr_SpriteDataKappaNormal();


//Mask Collisions
idle_Mask = kappa_Idle_Mask;
crouch_Mask = kappa_Crouch_Mask;
slide_Mask = kappa_Slide_Mask;


//Animations
sprIdle = kappa_Idle;
sprSpecialIdle = 0;
sprPrepare = kappa_Prepare;
sprWalk = kappa_Walking;
sprRun = kappa_Running;
sprCrouch = kappa_Ducking;
sprLook_up = kappa_Look_Up;
sprGuard = kappa_Guarding;
sprJump = kappa_jumping;
sprFall = kappa_Falling;
sprFalling = kappa_Falling_Loop;
sprDJump = kappa_DJumping;
sprAirDash = kappa_AirDash;
sprSlide = kappa_Sliding;
sprStomping = kappa_Stomping;
sprStomp = kappa_Stomp;
sprWallSlide = kappa_WallSlide;
sprSkid = kappa_Skid;
sprOmegaFall = kappa_OmegaFall;
sprRailGrind = kappa_RailGrind;
sprRailJump = kappa_RailJump;
sprTrickUp = kappa_TrickUp;
sprTrickSide = kappa_TrickSide;


//Starting Frame for Animations
image_index = 0;
drawAngle = 0;


//Speed
acc = kappa_Acc;
dcc = kappa_Dcc;
fric = kappa_Fric;
max_Speed = kappa_Max_Speed;
vel = 0;


//Jump Speed & Gravity
grav = kappa_Grav;
jspd = kappa_Jspd;
railJspd = -20;
termVel = kappa_TermVel;
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

//--Air Dash--//
airDash = false;
airDashTimer = 0;
airDashFrames = 10;

//--Stomping--//
stomping = false;
stomped = false;
stompedTimer = kappa_StompedTimer;
stompedFrames = kappa_StompedFrames;

//Wall Jump
wallJump = false;
afterWallJump = false;

//Rail-Grinding
railGrind = false;

afterRailJump = false;
afterRailJumpTimer = 0;
afterRailJumpFrames = 25;

//--Tricking--//
beforeTrick = false;

trick = false;

rightTrick = false;
leftTrick = false;

sideTrickTimer = 0;
sideTrickFrames = 10;

upTrick = false;
upTrickTimer = 0;
upTrickFrames = 20;