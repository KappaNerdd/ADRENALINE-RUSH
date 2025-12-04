if soundHit {
	if soundTimer > 0 {
		soundTimer -= 1;
	}
	
	if soundTimer <= 0 {
		soundHit = false;
		soundTimer = soundFrames;
	}
}

if omega {
	if global.MIND or global.PlayerChar == 0 {
		sprite_index = spr_BoostPadOmegaHead;
	} else {
		sprite_index = spr_BoostPadOmega;
	}
} else {
	if global.MIND or global.PlayerChar == 0 {
		sprite_index = spr_BoostPadNormalHead;
	} else {
		sprite_index = spr_BoostPadNormal;
	}
}