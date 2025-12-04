getCharacterControls();

if obj_FreeplaySpeedStages.speedStageActive or obj_FreeplayActionStages.actionStageActive {
	if action_Key && !obj_FreeplayBlockSpeed.confirmed {
		if obj_FreeplaySpeedStages.speedStageActive {
			obj_FreeplaySpeedStages.speedStageActive = false;
		} else if obj_FreeplayActionStages.actionStageActive {
			obj_FreeplayActionStages.actionStageActive = false;
		}
		
		obj_SFXManager.menuPop = true;
	}
}

x = obj_FreeplayMenuParent.x + 102;