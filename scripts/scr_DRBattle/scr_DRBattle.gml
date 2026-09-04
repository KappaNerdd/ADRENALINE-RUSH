function scr_BattleStart(_makeBG = true, _bgCol = c_purple, _changeCharPos = false, _charPos1 = [0, 0], _charPos2 = [0, 0], _charPos3 = [0, 0], _enemPos1 = [0, 0], _enemPos2 = [0, 0], _enemPos3 = [0, 0]) {
	var _camX = camera_get_view_x(view_camera[0]);
	var _camY = camera_get_view_y(view_camera[0]);
	
	if !instance_exists(obj_DRBattle) {
		with(instance_create_depth(-10000, 0, 50, obj_DRBattle)) {
			makeBG = _makeBG;
			image_blend = _bgCol;
			changePos = _changeCharPos;
		
			if _changeCharPos {
				targetX = [_camX + _charPos1[0], _camX + _charPos2[0], _camX + _charPos3[0]];
				targetY = [_camY + _charPos1[1], _camY + _charPos2[1], _camY + _charPos3[1]];
				
				enemTargetX = [_camX + _enemPos1[0], _camX + _enemPos2[0], _camX + _enemPos3[0]];
				enemTargetY = [_camY + _enemPos1[1], _camY + _enemPos2[1], _camY + _enemPos3[1]];
			}
		}
	}
}