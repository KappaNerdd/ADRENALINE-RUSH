function scr_EnergyPlayer(_amount = 10, _person = global.PlayerID) {
	if _person != "both" {
		if !_person.rushMode {
			if _person.boostEnergy < _person.maxBoostEnergy {
				_person.boostEnergy += _amount;
			} else {
				if _amount > 0 {
					_person.rushMode = true;
					obj_SFXManager.rushModeGain = true;
				} else {
					_person.boostEnergy += _amount;
				}
			}
		} else {
			if _amount >= 0 {
				_person.rushModeTimer = _person.rushModeFrames;
			} else {
				_person.rushModeTimer = 0;
				_person.boostEnergy = 200;
			}
		}
	} else {
		if !global.PlayerID.rushMode {
			if global.PlayerID.boostEnergy < global.PlayerID.maxBoostEnergy {
				global.PlayerID.boostEnergy += _amount;
			} else {
				if _amount > 0 {
					global.PlayerID.rushMode = true;
					obj_SFXManager.rushModeGain = true;
				} else {
					global.PlayerID.boostEnergy += _amount;
				}
			}
		} else {
			if _amount >= 0 {
				global.PlayerID.rushModeTimer = global.PlayerID.rushModeFrames;
			} else {
				global.PlayerID.rushModeTimer = 0;
				global.PlayerID.boostEnergy = 200;
			}
		}
		
		if global.PartnerID != noone {
			if !global.PartnerID.rushMode {
				if global.PartnerID.boostEnergy < global.PartnerID.maxBoostEnergy {
					global.PartnerID.boostEnergy += _amount;
				} else {
					if _amount > 0 {
						global.PartnerID.rushMode = true;
						obj_SFXManager.rushModeGain = true;
					} else {
						global.PartnerID.boostEnergy += _amount;
					}
				}
			} else {
				if _amount >= 0 {
					global.PartnerID.rushModeTimer = global.PartnerID.rushModeFrames;
				} else {
					global.PartnerID.rushModeTimer = 0;
					global.PartnerID.boostEnergy = 200;
				}
			}
		}
	}
}

function scr_SetEnergyPlayer(_amount = 100, _person = global.PlayerID) {
	if _person != "both" {
		if !_person.rushMode {
			_person.boostEnergy = _amount;
		} else {
			if _amount >= 0 {
				_person.rushModeTimer = _person.rushModeFrames;
			} else {
				_person.rushModeTimer = 0;
				_person.boostEnergy = 200;
			}
		}
	} else {
		if !global.PlayerID.rushMode {
			global.PlayerID.boostEnergy = _amount;
		} else {
			if _amount >= 0 {
				global.PlayerID.rushModeTimer = global.PlayerID.rushModeFrames;
			} else {
				global.PlayerID.rushModeTimer = 0;
				global.PlayerID.boostEnergy = 200;
			}
		}
		
		if global.PartnerID != noone {
			if !global.PartnerID.rushMode {
				global.PartnerID.boostEnergy = _amount;
			} else {
				if _amount >= 0 {
					global.PartnerID.rushModeTimer = global.PartnerID.rushModeFrames;
				} else {
					global.PartnerID.rushModeTimer = 0;
					global.PartnerID.boostEnergy = 200;
				}
			}
		}
	}
}