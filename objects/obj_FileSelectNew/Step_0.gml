getCharacterControls();

if !fileChosen {
	#region //Hover
		var _fileThing = global.FileLimit - 1;
		fileMove = lerp(fileMove, -120 * fileChoice, 0.1);
	
		if up_Key or down_Key or left_Key or right_Key {
			chooseTimer--;
		} else {
			chooseTimer = 1;
		}
		
		if chooseTimer <= 0 {
			chooseTimer = chooseFrames;
			obj_SFXManager.homingLockOn = true;
			
			if up_Key or left_Key {
				if fileChoice > 0 {
					fileChoice--;
				} else {
					fileChoice = _fileThing;
				}
			}
			
			if down_Key or right_Key {
				if fileChoice < _fileThing {
					fileChoice++;
				} else {
					fileChoice = 0;
				}
			}
		}
	#endregion
} else {
	
}