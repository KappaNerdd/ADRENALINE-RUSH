getCharacterControls();

input[eKey.LeftPressed] = left_Key;
input[eKey.RightPressed] = right_Key;
input[eKey.UpPressed] = up_Key;
input[eKey.DownPressed] = down_Key;
input[eKey.LeftReleased] = !left_Key;
input[eKey.RightReleased] = !right_Key;
input[eKey.UpReleased] = !up_Key;
input[eKey.DownReleased] = !down_Key;

input[eKey.JumpPressed] = jump_Key;
input[eKey.JumpHeld] = jump_Key_Held;
input[eKey.JumpReleased] = jump_Key_Released;

input[eKey.ActionPressed] = action_Key;
input[eKey.ActionHeld] = action_Key_Held;
input[eKey.ActionReleased] = action_Key_Released;

input[eKey.BoostPressed] = action1_Key;
input[eKey.BoostHeld] = action1_Key_Held;
input[eKey.BoostReleased] = action1_Key_Released;

input[eKey.SwapPressed] = action3_Key_Held;

input[eKey.Special1Pressed] = action2_Key;
input[eKey.Special1Held] = action2_Key_Held;
input[eKey.Special1Released] = keyboard_check_released(global.Action2KeySpeed) or gamepad_button_check_released(global.Player1Con, global.Action2ButtonSpeed);

input[eKey.Special2Pressed] = action4_Key;

//kRecord = keyboard_check_pressed(ord("Q"));
//kPlay = keyboard_check_pressed(ord("P"));
