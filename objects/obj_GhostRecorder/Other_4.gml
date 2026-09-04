if !instance_exists(obj_SonicRushIntroCard) && instance_exists(global.PlayerID) && ghostRecord {
	if lastSavedFrame != 0 {
		ghostRecordFrames = lastSavedFrame;
	}
}