getCharacterControls();

input[eKey.LeftPressed] = left_Key;
input[eKey.RightPressed] = right_Key;
input[eKey.UpPressed] = up_Key;
input[eKey.DownPressed] = down_Key;

input[eKey.JumpPressed] = jump_Key_Held;
input[eKey.JumpHeld] = jump_Key_Held;

input[eKey.ActionPressed] = action_Key_Held;
input[eKey.ActionHeld] = action_Key_Held;

input[eKey.BoostPressed] = action1_Key_Held;
input[eKey.BoostHeld] = action1_Key_Held;

input[eKey.SwapPressed] = action3_Key_Held;

input[eKey.Special1Pressed] = action2_Key_Held;
input[eKey.Special1Held] = action2_Key_Held;

input[eKey.Special2Pressed] = action4_Key_Held;
input[eKey.Special2Held] = action4_Key_Held;


input[eKey.LeftReleased] = !left_Key;
input[eKey.RightReleased] = !right_Key;
input[eKey.UpReleased] = !up_Key;
input[eKey.DownReleased] = !down_Key;

input[eKey.JumpReleased] = !jump_Key_Held;
input[eKey.JumpPReleased] = !jump_Key;

input[eKey.ActionReleased] = !action_Key_Held;
input[eKey.ActionPReleased] = !action_Key;

input[eKey.BoostReleased] = !action1_Key_Held;
input[eKey.BoostPReleased] = !action1_Key;

input[eKey.Special1Released] = !action2_Key_Released;
input[eKey.Special1PReleased] = !action2_Key;

input[eKey.Special2Released] = !action4_Key_Held;
input[eKey.Special2PReleased] = !action2_Key;


//kRecord = keyboard_check_pressed(ord("Q"));
//kPlay = keyboard_check_pressed(ord("P"));