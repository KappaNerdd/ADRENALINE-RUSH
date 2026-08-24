active = false;

scr_ULTRAPARRY(180);
						
scr_ControllerRumble();
						
//Powers
if powerUp == 0 or powerUp == 1 or powerUp == 2 {
	scr_EnergyPlayer(powers[powerUp][0], giveCharPower);
		
	with (instance_create_depth(-1000000, 0, 0, obj_PowerUpHUD)) {
		powerUp = other.powerUp;
	}
} else if powerUp == 3 or powerUp == 4 or powerUp == 5 or powerUp == 6 {
	global.Rings += powers[powerUp][0];
	obj_SFXManager.funkinFav = true;
} else if powerUp == 7 {
	var _randomRing = random(round(5));
		
	obj_SFXManager.funkinFav = true;
	global.Rings += powers[powerUp][_randomRing];
}
	
if global.Particles {
	repeat(10) {
		instance_create_depth(x, y, depth, obj_PowerOrbPart);
	}
}
		
obj_SFXManager.itemBreak = true;