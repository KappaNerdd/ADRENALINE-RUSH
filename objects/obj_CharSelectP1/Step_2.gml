if obj_CharSelectChar.waitTimer <= 0 {	
	if global.PlayerSelection[global.SelectedPlayer][2] or !global.PlayerSelection[global.SelectedPlayer][4][global.SelectedCostume] {
		image_blend = c_black;
	} else {
		image_blend = c_white;
	}
}

