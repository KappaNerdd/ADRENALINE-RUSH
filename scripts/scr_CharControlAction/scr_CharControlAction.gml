function scr_CreateActionVariables() {
	//Input
	scr_InputBuffer();
	
	//Player Check
	player = true;
	artXScale = 1;
	drawAngle = 0;
	
	//Mask
	mask_index = idle_Mask;
	
	//States
	state = "freeState";
	
	//Special Idle
	specialIdleTimer = 210;
	specialIdleFrames = 210;
	
	//Prepare
	prepare = false;
	
	//Move Check
	can_Move = true;
	
	//Jumping
	ground = true;
	jumping = false;
	
	//Crouching
	crouch = false;
	
	//Attack Check
	attacking = false;
	upSmash = false;
	sideSmash = false;
	spikeSmash = false;
	
	//Movement Variables
	moveDir = 1;
	vel = 0;
	yspd = 0;
	
	//Dashing
	dashTimer = 20;
	dashFrames = 20;
	
	//Invincibility
	invinceFrames = 0;

	//Stun
	hitStun = 0;
	hitLag = 0;
	
	//Energy Fatigue
	ENFatigueTimer = 0;
	ENFatigueFrames = 300
	
	//Parry
	perfectParryTimer = 0;
	perfectParryFrames = 10;
	imperfectParryTimer = 0;
	imperfectParryFrames = 20;
	
	//Charge
	chargeTimer = 0;
	chargeFrames = 8;
	createChargeSound = false;
	
	//Bounceable
	wallBounce = false;
	floorBounce = false;
	
	//Combo
	combo = 0;
	
	//Hit Limits
	light2Count = 0
	light2Set = 1;
	
	light5Count = 0;
	light5Set = 1;
	
	
	medium2Count = 0;
	medium2Set = 1;
	
	medium5Count = 0;
	medium5Set = 1;
}

function scr_ActionHitStun() {
	if hitStun > 0 {
		hitStun--;
	}
}

function scr_ActionStageStep1() {
	#region //Special Idle
		if ground && vel == 0 && state == "freeState" {
			if specialIdleTimer > 0 {
				specialIdleTimer--;
			}
		} else {
			specialIdleTimer = specialIdleFrames;
		}
	#endregion
	
	#region //X Collision
		var _subPixel = 0.5;
		
		if place_meeting(x + vel, y, obj_Solid) {
			//Scoot up to wall precisely
			var _pixelCheck = _subPixel * sign(vel);
	
			while !place_meeting(x + _pixelCheck, y, obj_Solid) {
				x += _pixelCheck;
			}
	
			vel = 0;
		}

		//Change X
		x += vel;
	#endregion

	#region //Y Collision
		yspd += grav;
	
		if place_meeting(x, y + yspd, obj_Solid) {
			//Scoot up to wall precisely
			var _pixelCheck = _subPixel * sign(yspd);
	
			while !place_meeting(x, y + _pixelCheck, obj_Solid) {
				y += _pixelCheck;
			}
	
			//Bonk
			if yspd == 0 {
				yspd = 0;
			}
	
			//Set gravity to collide
			yspd = 0;
			ground = true;
			jumpCount = ogJumpCount;
			dashCount = ogDashCount;
		}

		//Set Ground variable
		if yspd >= 0 && place_meeting(x, y + 1, obj_Solid) {
			ground = true;
		} else {
			ground = false;
		}
		
		y += yspd;
	#endregion
	
	#region //Wall Bounce
		if wallBounce {
			if place_meeting(x + 1, y, obj_Solid) or place_meeting(x - 1, y, obj_Solid) {
				wallBounce = false;
				floorBounce = false;
				obj_SFXManager.wallBounce = true;
				sprite_index = sprHurtWall;
				yspd = -5;
				hitStun += 30;
				hitLag = 10;
				scr_ScreenShake(2);
				scr_ControllerRumble(0.5);
				
				if place_meeting(x + 1, y, obj_Solid) {
					vel = -3;
				} else if place_meeting(x - 1, y, obj_Solid) {
					vel = 3;
				}
			}
		}
	#endregion
	
	#region //Floor Bounce
		if floorBounce {
			if place_meeting(x, y + 1, obj_Solid) {
				floorBounce = false;
				wallBounce = false;
				obj_SFXManager.wallBounce = true;
				sprite_index = sprHurtFloor;
				yspd = -7;
				hitStun += 30;
				hitLag = 10;
				scr_ScreenShake(2);
				scr_ControllerRumble(0.5);
			}
		}
	#endregion
	
	#region //Reset Bounces
		if hitStun <= 0 {
			wallBounce = false;
			floorBounce = false;
		}
	#endregion
}
	
function scr_ActionStageStep2() {
	
}


function scr_ActionPlayerHitbox(_hitBox = obj_ActionHitbox, _state = "hurtState", _damage = 1000, _energy = 10, _stun = 10, _lag = 5, _bounce = false, _vel = 1, _yspd = 1, _x = 0, _y = 0, _xScale = 1, _yScale = 1, _shake = 0.25, _rumble = 0.1, _type = "Light") {
	if !instance_exists(_hitBox) {
		with (instance_create_depth(x, y, depth, _hitBox)) {
			hitBoxCreator = other.id;
			setState = _state;
			setDamage = _damage;
			setEnergy = _energy;
			setStun = _stun;
			setLag = _lag;
			setBounce = _bounce;
			setVel = _vel;
			setYspd = _yspd;
			
			newX = _x;
			newY = _y;
			x = hitBoxCreator.x + _x;
			y = hitBoxCreator.y + _y;
			image_xscale = _xScale;
			image_yscale = _yScale;
			
			shakeScreen = _shake;
			controlRumble = _rumble;
			setType = _type;
		}
	}
}