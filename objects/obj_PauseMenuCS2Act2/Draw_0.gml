draw_self();

if !changeBind {
	draw_text(x + 95, y + 4, "ACTION 2");
	
	var _col = c_white;
	var _var = global.Action1KeySpeed;
	
	if !gamepad_is_connected(global.Player1Con) {
		_var = global.Action1KeySpeed;
		
		if _var == global.LeftKeySpeed or _var == global.RightKeySpeed or _var == global.UpKeySpeed or _var == global.DownKeySpeed or _var == global.JumpKeySpeed or _var == global.Action2KeySpeed or _var == global.PauseKeySpeed or _var == global.ActionKeySpeed or _var == global.Action3KeySpeed or _var == global.Action4KeySpeed or _var == global.SelectKeySpeed {
			_col = c_red;
		}
	} else {
		_var = global.Action1ButtonSpeed;
		
		if _var == global.LeftPadSpeed or _var == global.RightPadSpeed or _var == global.UpPadSpeed or _var == global.DownPadSpeed or _var == global.JumpButtonSpeed or _var == global.Action2ButtonSpeed or _var == global.PauseButtonSpeed or _var == global.ActionButtonSpeed or _var == global.Action3ButtonSpeed or _var == global.Action4ButtonSpeed or _var == global.SelectButtonSpeed {
			_col = c_red;
		}
	}
	
	draw_sprite_ext(obj_CustomAct2KeySpeed.sprite_index, obj_CustomAct2KeySpeed.image_index, x + 200, y + 16, 1, 1, 0, _col, 1);
	
} else {
	draw_text(x + 95, y + 4, "ACTION 2");
}
