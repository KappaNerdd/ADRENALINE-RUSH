if !instance_exists(obj_GameOverTrans) {
	if visible == false {
		obj_SFXManager.ULTRAKILL_Landing = true;
		visible = true;
	}
	
	if instance_exists(obj_GameOverContinueDead) {
		obj_GameOverContinueDead.visible = true;
	}
}