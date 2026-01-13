if !instance_exists(obj_ResultsCard) {
	var _camX = camera_get_view_x(view_camera[0]);
	var _camY = camera_get_view_y(view_camera[0]);
	
	if explodeTimer > 0 {
		explodeTimer -= 1;
	}
	
	if explodeTimer <= 0 {
		explodeTimer = random_range(60 / 3, 60 * 3);
		
		obj_SFXManager.UNDERTALEBombSplosion = true;
		
		scr_ScreenShake(0.25);
		scr_ControllerRumble(0.25);
		
		/*if global.Particles {
			instance_create_depth(_camX - 500, _camY - 50, obj_Player.depth - 1, obj_HeadFloorPiece1);
			instance_create_depth(_camX - 500, _camY - 50, obj_Player.depth - 1, obj_HeadFloorPiece2);
			instance_create_depth(_camX - 500, _camY - 50, obj_Player.depth - 1, obj_HeadFloorPiece3);
			instance_create_depth(_camX - 500, _camY - 50, obj_Player.depth - 1, obj_HeadFloorPiece4);
			instance_create_depth(_camX - 500, _camY - 50, obj_Player.depth - 1, obj_HeadFloorPiece5);
			instance_create_depth(_camX - 500, _camY - 50, obj_Player.depth - 1, obj_HeadFloorPiece6);
			instance_create_depth(_camX - 500, _camY - 50, obj_Player.depth - 1, obj_HeadFloorPiece7);
			instance_create_depth(_camX - 500, _camY - 50, obj_Player.depth - 1, obj_HeadFloorPiece8);
			instance_create_depth(_camX - 500, _camY - 50, obj_Player.depth - 1, obj_HeadFloorPiece9);
			instance_create_depth(_camX - 500, _camY - 50, obj_Player.depth - 1, obj_HeadFloorPiece10);
		}*/
	}
}