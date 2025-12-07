function scr_jumpKeyBuffering() {
	bufferTime = 5;
	
	jumpKeyBuffered = false;
	jumpKeyBufferTimer = 0;
	
	specialKeyBuffered = false;
	specialKeyBufferTimer = 0;
	
	rushTrickTime = 20;
	
	rushTrickBuffered = false;
	rushTrickBufferTimer = 0;
	
	rushTrickFinaleBuffered = false;
	rushTrickFinaleBufferTimer = 0;
	
	railRushTrickBuffered = false;
	railRushTrickBufferTimer = 0;
}


function scr_JumpKeyBufferingStep() {
	//Jump Buffering
	if jump_Key {
		jumpKeyBufferTimer = bufferTime;
	}
	
	if jumpKeyBufferTimer > 0 {
		jumpKeyBufferTimer--;
		jumpKeyBuffered = true;
	} else {
		jumpKeyBuffered = false;
	}
	
	//Special Buffering
	if action2_Key {
		specialKeyBufferTimer = bufferTime;
	}
	
	if specialKeyBufferTimer > 0 {
		specialKeyBufferTimer--;
		specialKeyBuffered = true;
	} else {
		specialKeyBuffered = false;
	}
}


//Player 1 Controls
function getCharacterControls() {
	
		//Movement
		right_Key = keyboard_check(global.RightKeySpeed) or gamepad_button_check(global.Player1Con, global.RightPadSpeed) or (gamepad_axis_value(global.Player1Con, gp_axislh) > global.ConDeadZone);
		right_Key = clamp(right_Key, 0, 1);
		right_Key_Once = keyboard_check_pressed(global.RightKeySpeed) or gamepad_button_check_pressed(global.Player1Con, global.RightPadSpeed) or (gamepad_axis_value(global.Player1Con, gp_axislh) > global.ConDeadZone);
		right_Key_Once = clamp(right_Key_Once, 0, 1);
		right_Key_Released = keyboard_check_released(global.RightKeySpeed) or gamepad_button_check_released(global.Player1Con, global.RightPadSpeed) or (gamepad_axis_value(global.Player1Con, gp_axislh) < global.ConDeadZone);
		right_Key_Released = clamp(right_Key_Released, 0, 1);
	

		left_Key = keyboard_check(global.LeftKeySpeed) or gamepad_button_check(global.Player1Con, global.LeftPadSpeed) or (gamepad_axis_value(global.Player1Con, gp_axislh) < -global.ConDeadZone);
		left_Key = clamp(left_Key, 0, 1);
		left_Key_Once = keyboard_check_pressed(global.LeftKeySpeed) or gamepad_button_check_pressed(global.Player1Con, global.LeftPadSpeed) or (gamepad_axis_value(global.Player1Con, gp_axislh) < -global.ConDeadZone);
		left_Key_Once = clamp(left_Key_Once, 0, 1);
		left_Key_Released = keyboard_check_released(global.LeftKeySpeed) or gamepad_button_check_released(global.Player1Con, global.LeftPadSpeed) or (gamepad_axis_value(global.Player1Con, gp_axislh) > -global.ConDeadZone);
		left_Key_Released = clamp(left_Key_Released, 0, 1);


		//Directional
		down_Key = keyboard_check(global.DownKeySpeed) or gamepad_button_check(global.Player1Con, global.DownPadSpeed) or (gamepad_axis_value(global.Player1Con, gp_axislv) > global.ConDeadZone);
		down_Key = clamp(down_Key, 0, 1);
		down_Key_Once = keyboard_check_pressed(global.DownKeySpeed) or gamepad_button_check_pressed(global.Player1Con, global.DownPadSpeed) or (gamepad_axis_value(global.Player1Con, gp_axislv) > global.ConDeadZone);
		down_Key_Once = clamp(down_Key_Once, 0, 1);
		down_Key_Released = keyboard_check_released(global.DownKeySpeed) or gamepad_button_check_released(global.Player1Con, global.DownPadSpeed) or (gamepad_axis_value(global.Player1Con, gp_axislv) < global.ConDeadZone);
		down_Key_Released = clamp(down_Key, 0, 1);
	

		up_Key = keyboard_check(global.UpKeySpeed) or gamepad_button_check(global.Player1Con, global.UpPadSpeed) or (gamepad_axis_value(global.Player1Con, gp_axislv) < -global.ConDeadZone);
		up_Key = clamp(up_Key, 0, 1);
		up_Key_Once = keyboard_check_pressed(global.UpKeySpeed) or gamepad_button_check_pressed(global.Player1Con, global.UpPadSpeed) or (gamepad_axis_value(global.Player1Con, gp_axislv) < -global.ConDeadZone);
		up_Key_Once = clamp(up_Key_Once, 0, 1);
		up_Key_Released = keyboard_check_released(global.UpKeySpeed) or gamepad_button_check_released(global.Player1Con, global.UpPadSpeed) or (gamepad_axis_value(global.Player1Con, gp_axislv) > -global.ConDeadZone);
		up_Key_Released = clamp(up_Key_Released, 0, 1);


		//Actions
		jump_Key = keyboard_check_pressed(global.JumpKeySpeed) or gamepad_button_check_pressed(global.Player1Con, global.JumpButtonSpeed);
		jump_Key = clamp(jump_Key, 0, 1);
		jump_Key_Held = keyboard_check(global.JumpKeySpeed) or gamepad_button_check(global.Player1Con, global.JumpButtonSpeed);
		jump_Key_Held = clamp(jump_Key_Held, 0, 1);
		jump_Key_Released = keyboard_check_released(global.JumpKeySpeed) or gamepad_button_check_released(global.Player1Con, global.JumpButtonSpeed);
		jump_Key_Released = clamp(jump_Key_Released, 0, 1);
	
		action_Key = keyboard_check_pressed(global.ActionKeySpeed) or gamepad_button_check_pressed(global.Player1Con, global.ActionButtonSpeed);
		action_Key = clamp(action_Key, 0, 1);
		action_Key_Held = keyboard_check(global.ActionKeySpeed) or gamepad_button_check(global.Player1Con, global.ActionButtonSpeed);
		action_Key_Held = clamp(action_Key_Held, 0, 1);
		action_Key_Released = keyboard_check_released(global.ActionKeySpeed) or gamepad_button_check_pressed(global.Player1Con, global.ActionButtonSpeed);
		action_Key_Released = clamp(action_Key_Released, 0, 1);
	
		action1_Key = keyboard_check_pressed(global.Action1KeySpeed) or gamepad_button_check_pressed(global.Player1Con, global.Action1ButtonSpeed);
		action1_Key = clamp(action1_Key, 0, 1);
		action1_Key_Held = keyboard_check(global.Action1KeySpeed) or gamepad_button_check(global.Player1Con, global.Action1ButtonSpeed);
		action1_Key_Held = clamp(action1_Key_Held, 0, 1);
		action1_Key_Released = keyboard_check_released(global.Action1KeySpeed) or gamepad_button_check_released(global.Player1Con, global.Action1ButtonSpeed);
		action1_Key_Released = clamp(action1_Key_Released, 0, 1);

		action2_Key = keyboard_check_pressed(global.Action2KeySpeed) or gamepad_button_check_pressed(global.Player1Con, global.Action2ButtonSpeed);
		action2_Key = clamp(action2_Key, 0, 1);
		action2_Key_Held = keyboard_check(global.Action2KeySpeed) or gamepad_button_check(global.Player1Con, global.Action2ButtonSpeed);
		action2_Key_Held = clamp(action2_Key_Held, 0, 1);
		action2_Key_Released = keyboard_check_released(global.Action2KeySpeed) or gamepad_button_check_released(global.Player1Con, global.Action2ButtonSpeed);
		action2_Key_Released = clamp(action2_Key_Released, 0, 1);
	
		action3_Key = keyboard_check_pressed(global.Action3KeySpeed) or gamepad_button_check_pressed(global.Player1Con, global.Action3ButtonSpeed);
		action3_Key = clamp(action3_Key, 0, 1);
		action3_Key_Held = keyboard_check(global.Action3KeySpeed) or gamepad_button_check(global.Player1Con, global.Action3ButtonSpeed);
		action3_Key_Held = clamp(action3_Key_Held, 0, 1);
		action3_Key_Released = keyboard_check_released(global.Action3KeySpeed) or gamepad_button_check_released(global.Player1Con, global.Action3ButtonSpeed);
		action3_Key_Released = clamp(action3_Key_Released, 0, 1);
	
		action4_Key = keyboard_check_pressed(global.Action4KeySpeed) or gamepad_button_check_pressed(global.Player1Con, global.Action4ButtonSpeed);
		action4_Key = clamp(action4_Key, 0, 1);
		action4_Key_Held = keyboard_check(global.Action4KeySpeed) or gamepad_button_check(global.Player1Con, global.Action4ButtonSpeed);
		action4_Key_Held = clamp(action4_Key_Held, 0, 1);
		action4_Key_Released = keyboard_check_released(global.Action4KeySpeed) or gamepad_button_check_released(global.Player1Con, global.Action4ButtonSpeed);
		action4_Key_Released = clamp(action4_Key_Released, 0, 1);
	
		pause_Key = keyboard_check_pressed(global.PauseKeySpeed) or gamepad_button_check_pressed(global.Player1Con, global.PauseButtonSpeed);
		pause_Key = clamp(pause_Key, 0, 1);
		pause_Key_Held = keyboard_check(global.PauseKeySpeed) or gamepad_button_check(global.Player1Con, global.PauseButtonSpeed);
		pause_Key_Held = clamp(pause_Key_Held, 0, 1);
	
		select_Key = keyboard_check_pressed(global.SelectKeySpeed) or gamepad_button_check_pressed(global.Player1Con, global.SelectButtonSpeed);
		select_Key = clamp(select_Key, 0, 1);
		select_Key_Held = keyboard_check(global.SelectKeySpeed) or gamepad_button_check(global.Player1Con, global.SelectButtonSpeed);
		select_Key_Held = clamp(select_Key_Held, 0, 1);
}


//Player 2 Controls
function getCharacterControlsP2() {
	//Movement
	right_Key = gamepad_button_check(global.Player2Con, global.RightPadSpeed) or (gamepad_axis_value(global.Player2Con, gp_axislh) > global.ConDeadZone);
	right_Key = clamp(right_Key, 0, 1);
	right_Key_Once = gamepad_button_check_pressed(global.Player2Con, global.RightPadSpeed) or (gamepad_axis_value(global.Player2Con, gp_axislh) > global.ConDeadZone);
	right_Key_Once = clamp(right_Key_Once, 0, 1);
	

	left_Key = gamepad_button_check(global.Player2Con, global.LeftPadSpeed) or (gamepad_axis_value(global.Player2Con, gp_axislh) < -global.ConDeadZone);
	left_Key = clamp(left_Key, 0, 1);
	left_Key_Once = gamepad_button_check_pressed(global.Player2Con, global.LeftPadSpeed) or (gamepad_axis_value(global.Player2Con, gp_axislh) < -global.ConDeadZone);
	left_Key_Once = clamp(left_Key_Once, 0, 1);


	//Directional
	down_Key = gamepad_button_check(global.Player2Con, global.DownPadSpeed) or (gamepad_axis_value(global.Player2Con, gp_axislv) > global.ConDeadZone);
	down_Key = clamp(down_Key, 0, 1);
	down_Key_Once = gamepad_button_check_pressed(global.Player2Con, global.DownPadSpeed) or (gamepad_axis_value(global.Player2Con, gp_axislv) > global.ConDeadZone);
	down_Key_Once = clamp(down_Key_Once, 0, 1);
	

	up_Key = gamepad_button_check(global.Player2Con, global.UpPadSpeed) or (gamepad_axis_value(global.Player2Con, gp_axislv) < -global.ConDeadZone);
	up_Key = clamp(up_Key, 0, 1);
	up_Key_Once = gamepad_button_check_pressed(global.Player2Con, global.UpPadSpeed) or (gamepad_axis_value(global.Player2Con, gp_axislv) < -global.ConDeadZone);
	up_Key_Once = clamp(up_Key_Once, 0, 1);


	//Actions
	jump_Key = gamepad_button_check_pressed(global.Player2Con, global.JumpButtonSpeed);
	jump_Key = clamp(jump_Key, 0, 1);
	jump_Key_Held = gamepad_button_check(global.Player2Con, global.JumpButtonSpeed);
	jump_Key_Held = clamp(jump_Key_Held, 0, 1);
	
	action_Key = gamepad_button_check_pressed(global.Player2Con, global.ActionButtonSpeed);
	action_Key = clamp(action_Key, 0, 1);
	action_Key_Held = gamepad_button_check(global.Player2Con, global.ActionButtonSpeed);
	action_Key_Held = clamp(action_Key_Held, 0, 1);
	
	action1_Key = gamepad_button_check_pressed(global.Player2Con, global.Action1ButtonSpeed);
	action1_Key = clamp(action1_Key, 0, 1);
	action1_Key_Held = gamepad_button_check(global.Player2Con, global.Action1ButtonSpeed);
	action1_Key_Held = clamp(action1_Key_Held, 0, 1);

	action2_Key = gamepad_button_check_pressed(global.Player2Con, global.Action2ButtonSpeed);
	action2_Key = clamp(action2_Key, 0, 1);
	action2_Key_Held = gamepad_button_check(global.Player2Con, global.Action2ButtonSpeed);
	action2_Key_Held = clamp(action2_Key_Held, 0, 1);
	action2_Key_Released = gamepad_button_check_released(global.Player2Con, global.Action2ButtonSpeed);
	action2_Key_Released = clamp(action2_Key_Released, 0, 1);
	
	action3_Key = gamepad_button_check_pressed(global.Player2Con, global.Action3ButtonSpeed);
	action3_Key = clamp(action3_Key, 0, 1);
	action3_Key_Held = gamepad_button_check(global.Player2Con, global.Action3ButtonSpeed);
	action3_Key_Held = clamp(action3_Key_Held, 0, 1);
	
	action4_Key = gamepad_button_check_pressed(global.Player2Con, global.Action4ButtonSpeed);
	action4_Key = clamp(action4_Key, 0, 1);
	action4_Key_Held = gamepad_button_check(global.Player2Con, global.Action4ButtonSpeed);
	action4_Key_Held = clamp(action4_Key_Held, 0, 1);
	
	pause_Key = gamepad_button_check_pressed(global.Player2Con, global.PauseButtonSpeed);
	pause_Key = clamp(pause_Key, 0, 1);
	pause_Key_Held = gamepad_button_check(global.Player2Con, global.PauseButtonSpeed);
	pause_Key_Held = clamp(pause_Key_Held, 0, 1);
	
	select_Key = gamepad_button_check_pressed(global.Player2Con, global.SelectButtonSpeed);
	select_Key = clamp(select_Key, 0, 1);
	select_Key_Held = gamepad_button_check(global.Player2Con, global.SelectButtonSpeed);
	select_Key_Held = clamp(select_Key_Held, 0, 1);
	
}


//Player 2 Controls
function getCharacterControlsP3() {
	//Movement
	right_Key = gamepad_button_check(global.Player3Con, global.RightPadSpeed) or (gamepad_axis_value(global.Player3Con, gp_axislh) > global.ConDeadZone);
	right_Key = clamp(right_Key, 0, 1);
	right_Key_Once = gamepad_button_check_pressed(global.Player3Con, global.RightPadSpeed) or (gamepad_axis_value(global.Player3Con, gp_axislh) > global.ConDeadZone);
	right_Key_Once = clamp(right_Key_Once, 0, 1);
	

	left_Key = gamepad_button_check(global.Player3Con, global.LeftPadSpeed) or (gamepad_axis_value(global.Player3Con, gp_axislh) < -global.ConDeadZone);
	left_Key = clamp(left_Key, 0, 1);
	left_Key_Once = gamepad_button_check_pressed(global.Player3Con, global.LeftPadSpeed) or (gamepad_axis_value(global.Player3Con, gp_axislh) < -global.ConDeadZone);
	left_Key_Once = clamp(left_Key_Once, 0, 1);


	//Directional
	down_Key = gamepad_button_check(global.Player3Con, global.DownPadSpeed) or (gamepad_axis_value(global.Player3Con, gp_axislv) > global.ConDeadZone);
	down_Key = clamp(down_Key, 0, 1);
	down_Key_Once = gamepad_button_check_pressed(global.Player3Con, global.DownPadSpeed) or (gamepad_axis_value(global.Player3Con, gp_axislv) > global.ConDeadZone);
	down_Key_Once = clamp(down_Key_Once, 0, 1);
	

	up_Key = gamepad_button_check(global.Player3Con, global.UpPadSpeed) or (gamepad_axis_value(global.Player3Con, gp_axislv) < -global.ConDeadZone);
	up_Key = clamp(up_Key, 0, 1);
	up_Key_Once = gamepad_button_check_pressed(global.Player3Con, global.UpPadSpeed) or (gamepad_axis_value(global.Player3Con, gp_axislv) < -global.ConDeadZone);
	up_Key_Once = clamp(up_Key_Once, 0, 1);


	//Actions
	jump_Key = gamepad_button_check_pressed(global.Player3Con, global.JumpButtonSpeed);
	jump_Key = clamp(jump_Key, 0, 1);
	jump_Key_Held = gamepad_button_check(global.Player3Con, global.JumpButtonSpeed);
	jump_Key_Held = clamp(jump_Key_Held, 0, 1);
	
	action_Key = gamepad_button_check_pressed(global.Player3Con, global.ActionButtonSpeed);
	action_Key = clamp(action_Key, 0, 1);
	action_Key_Held = gamepad_button_check(global.Player3Con, global.ActionButtonSpeed);
	action_Key_Held = clamp(action_Key_Held, 0, 1);
	
	action1_Key = gamepad_button_check_pressed(global.Player3Con, global.Action1ButtonSpeed);
	action1_Key = clamp(action1_Key, 0, 1);
	action1_Key_Held = gamepad_button_check(global.Player3Con, global.Action1ButtonSpeed);
	action1_Key_Held = clamp(action1_Key_Held, 0, 1);

	action2_Key = gamepad_button_check_pressed(global.Player3Con, global.Action2ButtonSpeed);
	action2_Key = clamp(action2_Key, 0, 1);
	action2_Key_Held = gamepad_button_check(global.Player3Con, global.Action2ButtonSpeed);
	action2_Key_Held = clamp(action2_Key_Held, 0, 1);
	action2_Key_Released = gamepad_button_check_released(global.Player3Con, global.Action2ButtonSpeed);
	action2_Key_Released = clamp(action2_Key_Released, 0, 1);
	
	action3_Key = gamepad_button_check_pressed(global.Player3Con, global.Action3ButtonSpeed);
	action3_Key = clamp(action3_Key, 0, 1);
	action3_Key_Held = gamepad_button_check(global.Player3Con, global.Action3ButtonSpeed);
	action3_Key_Held = clamp(action3_Key_Held, 0, 1);
	
	action4_Key = gamepad_button_check_pressed(global.Player3Con, global.Action4ButtonSpeed);
	action4_Key = clamp(action4_Key, 0, 1);
	action4_Key_Held = gamepad_button_check(global.Player3Con, global.Action4ButtonSpeed);
	action4_Key_Held = clamp(action4_Key_Held, 0, 1);
	
	pause_Key = gamepad_button_check_pressed(global.Player3Con, global.PauseButtonSpeed);
	pause_Key = clamp(pause_Key, 0, 1);
	pause_Key_Held = gamepad_button_check(global.Player3Con, global.PauseButtonSpeed);
	pause_Key_Held = clamp(pause_Key_Held, 0, 1);
	
	select_Key = gamepad_button_check_pressed(global.Player3Con, global.SelectButtonSpeed);
	select_Key = clamp(select_Key, 0, 1);
	select_Key_Held = gamepad_button_check(global.Player3Con, global.SelectButtonSpeed);
	select_Key_Held = clamp(select_Key_Held, 0, 1);
	
}