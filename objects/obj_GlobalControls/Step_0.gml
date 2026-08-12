#region //Menu & Speed
	if is_string(global.LeftKeySpeed) {
		global.LeftKeySpeed = ord(global.LeftKeySpeed)
	}

	if is_string(global.RightKeySpeed) {
		global.RightKeySpeed = ord(global.RightKeySpeed)
	}

	if is_string(global.UpKeySpeed) {
		global.UpKeySpeed = ord(global.UpKeySpeed)
	}

	if is_string(global.DownKeySpeed) {
		global.DownKeySpeed = ord(global.DownKeySpeed)
	}

	if is_string(global.JumpKeySpeed) {
		global.JumpKeySpeed = ord(global.JumpKeySpeed)
	}

	if is_string(global.ActionKeySpeed) {
		global.ActionKeySpeed = ord(global.ActionKeySpeed)
	}

	if is_string(global.Action1KeySpeed) {
		global.Action1KeySpeed = ord(global.Action1KeySpeed)
	}

	if is_string(global.Action2KeySpeed) {
		global.Action2KeySpeed = ord(global.Action2KeySpeed)
	}

	if is_string(global.Action3KeySpeed) {
		global.Action3KeySpeed = ord(global.Action3KeySpeed)
	}

	if is_string(global.Action4KeySpeed) {
		global.Action4KeySpeed = ord(global.Action4KeySpeed)
	}

	if is_string(global.PauseKeySpeed) {
		global.PauseKeySpeed = ord(global.PauseKeySpeed)
	}

	if is_string(global.SelectKeySpeed) {
		global.SelectKeySpeed = ord(global.SelectKeySpeed);
	}
#endregion

#region //Action
	if is_string(global.LeftKeyAction) {
		global.LeftKeyAction = ord(global.LeftKeyAction);
	}
	
	if is_string(global.RightKeyAction) {
		global.RightKeyAction = ord(global.RightKeyAction);
	}
	
	if is_string(global.UpKeyAction) {
		global.UpKeyAction = ord(global.UpKeyAction);
	}
	
	if is_string(global.DownKeyAction) {
		global.DownKeyAction = ord(global.DownKeyAction);
	}
	
	if is_string(global.LightKeyAction) {
		global.LightKeyAction = ord(global.LightKeyAction);
	}
	
	if is_string(global.MediumKeyAction) {
		global.MediumKeyAction = ord(global.MediumKeyAction);
	}
	
	if is_string(global.HeavyKeyAction) {
		global.HeavyKeyAction = ord(global.HeavyKeyAction);
	}
	
	if is_string(global.SpecialKeyAction) {
		global.SpecialKeyAction = ord(global.SpecialKeyAction);
	}
	
	if is_string(global.DashKeyAction) {
		global.DashKeyAction = ord(global.DashKeyAction);
	}
	
	if is_string(global.SuperDashKeyAction) {
		global.SuperDashKeyAction = ord(global.SuperDashKeyAction);
	}
	
	if is_string(global.ParryKeyAction) {
		global.ParryKeyAction = ord(global.ParryKeyAction);
	}
	
	if is_string(global.ChargeKeyAction) {
		global.ChargeKeyAction = ord(global.ChargeKeyAction);
	}
#endregion


//Sprite Checks
if global.ConSpr != obj_CustomJumpKeySpeed.sprite_index {
	global.ConSpr = obj_CustomJumpKeySpeed.sprite_index;
}

if global.ConS_L != obj_CustomLeftKeySpeed.image_index {
	global.ConS_L = obj_CustomLeftKeySpeed.image_index;
}

if global.ConS_R != obj_CustomRightKeySpeed.image_index {
	global.ConS_R = obj_CustomRightKeySpeed.image_index;
}
	
if global.ConS_U != obj_CustomUpKeySpeed.image_index {
	global.ConS_U = obj_CustomUpKeySpeed.image_index;
}
	
if global.ConS_D != obj_CustomDownKeySpeed.image_index {
	global.ConS_D = obj_CustomDownKeySpeed.image_index;
}


if global.ConS_J != obj_CustomJumpKeySpeed.image_index {
	global.ConS_J = obj_CustomJumpKeySpeed.image_index;
}

if global.ConS_A1 != obj_CustomAct1KeySpeed.image_index {	
	global.ConS_A1 = obj_CustomAct1KeySpeed.image_index;
}

if global.ConS_B != obj_CustomAct2KeySpeed.image_index {
	global.ConS_B = obj_CustomAct2KeySpeed.image_index;
}

if global.ConS_SW != obj_CustomAct4KeySpeed.image_index {
	global.ConS_SW = obj_CustomAct4KeySpeed.image_index;
}


if global.ConS_SP1 != obj_CustomAct3KeySpeed.image_index {
	global.ConS_SP1 = obj_CustomAct3KeySpeed.image_index;
}

if global.ConS_SP2 != obj_CustomAct5KeySpeed.image_index {
	global.ConS_SP2 = obj_CustomAct5KeySpeed.image_index;
}


if global.ConS_ST != obj_CustomPauseKeySpeed.image_index {
	global.ConS_ST = obj_CustomPauseKeySpeed.image_index;
}

if global.ConS_SE != obj_CustomSelectKeySpeed.image_index {
	global.ConS_SE = obj_CustomSelectKeySpeed.image_index;
}

