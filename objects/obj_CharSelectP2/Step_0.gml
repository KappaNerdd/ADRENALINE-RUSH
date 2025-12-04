if obj_CharSelectWhiteBall.playerConfirmed && !obj_CharSelectWhiteBall.partnerConfirmed {
	_charCheck = global.PartnerChar;
	
	scr_GetCharLivesLocal();
	
	sprite_index = _liveSprite;
}


if pTimer > 0 {
	pTimer -= 1;
}

if pTimer <= 0 {
	if pAlpha > 0 {
		pAlpha -= 0.01;
	}
}