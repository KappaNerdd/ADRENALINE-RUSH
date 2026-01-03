if copyPlayer != noone {
	if copyPlayer.speedBreak or copyPlayer.stomping {
		image_alpha = 1;
		
		x = copyPlayer.posX[copyRecord];
		y = copyPlayer.posY[copyRecord];
		
		sprite_index = copyPlayer.toRecordSprite[copyRecord];
		image_index = copyPlayer.toRecordImage[copyRecord];
		image_xscale = copyPlayer.toRecordXScale[copyRecord];
		image_yscale = copyPlayer.toRecordYScale[copyRecord];
		image_angle = copyPlayer.toRecordAngle[copyRecord];
	} else {
		image_alpha = 0;
	}
}

visible = !visible;