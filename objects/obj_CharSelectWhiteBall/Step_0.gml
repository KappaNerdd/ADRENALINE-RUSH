if playerConfirmed && !partnerConfirmed {
	if gamepad_is_connected(global.Player2Con) {
		getCharacterControlsP2();
	} else {
		getCharacterControls();
	}
} else if playerConfirmed && partnerConfirmed {
	if gamepad_is_connected(global.Player3Con) {
		getCharacterControlsP3();
	} else {
		getCharacterControls();
	}
} else {
	getCharacterControls();
}


scr_ShiftRGB();

image_blend = global.fullRGB;

if image_alpha < 1 {
	image_alpha += 0.025;
}

if (jump_Key or pause_Key) && !playerConfirmed && !global.ChooseCostume && !instance_exists(obj_CharSelectGirlyChoose) {
	if !global.PlayerSelection[global.SelectedPlayer][2] {
		if !global.PlayerSelection[global.SelectedPlayer][3] {
			playerConfirmed = true;
			partnerConfirmed = true;
			partner2Confirmed = true;
			obj_SFXManager.funkinCheckpoint = true;
			set_song_ingame(noone, 120, 0);
		} else {
			if !instance_exists(obj_CharSelectGirlyChoose) {
				instance_create_depth(x, y, depth, obj_CharSelectGirlyChoose);
			}
		}
	} else {
		obj_SFXManager.menuCancel = true;
	}
	
	if !global.PlayerSelection[global.PlayerChar][3] {
		global.Girly = global.PlayerSelection[global.PlayerChar][0][1];
	}
}

if playerConfirmed {
	if playerConfirmedTimer > 0 {
		playerConfirmedTimer -= 1;
	}
}

if playerConfirmedTimer <= 0 {
	if (jump_Key or pause_Key) && !partnerConfirmed {
		if global.PartnerChar != global.PlayerChar && global.PartnerChar != global.LockedChar[global.SelectedPlayer] {
			partnerConfirmed = true;
			obj_SFXManager.funkinCheckpoint = true;
		} else {
			obj_SFXManager.menuCancel = true;
		}
	}
	
	if action_Key && !partnerConfirmed {
		obj_SFXManager.funkinFav = true;
		playerConfirmed = false;
		global.PartnerChar = -1;
	}
}

if partnerConfirmed {
	if partnerConfirmedTimer > 0 {
		partnerConfirmedTimer -= 1;
	}
}

if partnerConfirmedTimer <= 0 {
	if (jump_Key or pause_Key) && !partner2Confirmed {
		if global.Partner2Char != global.PlayerChar && global.Partner2Char != global.PartnerChar && global.Partner2Char != global.LockedChar[global.SelectedPlayer] {
			partner2Confirmed = true;
			obj_SFXManager.funkinCheckpoint = true;
			set_song_ingame(noone, 120, 0);
		} else {
			obj_SFXManager.menuCancel = true;
		}
	}
	
	if action_Key && !partner2Confirmed {
		obj_SFXManager.funkinFav = true;
		partnerConfirmed = false;
		global.Partner2Char = -1;
	}
}

if partner2Confirmed == true {
	if partner2ConfirmedTimer > 0 {
		partner2ConfirmedTimer -= 1;
	}
	
	if partner2ConfirmedTimer <= 0 {
		if !instance_exists(obj_RoomTransitionSEGAMenu) {
			with(instance_create_depth(x, y, -100000000, obj_RoomTransitionSEGAMenu)) {
				target_rm = rm_Freeplay;
			}
		}
	}
}


if !playerConfirmed {
	global.PlayerChar = global.SelectedPlayer;
	global.PlayerCostume = global.SelectedCostume;
	playerConfirmedTimer = playerConfirmedFrames;
} else if playerConfirmed && !partnerConfirmed {
	global.PartnerChar = global.SelectedPlayer;
	partnerConfirmedTimer = partnerConfirmedFrames;
} else if playerConfirmed && partnerConfirmed && !partner2Confirmed {
	global.Partner2Char = global.SelectedPlayer;
	partner2ConfirmedTimer = partner2ConfirmedFrames;
}


//Bounce on-beat
if global.RealBPM > 0 {
	global.RealBPM -= 1 / 60;
}



if global.RealBPM <= 0 {
	if !global.SimplifyVFX {
		image_xscale = 1.5;
		image_yscale = 1.5;
	}
	
	global.RealBPM = global.ConvertedBPM;
}

if image_xscale > 1 {
	image_xscale -= 0.05;
}

if image_yscale > 1 {
	image_yscale -= 0.05;
}