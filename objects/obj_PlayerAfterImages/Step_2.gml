if copyPlayer != noone {
	if copyPlayer.speedBreak or copyPlayer.stomping or copyPlayer.fallVel {
		if !global.SimplifyVFX {
			visible = !visible;
		} else {
			visible = true;
		}
		
		x = copyPlayer.posX[copyRecord];
		y = copyPlayer.posY[copyRecord];
		
		sprite_index = copyPlayer.toRecordSprite[copyRecord];
		image_index = copyPlayer.toRecordImage[copyRecord];
		image_xscale = copyPlayer.toRecordXScale[copyRecord];
		image_yscale = copyPlayer.toRecordYScale[copyRecord];
		image_angle = copyPlayer.toRecordAngle[copyRecord];
	} else {
		visible = false;
	}
}