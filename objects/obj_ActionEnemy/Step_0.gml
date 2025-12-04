//Inputs
if player {
	scr_ControlsAction();
} else {
	
}


var _hitBox = obj_EnemyHitbox;


//Mask
mask_index = spr_SonicIdle;


//Activate as Enemy
if !player {
	enemy = true;
} else {
	enemy = false;
}


//Make sure health and energy don't exceed max or lowest
if HP > maxHP {
	HP = maxHP;
}

if HP < 0 {
	HP = 0;
}


if EN > maxEN {
	EN = maxEN;
}

if EN < 0 {
	EN = 0;
}


//HitStun
if hitStun > 0 {
	hitStun -= 1;
}

if hitStun <= 0 {
	hitStun = 0;
}

//HitLag
var _time = current_time;  
while current_time - _time < hitLag {  
	
}  

if hitLag > 0 {
	hitLag -= hitLag;
}

//Invincibility Frames
if invinceFrames > 0 {
	invinceFrames -= 1;
}

if invinceFrames <= 0 {
	invinceFrames = 0;
}

//Parry Delay
if parryDelay > 0 {
	parryDelay -= 1;
}
		
if parryDelay <= 0 && state == "parryState" {
	state = "freeState";
}


//Dash
if dashKeyBuffered && !ground && dashCount > 0 && hitStun == 0 {
	invinceFrames = 10;
	dashCount -= 1;
	state = "dashState";
	obj_SFXManager.airDashSound = true;
}


//Movement
if left_Key && !attacking && hitStun == 0 && parryDelay == 0 && state != "dashState" && state != "chargeState" {
	vel = -moveSpd;
} 

if right_Key && !attacking && hitStun == 0 && parryDelay == 0 && state != "dashState" && state != "chargeState" {
	vel = moveSpd;
}


if (!right_Key && !left_Key) && !forceMove && hitStun == 0 && state != "dashState" && state != "chargeState" {
	vel = 0;
}


//Cancel & Reset some shit if you parry in the air
if parryKeyBuffered && !ground && hitStun == 0 && EN > 999 {
	parryKeyBufferTimer = 0;
	EN -= 1000;
	
	if instance_exists(_hitBox) {
		if !_hitBox.active {
			state = "jumpState";
			vel = 0;
			yspd = 0;
			hitLag = 60;
			jumpCount = ogJumpCount;
			dashCount = ogDashCount;
			
			obj_SFXManager.block = true;
		} else {
			state = "hurtState";
			hitStun = 40;
			vel = 0;
			yspd = 0;
			obj_SFXManager.jab = true;
		}
	} else {
		state = "hurtState";
		hitStun = 40;
		vel = 0;
		yspd = 0;
		obj_SFXManager.jab = true;
	}
}


//X Collision
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


//Change yspd with grav
yspd += grav;

//Y Collision
var _subPixel = 0.5;
		
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
}


//Change Y
y += yspd;


//Jump
if jump_Key && jumpCount > 0 && hitStun == 0 && parryDelay == 0 && state != "chargeState" {
	yspd = jspd;
	jumpCount -= 1;
	state = "jumpState";
	attacking = false;
	forceMove = false;
	obj_SFXManager.jumpSound = true;
}


//Set Ground variable
if yspd >= 0 && place_meeting(x, y + 1, obj_Solid) {
	ground = true;
} else {
	ground = false;
}
	



//Set to "freeState" if this shit is not happenin'
if ground && !attacking && hitStun == 0 && parryDelay == 0 && state != "chargeState" {
	state = "freeState";
}





//State Switch
switch(state) {
	
	//Idle
	case "freeState":
		image_speed = 1;
		attacking = false;
		forceMove = false;
		bounceable = false;
		dashCount = ogDashCount;
		
		instance_destroy(_hitBox);
		
		if ground && vel != 0 {
			sprite_index = spr_SonicWalk;
		} else if ground && vel == 0 {
			sprite_index = spr_SonicIdle;
		}
		
		if right_Key && ground {
			image_xscale = 1;
		} else if left_Key && ground {
			image_xscale = -1;
		}
		
		//Start Punch
		if punch_Key && ground {
			image_index = 0;
			vel = 0;
			state = "punchState1";
			attacking = true;
			forceMove = false;
		}
		
		//Start Heavy
		if heavyKeyBuffered && ground {
			
			image_index = 0;
			vel = 0;
			
			if !down_Key {
				state = "5HState";
				attacking = true;
				forceMove = true;
			} else {
				state = "2HState";
				attacking = true;
				forceMove = false;
			}
		}
		
		//Start Parry
		if parry_Key && EN > 999 {
			image_index = 0;
			vel = 0;
			EN -= 1000;
			
			parryWindow = parryFrames;
			parryDelay = parryDelayFrames;
			state = "parryState";
			obj_SFXManager.block = true;
		}
		
		//Charge Energy
		if charge_Key && EN < maxEN {
			image_index = 0;
			vel = 0;
			state = "chargeState";
			obj_SFXManager.block = true;
		}
	break;
	
	//Jump
	case "jumpState":
		attacking = false;
		forceMove = false;
		bounceable = false;
	
		if yspd < 0 {
			sprite_index = spr_SonicJump;
		} else if yspd > 0 && yspd < grav * 14 {
			sprite_index = spr_SonicFall;
		} else if yspd > grav {
			sprite_index = spr_SonicFalling;
		}
		
		instance_destroy(_hitBox);
		
		image_speed = 1;
		
		//Air Jab Start
		if punchKeyBuffered && !ground {
			state = "J5LState";
		}
		
		
		//Air Heavy Start
		if heavyKeyBuffered && !ground {
			image_index = 0;
			
			if down_Key {
				state = "J2HState";
			} else if left_Key && image_xscale == 1 {
				state = "J4HState";
			} else if right_Key && image_xscale == -1 {
				state = "J4HState";
			} else {
				state = "J5HState";
			}
		}
	break;
	
	
	///-----Attacks-----///
	
	//Jabs
	case "punchState1":
		sprite_index = spr_SonicJab1;
		image_speed = 1;
		attacking = true;
		
		if image_index >= 2 && image_index < 4 {
			if !instance_exists(_hitBox) {
				with(instance_create_depth(x, y, depth, _hitBox)) {
					setState = "hurtState";
					setHitStun = 20;
					setHitLag = 100;
					
					image_xscale = 0.35;
					image_yscale = 0.2;
					
					if other.image_xscale == 1 {
						x = other.x + 6;
					} else {
						x = other.x - 25;
					}
						
					y = other.y - 22;
				}
			}
		}
		
		if image_index >= 4 {
			instance_destroy(_hitBox);
		}
		
		if punchKeyBuffered && image_index >= 4 {
			image_index = 0;
			state = "punchState2";
		}
	break;
	
	case "punchState2":
		sprite_index = spr_SonicJab2;
		image_speed = 1;
		attacking = true;
		
		if image_index >= 2 && image_index < 4 {
			if !instance_exists(_hitBox) {
				with(instance_create_depth(x, y, depth, _hitBox)) {
					setState = "hurtState";
					setHitStun = 30;
					setYspd = -3;
					setHitLag = 200;
					
					image_xscale = 0.3;
					image_yscale = 0.4;
					
					if other.image_xscale == 1 {
						x = other.x + 6;
					} else {
						x = other.x - 25;
					}
						
					y = other.y - 25;
				}
			}
		}
		
		if image_index >= 4 {
			instance_destroy(_hitBox);
		}
		
		
		if punchKeyBuffered && image_index >= 4 {
			image_index = 0;
			state = "punchState3";
		}
	break;
	
	case "punchState3":
		sprite_index = spr_SonicJab3;
		image_speed = 1;
		attacking = true;
		
		if image_index >= 2 && image_index < 5 {
			if !instance_exists(_hitBox) {
				with(instance_create_depth(x, y, depth, _hitBox)) {
					setState = "bigHurtState";
					setHitStun = 37;
					setYspd = -6.25;
					setHitLag = 200;
					
					image_xscale = 0.3;
					image_yscale = 0.41;
					
					if other.image_xscale == 1 {
						x = other.x + 6;
					} else {
						x = other.x - 25;
					}
						
					y = other.y - 28;
				}
			}
		}
		
		if image_index >= 5 {
			instance_destroy(_hitBox);
		}
	break;
	
	
	//Heavies
	case "5HState":
		sprite_index = spr_SonicHeavy;
		image_speed = 1.5;
		attacking = true;
		
		if image_index >= 4 && image_index < 10 {
			if !instance_exists(_hitBox) {
				with(instance_create_depth(x, y, depth, _hitBox)) {
					setState = "omegaHurtState";
					setHitStun = 120;
					setYspd = -8;
					setVel = 10;
					setHitLag = 200;
					bounceable = true;
					
					image_xscale = 0.625;
					image_yscale = 0.42;
					
					x = other.x - 25;
						
					y = other.y - 28;
				}
			}
		}
		
		if image_index >= 10 {
			instance_destroy(_hitBox);
		}
		
		
		if image_index >= 12 {
			if image_xscale == 1 {
				vel = -1;
			} else {
				vel = 1;
			}
		}
	break;
	
	case "2HState":
		sprite_index = spr_SonicDJumpHeavy;
		image_speed = 1;
		attacking = true;
		
		if image_index >= 2 && image_index < 6 {
			if !instance_exists(_hitBox) {
				with(instance_create_depth(x, y, depth, _hitBox)) {
					setState = "omegaHurtState";
					setHitStun = 60;
					setYspd = -8;
					setHitLag = 300;
					
					image_xscale = 0.6;
					image_yscale = 0.42;
					
					x = other.x - 20;
						
					y = other.y - 40;
				}
			}
		}
		
		if image_index >= 6 {
			instance_destroy(_hitBox);
		}
	break;
	
	
	//Air Jabs
	case "J5LState":
		sprite_index = spr_SonicJab2;
		image_speed = 1;
		attacking = true;
		
		if image_index >= 2 && image_index < 4 {
			yspd = -1;
			if !instance_exists(_hitBox) {
				with(instance_create_depth(x, y, depth, _hitBox)) {
					setState = "hurtState";
					setHitStun = 30;
					setYspd = -3;
					setHitLag = 200;
					
					image_xscale = 0.3;
					image_yscale = 0.4;
					
					if other.image_xscale == 1 {
						x = other.x + 6;
					} else {
						x = other.x - 25;
					}
						
					y = other.y - 25;
				}
			}
		}
		
		if image_index >= 4 {
			instance_destroy(_hitBox);
		}
		
		
		if image_index >= 4 {
			if punchKeyBuffered {
				image_index = 0;
				state = "J5LLState";
			}
			
			if heavyKeyBuffered {
				if down_Key {
					image_index = 0;
					state = "J2HState";
				} else {
					image_index = 0;
					state = "J5HState";
				}
			}
		}
	break;
	
	case "J5LLState":
		sprite_index = spr_SonicJab3;
		image_speed = 0.9;
		attacking = true;
		
		if image_index >= 2 && image_index < 4.5 {
			yspd = -2;
			if !instance_exists(_hitBox) {
				with(instance_create_depth(x, y, depth, _hitBox)) {
					setState = "bigHurtState";
					setHitStun = 30;
					setYspd = -5;
					setHitLag = 200;
					
					image_xscale = 0.3;
					image_yscale = 0.41;
					
					if other.image_xscale == 1 {
						x = other.x + 6;
					} else {
						x = other.x - 25;
					}
						
					y = other.y - 28;
				}
			}
		}
		
		if image_index >= 4.5 {
			if heavyKeyBuffered {
				if down_Key {
					image_index = 0;
					state = "J2HState";
				} else {
					image_index = 0;
					state = "J5HState";
				}
			}
			
			instance_destroy(_hitBox);
		}
	break;
	
	
	//Air Heavies
	case "J5HState":
		sprite_index = spr_SonicJumpHeavy;
		image_speed = 1;
		attacking = true;
		
		if image_index >= 4 && image_index < 6 {
			with(_hitBox) {
				if other.image_xscale == 1 {
					x = other.x;
				} else {
					x = other.x - 18;
				}
					
				y = other.y - 40;
			}
			
			if !instance_exists(_hitBox) {
				with(instance_create_depth(x, y, depth, _hitBox)) {
					setState = "omegaHurtState";
					setHitStun = 120;
					setYspd = 10;
					setHitLag = 300;
					bounceable = true;
					
					image_xscale = 0.3;
					image_yscale = 0.55;
				}
			}
		}
		
		if image_index >= 6 {
			instance_destroy(_hitBox);
		}
	break;
	
	
	case "J4HState":
		sprite_index = spr_SonicBackAir;
		image_speed = 2;
		attacking = true;
		
		if image_index >= 4 && image_index < 8 {
			with(_hitBox) {
				if other.image_xscale == 1 {
					x = other.x - 25;
				} else {
					x = other.x + 5;
				}
						
				y = other.y - 30;
			}
			
			if !instance_exists(_hitBox) {
				with(instance_create_depth(x, y, depth, _hitBox)) {
					setState = "omegaHurtState";
					setHitStun = 60;
					setVel = -10;
					setYspd = -6;
					setHitLag = 300;
					bounceable = true;
					
					image_xscale = 0.40;
					image_yscale = 0.35;
				}
			}
		}
		
		if image_index >= 8 {
			instance_destroy(_hitBox);
		}
	break;
	
	
	case "J2HState":
		sprite_index = spr_SonicDJumpHeavy;
		image_speed = 0.9;
		attacking = true;
		
		if image_index >= 2 && image_index <= 4 {
			yspd = -3;
		}
		
		if image_index >= 3 && image_index < 6 {
			if !instance_exists(_hitBox) {
				with(instance_create_depth(x, y, depth, _hitBox)) {
					setState = "omegaHurtState";
					setHitStun = 60;
					setYspd = -8;
					setHitLag = 300;
					
					image_xscale = 0.57;
					image_yscale = 0.42;
					
					x = other.x - 18;
						
					y = other.y - 40;
				}
			}
		}
		
		if image_index >= 6 {
			instance_destroy(_hitBox);
		}
	break;
	
	
	//Parry State
	case "parryState":
		sprite_index = spr_SonicParry;
		vel = 0;
		attacking = false;
		
		if parryWindow > 0 {
			parryWindow -= 1;
			image_index = 0;
		}
		
		if parryDelay > 0 && parryWindow == 0 {
			image_index = 2;
		}
	break;
	
	
	//Dash State
	case "dashState":
		sprite_index = spr_SonicAirDash;
		image_speed = 1;
		attacking = false;
		
		if invinceFrames > 0 {
			if image_xscale == -1 {
				vel = -7;
			} else if image_xscale == 1 {
				vel = 7;
			}
			yspd = 0;
		}
		
		if invinceFrames <= 0 {
			
			if ground {
				state = "freeState";
			} else {
				state = "jumpState";	
			}
		}
	break;
	
	
	//Charge State
	case "chargeState":
		if charge_Key {
			if EN < maxEN {
				sprite_index = spr_SonicCharge;
				vel = 0;
				EN += 2;
				obj_SFXManager.chargeLoop = true;
			}
		} else {
			state = "freeState";
		}
			
		if EN >= maxEN {
			state = "freeState";
			EN = maxEN;
		}
	break;
	
	
	//Hurt States
	case "hurtState":
		sprite_index = spr_SonicHurt;
		attacking = false;
		
		if hitStun == 0 {
			if ground {
				state = "freeState";
			} else {
				state = "jumpState";
			}
		}
		
		instance_destroy(_hitBox);
	break;
	
	case "bigHurtState":
		sprite_index = spr_SonicBigHurt;
		attacking = false;
		
		if hitStun == 0 {
			if ground {
				state = "freeState";
			} else {
				state = "jumpState";
			}
		}
		
		instance_destroy(_hitBox);
	break
	
	case "omegaHurtState":
		if place_meeting(x + vel, y, obj_Solid) && bounceable {
			sprite_index = spr_SonicDamageWall;
		} else if place_meeting(x, y + 1, obj_Solid) && bounceable {
			sprite_index = spr_SonicDamageFloor;
		} else {
			sprite_index = spr_SonicOmegaHurt;
		}
		
		attacking = false;
		
		if hitStun == 0 {
			if ground {
				state = "freeState";
			} else {
				state = "jumpState";
			}
		}
		
		instance_destroy(_hitBox);
	break;
}


//Bounceable Shit
var _bounceWall = place_meeting(x + vel, y, obj_Solid);
var _bounceFloor = place_meeting(x, y + 1, obj_Solid);

if bounceable {
	if vel > 0 {
		bounceVel = vel;
	} else if vel < 0 {
		bounceVel = vel;
	}
}

if bounceable && _bounceWall {
	bounceable = false;
	hitStun = 50;
	yspd = -6;
	
	vel = -bounceVel / 2;
	
	hitLag = 80;
	
	obj_SFXManager.wallBounce = true;
	obj_CameraAction.shakeValue = 0.5;
}

if bounceable && _bounceFloor && vel == 0 {
	bounceable = false;
	hitStun = 60;
	yspd = -10;
	hitLag = 80;
	obj_SFXManager.wallBounce = true;
	obj_CameraAction.shakeValue = 0.5;
}