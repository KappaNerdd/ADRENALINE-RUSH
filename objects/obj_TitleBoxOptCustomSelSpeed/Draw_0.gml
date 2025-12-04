draw_self();

if !changeBind {
	draw_text(x + 8, y + 4, scr_LocalText("opt_ConSelect"));
	
	var _col = c_white;
	var _var = global.SelectKeySpeed;
	
	if !gamepad_is_connected(global.Player1Con) {
		_var = global.SelectKeySpeed;
		
		if _var == global.DownKeySpeed or _var == global.RightKeySpeed or _var == global.UpKeySpeed or _var == global.LeftKeySpeed or _var == global.JumpKeySpeed or _var == global.Action1KeySpeed or _var == global.Action4KeySpeed or _var == global.ActionKeySpeed or _var == global.Action2KeySpeed or _var == global.Action3KeySpeed or _var == global.PauseKeySpeed {
			_col = c_red;
		}
	} else {
		_var = global.SelectButtonSpeed;
		
		if _var == global.DownPadSpeed or _var == global.RightPadSpeed or _var == global.UpPadSpeed or _var == global.LeftPadSpeed or _var == global.JumpButtonSpeed or _var == global.Action1ButtonSpeed or _var == global.Action4ButtonSpeed or _var == global.ActionButtonSpeed or _var == global.Action2ButtonSpeed or _var == global.Action3ButtonSpeed or _var == global.PauseButtonSpeed {
			_col = c_red;
		}
	}
	
	draw_sprite_ext(obj_CustomSelectKeySpeed.sprite_index, obj_CustomSelectKeySpeed.image_index, x - 80, y + 16, 1, 1, 0, _col, 1);
	
} else {
	draw_text(x + 8, y + 4, "SELECT");
}

