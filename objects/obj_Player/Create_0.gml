drawAngle = 0;
vel = 0;
yspd = 0;
boostEnergy = 100;
full_Speed = 0;
rushMode = false;
ground = true;
jumping = false;
visXScale = 1;
face_Left = false;

if room != rm_Eggman {
	instance_change(global.PlayerSelection[global.PlayerChar][7][0], true);
	global.PlayerID = global.PlayerSelection[global.PlayerChar][7][0];
	scr_SetCamFollow(global.PlayerID);
} else {
	global.MIND = true;
	
	with(instance_create_depth(x, y, depth, obj_Kris)) {
		if global.PlayerChar == 1 {
			scr_SpriteDataKappaNormal();
		} else if global.PlayerChar == 2 {
			scr_SpriteDataLuciferNormal();
		} else if global.PlayerChar == 3 {
			leftFacer = true;
			scr_SpriteDataSarahNormal();
		} else if global.PlayerChar == 12 {
			scr_SpriteDataRushNormal();
		} else if global.PlayerChar == 14 {
			scr_SpriteDataIvyNormal();
		}
	}
	
	instance_destroy();
}