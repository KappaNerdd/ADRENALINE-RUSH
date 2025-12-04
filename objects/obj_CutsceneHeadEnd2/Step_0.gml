obj_CameraCutscene.followPlayer = true;

if fixCameraTimer > 0 {
	fixCameraTimer -= 1;
	
	with (obj_CameraParent) {
		finalCamX = (obj_Player.x - camera_get_view_width(view_camera[0]) / 2);
		finalCamY = (obj_Player.y - camera_get_view_height(view_camera[0]) / 2);
	}
}


if createBeamTimer > 0 {
	createBeamTimer -= 1;
	
	with(obj_Player) {
		sprite_index = sprGuard;
		image_index = 0;
		image_speed = 0;
	}
}

if createBeamTimer <= 0 {
	if waitBeamTimer > 0 {
		waitBeamTimer -= 1;
		
		with(obj_Player) {
			sprite_index = sprLook_up;
			image_speed = 1;
		}
	}
}

if waitBeamTimer <= 0 {
	if crouchTimer > 0 {
		crouchTimer -= 1;
		
		with(obj_Player) {
			sprite_index = spr_KappaDamageDownHead;
			image_index = 2;
			image_speed = 0;
		}
	}
}

if crouchTimer <= 0 {
	if preJumpTimer > 0 {
		preJumpTimer -= 1;
		
		with(obj_Player) {
			sprite_index = sprStomp;
			image_speed = 1;
		}
	}
}

if preJumpTimer <= 0 {
	
	with(obj_Player) {
		jump_Key_Held = true;
	}
	
	if jumpTimer > 0 {
		with(obj_Player) {
			sprite_index = sprFalling;
			yspd = -9;
		}
		
		jumpTimer -= 1;
	}
	
	if jumpingTimer > 0 {
		jumpingTimer -= 1;
	}
}


if jumpingTimer <= 0 {
	if !instance_exists(obj_RoomTransitionBasic) {
		var _inst = instance_create_depth(x, y, depth, obj_RoomTransitionBasic);
		
		_inst.target_rm = rm_HeadSpeedBoss;
	}
}
