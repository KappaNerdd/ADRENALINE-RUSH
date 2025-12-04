if place_meeting(x, y, obj_Player) && waitTimer > 0 && !global.Death {
	waitTimer -= 1;
}

if waitTimer <= 0 {
	waitTimer = 0;
}

if !instance_exists(obj_RoomTransitionBasic) && waitTimer <= 0 {
	var instantiated = instance_create_depth(0, 0, -999999, obj_RoomTransitionBasic);
	
	instantiated.target_x = target_x;
	instantiated.target_y = target_y;
	instantiated.target_rm = target_rm;
	instantiated.target_xscale = target_xscale;
}


if place_meeting(x, y, obj_Player) {
	obj_Player.vel = characterVel;
	obj_Player.image_speed = characterAnimSpeed;
	obj_Player.can_Move = false;
	
	
	
	//Stop Shit (Kappa)
	obj_Player.sliding = false;
	obj_Player.stomping = false;
	obj_Player.airDash = false;
	
	
	
	//Play character animation
	if obj_Player.ground == true {
		if characterSprite == "RIGHT" {
			with (obj_Player) {
				sprite_index = sprWalk;
				image_xscale = 1;
			}
		} else if characterSprite == "RIGHT_RUN" {
			with (obj_Player) {
				sprite_index = sprRun;
				image_xscale = 1;
			}
		} else if characterSprite == "LEFT" {
			with (obj_Player) {
				sprite_index = sprWalk;
				image_xscale = -1;
			}
		} else if characterSprite == "LEFT_RUN" {
			with (obj_Player) {
				sprite_index = sprRun;
				image_xscale = -1;
			}
		}
	}
}



if global.DEBUG == true {
	visible = true;
} else {
	visible = false;
}