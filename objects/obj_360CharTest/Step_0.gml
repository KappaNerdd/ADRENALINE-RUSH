#region Movement

PlayerAngleLocals();

if (canMove) {
	#region //Movin'
		if (canMoveX) {
			PlayerXMovement();
		    x += (angleCos * xSpeed);
		}
	
		if (canMoveY) {
		    y -= (angleSin * xSpeed);
		}
	

		var repFactor = 1;

		if (abs(xSpeed) > 11) {
		    repFactor = round(abs(xSpeed) / 9);
		}
	#endregion

	#region //Right & Left Collision
		if (xSpeed > 0) {
		    while (PlayerCollisionRight(x, y, angle, maskMid)) {
		        x -= angleCos;
		        y += angleSin;
		    }
		}

		if (xSpeed < 0) {
		    while (PlayerCollisionLeft(x, y, angle, maskMid)) {
		        x += angleCos;
		        y -= angleSin;
		    }
		}

		// Cache collision
		PlayerCollisionCache();
	#endregion

	#region //On Ground
		if ground {
		    repeat (repFactor) {
		        if edgeCollision {
		            while (PlayerCollisionMain(x, y + sensorMainYDist)) {
		                x -= angleSin;
		                y -= angleCos;
		            }
		        }

		        if PlayerCollisionSlope(x, y + sensorMainYDist, angle, maskMid) && !PlayerCollisionMain(x, y + sensorMainYDist) {
		            while !PlayerCollisionMain(x, y + sensorMainYDist) {
		                x += angleSin;
		                y += angleCos;
		            }
		        }
		    }

		    PlayerCollisionCache();
		
			//Fall if there is not enough speed.
	        if angle >= 75 && angle <= 285 && abs(xSpeed) < xMinSpeedToFall {
	            PlayerFlight();
	        }

	        PlayerCollisionCache();
			

	        //Fall off the ground if the edges aren't colliding
	        if angle != 0 && !edgeCollision {
	            PlayerFlight();               
	        } 
        
	        //Get new angle
	        if edgeCollision && ground {
	            //Store the new angle
	            angleHolder = PlayerGetAngle(x, y, angle);
    
	            //Smooth angle
	            if abs(angle - angleHolder) < 45 {
	                PlayerSetAngle(angle + (angleHolder - angle) * 0.5);
	            } else {
	                PlayerSetAngle(angleHolder);
	            }
			} else {
	            PlayerSetAngle(0);
	        }
    
	        //Leave the ground
	        if !bottomCollision {
	            PlayerSetGround(false);
	            PlayerSetAngle(0);
	        }
		}     
	#endregion

	#region //Vertical movement        
		if !ground {  
			if (canMoveY) {
				y += ySpeed;
			}
        
	        //Cache collision
	        PlayerCollisionCache();
        
	        //Ceiling
	        if ySpeed < 0 && PlayerCollisionTop(x, y, 0, maskBig) {
	            if PlayerCollisionLeftEdge(x, y, 180) && PlayerCollisionRightEdge(x, y, 180) {
	                PlayerSetAngle(PlayerGetAngle(x, y, 180));
                                        
	                if angle < 140 || angle > 220 {
	                    xSpeed = -angleSin * (ySpeed * 1.5);
	                    ySpeed = 0;     
	                    PlayerSetGround(true);
	                    PlayerCollisionCache();             
	                } else {
	                    PlayerSetAngle(0);
	                }
	            }
	        }
                
	        //Move the player outside in case he has got stuck into the floor or the ceiling           
	        while (ySpeed < 0 && PlayerCollisionTop(x, y, 0, maskMid)) {
	            y += 1;
	        }            
		
	        while (ySpeed > 0 && PlayerCollisionBottom(x, y, 0, maskMid)) {
	            y -= 1;
	        }      
		
    
	        //Wall Collision (needs to be performed because y axis has recently changed)
	        while (PlayerCollisionRight(x, y, angle, maskMid)) {
	            x -= angleCos;
	            y += angleSin;
	        }
        
	        while (PlayerCollisionLeft(x, y, angle, maskMid)) {
	            x += angleCos;
	            y -= angleSin;
	        }
        
		    //Add gravity
		    if (noGravityTimer == 0) {
		        ySpeed = min(ySpeed + yGravity, 15);
		    }

		    PlayerCollisionCache();
		
		    //Land
	        if ySpeed >= 0 && bottomCollision {
	            if edgeCollision {
	                PlayerSetAngle(PlayerGetAngle(x, y, angle));
	                PlayerCollisionCache();
	            }
    
	            xSpeed -= angleSin * ySpeed;
	            ySpeed = 0;
	            PlayerSetGround(true);
	        }
    
	        //Check if we're on the air but we collided with the ceiling
	        if ySpeed < 0 && PlayerCollisionTop(x, y, 0, maskBig) {
	            ySpeed = 0;
	        }
		}
	#endregion

	#region //Misc
		//Acceleration and deceleration on slopes
		if ground && angle > 35 && angle < 325 {
			if angle > 40 && angle < 320 {
				xSpeed -= angleSin * xSlopeFactor;
			}
		}

		//Stop when meet a wall/slide pass and isnt sliding
		if xSpeed > 0 && PlayerCollisionRight(x, y, angle, maskBig) {
		    xSpeed = 0;
		    pushingWall = true;
		} else if xSpeed < 0 && PlayerCollisionLeft(x, y, angle, maskBig) {
		    xSpeed = 0;
		    pushingWall = true;
		} else {
		    pushingWall = false;
		}

	    //Decrease gravity freeze timer
	    if (noGravityTimer > 0) {
	        noGravityTimer -= 1;
	    }
	
		if ground {
		    //Rotate while moving on the ground
		    image_angle = ApproachAngle(image_angle, angle, 3 + abs(xSpeed));
		} else {
			//Rotate until reaches to the normal angle
		    image_angle = ApproachAngle(image_angle, 0, 4);
		}
	#endregion
}
#endregion