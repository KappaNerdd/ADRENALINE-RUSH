if waitTimer > 0 {
	waitTimer -= 1;
}

if waitTimer <= 0 {
	if !waitDone {
		waitDone = true;
		obj_SFXManager.funkinCheckpoint = true;
		visible = true;
	}
}