if place_meeting(x, y, obj_CutSunriseSukiVan) && yspd > 0 {
	with(obj_CutSunriseSukiVan) {
		carLoop = spr_SukiMinivanChar;
		carShine = spr_SukiMinivanCharShine;
		sprite_index = spr_SukiMinivanChar;
	}
	
	obj_SFXManager.ULTRAKILL_Landing = true
	
	instance_destroy();
	instance_destroy(obj_CutSunriseSarah);
	instance_destroy(obj_CutSunriseLone);
}


yspd += grav;


x += xspd;
y += yspd;
