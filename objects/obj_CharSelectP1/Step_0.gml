getCharacterControls();

if !obj_CharSelectWhiteBall.playerConfirmed {
	scr_GetCharLives();
	_charCostume = global.PlayerCostume;
}

image_index = _charCostume;


if action_Key && !obj_CharSelectWhiteBall.playerConfirmed && global.CostumeNum != 1 && !global.PlayerSelection[global.SelectedPlayer][2] {
	if !global.ChooseCostume {
		global.ChooseCostume = true;
		obj_SFXManager.rushTrick = true;
	} else {
		if global.PlayerSelection[global.SelectedPlayer][4][global.SelectedCostume] {
			global.ChooseCostume = false;
			obj_SFXManager.rushTrickFinish = true;
		} else {
			obj_SFXManager.menuCancel = true;
		}
	}
}

if pTimer > 0 {
	pTimer -= 1;
}

if pTimer <= 0 {
	if pAlpha > 0 {
		pAlpha -= 0.01;
	}
}
