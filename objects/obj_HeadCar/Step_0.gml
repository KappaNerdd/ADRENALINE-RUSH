if place_meeting(x, y, obj_HeadArrowBomb) {
	alarm_set(0, 5);
	
	if !instance_exists(obj_HeadCutsceneExplosion) {
		instance_create_depth(x, y, depth, obj_HeadCutsceneExplosion);
		obj_SFXManager.UNDERTALEBombSplosion = true;
	}
}