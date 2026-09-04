alive = false;
yspd = 2;
sprayAlpha = 1;

if !global.Secrets[count] {
	global.Secrets[count] = true;
}

instance_create_depth(x, y, depth - 1, obj_JSRSecretText);

switch(count) {
	case 0:
		if instance_exists(obj_StageTrackerSpeed) {
			scr_RingsPlayer(50);
			obj_SFXManager.funkinFav = true;
		}
	break;
	
	case 1:
		scr_EnergyPlayer(150);
	break;
	
	case 2:
		scr_HealthPlayer(500000);
		scr_HealingEffect(global.PlayerID, true, c_lime);
	break;
	
	case 3:
		scr_BonusPoints(25000);
	break;
	
	case 4:
		if instance_exists(obj_StageTrackerSpeed) {
			scr_RingsPlayer(25);
		}
		
		scr_EnergyPlayer(75);
		
		scr_HealthPlayer(250000);
		scr_HealingEffect(global.PlayerID, true, c_lime);
		
		scr_BonusPoints(12500);
	break;
}