function scr_InputBuffer() {
	bufferTime = 10;
	
	jumpKeyBuffered = false;
	jumpKeyBufferTimer = 0;
	
	punchKeyBuffered = false;
	punchKeyBufferTimer = 0;
	
	mediumKeyBuffered = false;
	mediumKeyBufferTimer = 0;
	
	heavyKeyBuffered = false;
	heavyKeyBufferTimer = 0;
	
	parryKeyBuffered = false;
	parryKeyBufferTimer = 0;
	
	dashKeyBuffered = false;
	dashKeyBufferTimer = 0;
	
	superDashKeyBuffered = false;
	superDashKeyBufferTimer = 0;
	
	right_Key = false;
	left_Key = false;
	down_Key = false;
	up_Key = false;
	up_Key_Once = false;
	
	light_Key = false;
	medium_Key = false;
	heavy_Key = false;
	special_Key = false;
	special_Key_Held = false;
	
	dash_Key = false;
	dash_Key_Held = false;
	superDash_Key = false;
	parry_Key = false;
	charge_Key = false;
}


function scr_ControlsAction() {
	//Controls
	right_Key = keyboard_check(global.RightKeyAction) or gamepad_button_check(global.Player1Con, global.RightPadAction);
	right_Key = clamp(right_Key, 0, 1);

	left_Key = keyboard_check(global.LeftKeyAction) or gamepad_button_check(global.Player1Con, global.LeftPadAction);
	left_Key = clamp(left_Key, 0, 1);
	
	down_Key = keyboard_check(global.DownKeyAction) or gamepad_button_check(global.Player1Con, global.DownPadAction);
	down_Key = clamp(down_Key, 0, 1);
	
	up_Key = keyboard_check(global.UpKeyAction) or gamepad_button_check(global.Player1Con, global.UpPadAction);
	up_Key = clamp(up_Key, 0, 1);
	up_Key_Once = keyboard_check_pressed(global.UpKeyAction) or gamepad_button_check_pressed(global.Player1Con, global.UpPadAction);
	up_Key_Once = clamp(up_Key_Once, 0, 1);
	
	light_Key = keyboard_check_pressed(global.LightKeyAction) or gamepad_button_check_pressed(global.Player1Con, global.LightButtonAction);
	light_Key = clamp(light_Key, 0, 1);
	
	medium_Key = keyboard_check_pressed(global.MediumKeyAction) or gamepad_button_check_pressed(global.Player1Con, global.MediumButtonAction);
	medium_Key = clamp(medium_Key, 0, 1);
	
	heavy_Key = keyboard_check_pressed(global.HeavyKeyAction) or gamepad_button_check_pressed(global.Player1Con, global.HeavyButtonAction);
	heavy_Key = clamp(heavy_Key, 0, 1);
	
	special_Key = keyboard_check_pressed(global.SpecialKeyAction) or gamepad_button_check_pressed(global.Player1Con, global.SpecialButtonAction);
	special_Key = clamp(special_Key, 0, 1);
	special_Key_Held = keyboard_check(global.SpecialKeyAction) or gamepad_button_check(global.Player1Con, global.SpecialButtonAction);
	special_Key_Held = clamp(special_Key_Held, 0, 1);
	
	dash_Key = keyboard_check_pressed(global.DashKeyAction) or gamepad_button_check_pressed(global.Player1Con, global.DashButtonAction);
	dash_Key = clamp(dash_Key, 0, 1);
	dash_Key_Held = keyboard_check(global.DashKeyAction) or gamepad_button_check(global.Player1Con, global.DashButtonAction);
	dash_Key_Held = clamp(dash_Key_Held, 0, 1);
	
	superDash_Key = keyboard_check_pressed(global.SuperDashKeyAction) or gamepad_button_check_pressed(global.Player1Con, global.SuperDashButtonAction)
	superDash_Key = clamp(superDash_Key, 0, 1);
	
	parry_Key = keyboard_check_pressed(global.ParryKeyAction) or gamepad_button_check_pressed(global.Player1Con, global.ParryButtonAction);
	parry_Key = clamp(parry_Key, 0, 1);
	
	charge_Key = keyboard_check(global.ChargeKeyAction) or gamepad_button_check(global.Player1Con, global.ChargeButtonAction);
	charge_Key = clamp(charge_Key, 0, 1);
	
	
	//Buffer Pressed Inputs
	
	//Punch
	if light_Key {
		punchKeyBufferTimer = bufferTime;
	}
	
	if punchKeyBufferTimer > 0 {
		punchKeyBufferTimer -= 1;
		punchKeyBuffered = true;
	}
	
	if punchKeyBufferTimer <= 0 {
		punchKeyBuffered = false;
	}
	
	
	//Medium
	if medium_Key {
		mediumKeyBufferTimer = bufferTime;
	}
	
	if mediumKeyBufferTimer > 0 {
		mediumKeyBufferTimer -= 1;
		mediumKeyBuffered = true;
	}
	
	if mediumKeyBufferTimer <= 0 {
		mediumKeyBuffered = false;
	}
	
	
	//Heavy
	if heavy_Key {
		heavyKeyBufferTimer = bufferTime;
	}
	
	if heavyKeyBufferTimer > 0 {
		heavyKeyBufferTimer -= 1;
		heavyKeyBuffered = true;
	}
	
	if heavyKeyBufferTimer <= 0 {
		heavyKeyBuffered = false;
	}
	
	
	//Dash
	if dash_Key {
		dashKeyBufferTimer = bufferTime;
	}
	
	if dashKeyBufferTimer > 0 {
		dashKeyBufferTimer -= 1;
		dashKeyBuffered = true;
	}
	
	if dashKeyBufferTimer <= 0 {
		dashKeyBuffered = false;
	}
	
	
	//Super-Dash
	if superDash_Key {
		superDashKeyBufferTimer = bufferTime * 2;
	}
	
	if superDashKeyBufferTimer > 0 {
		superDashKeyBufferTimer -= 1;
		superDashKeyBuffered = true;
	}
	
	if superDashKeyBufferTimer <= 0 {
		superDashKeyBuffered = false;
	}
	
	
	//Parry
	if parry_Key {
		parryKeyBufferTimer = bufferTime;
	}
	
	if parryKeyBufferTimer > 0 {
		parryKeyBufferTimer -= 1;
		parryKeyBuffered = true;
	}
	
	if parryKeyBufferTimer <= 0 {
		parryKeyBuffered = false;
	}
}