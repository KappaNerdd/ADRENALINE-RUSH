//Keys
getControls();

//Controller Deadzone
gamepad_set_axis_deadzone(0, 0.25);

//Movement
if left_Key && !place_meeting(x + (abs(vel) * -1) -1, y, obj_Solid) && (can_Move == true or (rolling == true && vel > 0))
{
    vel -= acc * (1 + ground);
    if vel > 0 && ground == false
        vel -= acc;
        
    if rolling == false
        image_xscale = -1;
}

if right_Key && !place_meeting(x + abs(vel) + 1, y, obj_Solid) && (can_Move == true or (rolling == true && vel < 0))
{
    vel += acc * (1 + ground);
    if vel < 0 && ground == false
        vel += acc;
        
    if rolling == false
        image_xscale = 1;
}

//Deacceleration
if ground == true
{
    if vel > 0
        vel -= acc/(rolling + 1);
    else if vel < 0
        vel += acc/(rolling + 1);
}
	
//X Collision
var _subPixel = 0.5;
if place_meeting(x + vel, y, obj_Solid){
	//Scoot up to wall precisely
	var _pixelCheck = _subPixel * sign(vel);
	while !place_meeting(x + _pixelCheck, y, obj_Solid){
		x += _pixelCheck;
	}
	
	//Set velocity to zero to "collide"
	vel = 0;
}

//Speed limit
if vel > max_Speed
    vel = max_Speed;
else if vel < -max_Speed
     vel = -max_Speed;
     
if vel > -acc && vel < acc
    vel = 0;
    
x += vel;



//Sprite Handler
if ground == true && ducking == false && rolling == false && spindash == false && gliding == false && jumping == false && dJumping == false{
   if vel == 0{
       sprite_index = spr_KnucklesIdle;
	   image_speed = 1;
   }else if vel > -10 && vel < 10{
       sprite_index = spr_KnucklesWalk;
	   image_speed = abs(vel / 5);
   }else{
       sprite_index = spr_KnucklesRun;
	   image_speed = abs(vel / 8);
   }
}else if sprite_index == spr_KnucklesBallJump{
   image_speed = 0.2 + abs(vel / 10);
}

yspd += grav;

if ground = true{
	jumpCount = 0;
} else {
	if jumpCount == 0{
		jumpCount = 1;
	}
}

//Init Jumping
if ground == true && jumpKeyBuffered && ducking == false && gliding == false && jumping == false && (jumpCount < jumpMax)
{
	//Reset Buffer
	jumpKeyBuffered = false;
	jumpKeyBufferedTimer = 0;
	
	//Increase jump count
	jumpCount++;
		
	//Set the jump hold timer
	jumpHoldTimer = jumpHoldFrames;
	
	//Jump
    sprite_index = spr_KnucklesBallJump;
	jumping = true;
	ground = false;
	audio_play_sound(snd_Jump, 1, false);
}

//Cut off jump if key isn't held
if !jump_Key{
	jumpHoldTimer = 0;
}

if jumpHoldTimer > 0{
	//Jump based on holding button
	if jumpHoldTimer > 0{
		//Constantly set yspd to be jumping speed
		yspd = jspd;
		//Count down timer
		jumpHoldTimer--;
	}
}



//Y Collision
var _subPixel = .5
if place_meeting(x, y + yspd, obj_Solid){
	//Scoot up to wall precisely
	var _pixelCheck = _subPixel * sign(yspd);
	while !place_meeting(x, y + _pixelCheck, obj_Solid){
		y += _pixelCheck
	}
	
	//Bonk
	if yspd == 0{
		jumpHoldTimer = 0;
	}
	
	//Set gravity to collide
	yspd = 0;
	ground = true;
	jumping = false;
	dJumping = false;
}

if yspd >= 0 && place_meeting(x, y + 1, obj_Solid){
	ground = true;
}else{
	ground = false;
}

y += yspd;

if ground == false && dJumping == false && ducking == false && spindash == false && jumpKeyBuffered && jumpCount < jumpMax{
	//Reset Buffer
	jumpKeyBuffered = false;
	jumpKeyBufferedTimer = 0;
	
	//Increase jump count
	jumpCount++;
		
	//Set the jump hold timer
	jumpHoldTimer = jumpHoldFrames;
	
	//Jump
    sprite_index = spr_KnucklesBallJump;
	dJumping = true;
	ground = false;
	audio_play_sound(snd_Jump, 1, false);
}

//Looking up
if ground == true && vel == 0 && up_Key{
	sprite_index = spr_KnucklesLookUp;
	look_up = true;
} else {
	look_up = false;
}

//Ducking
if vel == 0 && ground == true && ducking == false && rolling = false && down_Key
{
    ducking = true;
    sprite_index = spr_KnucklesDucking;
}

//Rolling
else if vel != 0 && ground == true && ducking == false && rolling == false && down_Key
{
    rolling = true;
	
	//Rolling Sound
	audio_play_sound(snd_Roll, 1, false);
}

if ducking == true && (!down_Key or ground == false)
{
    ducking = false;
    can_Move = true;
}

if rolling == true && (ground == false or vel == 0)
{
    rolling = false;
    can_Move = true;
}

if ducking == true && spindash == false
{
    mask_index = spr_KnucklesDucking;
    sprite_index = spr_KnucklesDucking;
    if image_index < 1
        image_speed = 0.1;
    else
        image_speed = 0;
    can_Move = false;
}
else if rolling == true
{
    mask_index = spr_KnucklesBallJump;
    sprite_index = spr_KnucklesBallJump;
    can_Move = false;
}
else if spindash = true
{
    mask_index = spr_KnucklesBallJump;
	sprite_index = spr_KnucklesSpindash;
    image_speed = 0.75;
    can_Move = false;
	if spindash = true && one_Jump_Key{
		sprite_index = spr_KnucklesSpindashRev;
		audio_play_sound(snd_SpindashRev, 1, false);
	}
}
else
{
    mask_index = spr_KnucklesIdle;
}

//Ducking & Looking Up animation in the air fix
if ground == false && (sprite_index == spr_KnucklesDucking or sprite_index == spr_KnucklesLookUp){
    sprite_index = spr_KnucklesBallJump;
}
    
//Spindash
if ground == true && ducking == true && one_Jump_Key
{
    spindash = true;
	audio_play_sound(snd_SpindashRev, 1, false);
    
    if spindash_Timer < 40
        spindash_Timer += 5;
        
    spindash_Timer = spindash_Timer - ((spindash_Timer / 1) / 256);
    
}

if ground == true && spindash == true && !down_Key
{
    rolling = true;
    vel = image_xscale * (2 + spindash_Timer);
    spindash = false;
    spindash_Timer = 0;
	
	//Spindash Loose Sound
	audio_play_sound(snd_SpindashLoose, 1, false);
}

//Yellow Spring Function
if place_meeting(x, y, obj_SpringYellow){
	yspd = -14;
	sprite_index = spr_KnucklesSpringJump;
	image_speed = 1;
	ground = false;
	if dJumping == true{
		dJumping = false;
	}
	
	//Time until Knuckles uses his falling sprite
	alarm_set(0, 60);
}