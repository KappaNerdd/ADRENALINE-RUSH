//Keys
getControls();


//Movement
if left_Key && !place_meeting(x + (abs(vel) * -1) -1, y, obj_Solid) && (can_Move == true or (sliding == true && vel > 0))
{
    vel -= acc * (1 + ground);
    if vel > 0 && ground == false
        vel -= acc;
        
    if sliding == false
        image_xscale = -1;
}

if right_Key && !place_meeting(x + abs(vel) + 1, y, obj_Solid) && (can_Move == true or (sliding == true && vel < 0))
{
    vel += acc * (1 + ground);
    if vel < 0 && ground == false
        vel += acc;
        
    if sliding == false
        image_xscale = 1;
}

//Deacceleration
if ground == true
{
    if vel > 0
        vel -= acc/(sliding + 1);
    else if vel < 0
        vel += acc/(sliding + 1);
}


//Stop Horizontal Movement
if can_Move == false{
	vel = 0;
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
if ground == true && ducking == false && sliding == false && jumping == false && dJumping == false{
   if vel == 0{
       sprite_index = spr_KappaIdle;
	   image_speed = 1;
   }else if vel > -10 && vel < 10{
       sprite_index = spr_KappaWalk;
	   image_speed = abs(vel / 5);
   }else{
       sprite_index = spr_KappaRun;
	   image_speed = abs(vel / 7);
   }
}else if sprite_index == spr_KappaJump{
   image_speed = 1;
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
if ground == true && jumpKeyBuffered && ducking == false && jumping == false && (jumpCount < jumpMax)
{
	//Reset Buffer
	jumpKeyBuffered = false;
	jumpKeyBufferedTimer = 0;
	
	//Increase jump count
	jumpCount++;
		
	//Set the jump hold timer
	jumpHoldTimer = jumpHoldFrames;
	
	//Jump
    sprite_index = spr_KappaJump;
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

if ground == false && dJumping == false && ducking == false && jumpKeyBuffered && jumpCount < jumpMax{
	//Reset Buffer
	jumpKeyBuffered = false;
	jumpKeyBufferedTimer = 0;
	
	//Increase jump count
	jumpCount++;
		
	//Set the jump hold timer
	jumpHoldTimer = jumpHoldFrames;
	
	//Jump
    sprite_index = spr_KappaJump;
	dJumping = true;
	ground = false;
	audio_play_sound(snd_Jump, 1, false);
}

if jumpHoldTimer == 0 && ground == false{
	sprite_index = spr_KappaFall;
	image_speed = 1;
	if sprite_index == spr_KappaFall && image_index = 3 && ground == false{
		sprite_index = spr_KappaFalling;
	}
} else if sprite_index = spr_KappaFalling {
	sprite_index = spr_KappaFalling;
}

//Looking up
if ground == true && can_Move == true && vel == 0 && up_Key{
	sprite_index = spr_KappaLookUp;
	look_up = true;
} else {
	look_up = false;
}

//Ducking
if vel == 0 && ground == true && ducking == false && sliding = false && down_Key
{
    ducking = true;
    sprite_index = spr_KappaCrouch;
}

//Rolling
else if vel != 0 && ground == true && ducking == false && sliding == false && down_Key
{
    sliding = true;
	
	//Rolling Sound
	audio_play_sound(snd_Roll, 1, false);
}

if ducking == true && (!down_Key or ground == false)
{
    ducking = false;
    can_Move = true;
}

if sliding == true && (ground == false or vel == 0)
{
    sliding = false;
    can_Move = true;
}

if ducking == true
{
    mask_index = spr_KappaCrouch;
    sprite_index = spr_KappaCrouch;
    if image_index < 1
        image_speed = 0.1;
    else
        image_speed = 0;
    can_Move = false;
}
else if sliding == true
{
    slowdown = true;
}
else
{
    mask_index = spr_KappaIdle;
}

//Ducking & Looking Up animation in the air fix
if ground == false && (sprite_index == spr_KappaCrouch or sprite_index == spr_KappaLookUp){
    sprite_index = spr_KappaJump;
}