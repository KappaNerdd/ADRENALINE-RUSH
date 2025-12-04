getCharacterControls();

var _modCount = array_length(global.modsLoader);
var _mod = global.modsLoader[selectedIndex];

if _modCount > 0 {
	//Hover over mods
	if down_Key_Once {
	    selectedIndex = (selectedIndex + 1) mod _modCount;
		obj_SFXManager.homingLockOn = true;
	}

	if down_Key {
		if holdDownTimer > 0 {
			holdDownTimer -= 1;
		}
	
		if holdDownTimer <= 0 {
			if scrollTimer > 0 {
				scrollTimer -= 1;
			}
		}
	} else {
		holdDownTimer = holdFrames;
	}


	if up_Key_Once {
	    selectedIndex = (selectedIndex - 1 + _modCount) mod _modCount;
		obj_SFXManager.homingLockOn = true;
	}

	if up_Key {
		if holdUpTimer > 0 {
			holdUpTimer -= 1;
		}
	
		if holdUpTimer <= 0 {
			if scrollTimer > 0 {
				scrollTimer -= 1;
			}
		}
	} else {
		holdUpTimer = holdFrames;
	}

	if !up_Key && !down_Key {
		scrollTimer = 5;
	}


	if scrollTimer <= 0 {
		scrollTimer = 5;
		obj_SFXManager.homingLockOn = true;
	
		if down_Key {
			selectedIndex = (selectedIndex + 1) mod _modCount;
		}
	
		if up_Key {
			selectedIndex = (selectedIndex - 1 + _modCount) mod _modCount;
		}
	}

	//Activate/Deactivate
	if jump_Key or pause_Key {
		obj_SFXManager.menuPop = true;
	
	    var _found = -1;
	
	    for (var i = 0; i < array_length(global.activeMods); i++) {
	        if (global.activeMods[i] == _mod) {
	            _found = i;
	            break;
	        }
	    }

	    if _found == -1 {
	        array_push(global.activeMods, _mod); //Activate
	    } else {
	        array_delete(global.activeMods, _found, 1); //Deactivate
	    }
	}
	
	//Refresh Mods
	if action3_Key {
		obj_SFXManager.funkinFav = true;
		scr_LoadMods();
	}

	//Change Offset
	var _visibleStart = scrollOffset div scrollSpeed;
	var _visibleEnd = (scrollOffset + room_height - scrollSpeed) div scrollSpeed;

	if selectedIndex < _visibleStart {
	    scrollOffset = selectedIndex * scrollSpeed;
	}

	if selectedIndex > _visibleEnd {
	    scrollOffset = (selectedIndex - ((room_height - scrollSpeed) div scrollSpeed)) * scrollSpeed;
	}

	var _totalHeight = array_length(global.modsLoader) * scrollSpeed;
	var _maxHeight = max(0, _totalHeight - room_height + scrollSpeed);
	scrollOffset = clamp(scrollOffset, 0, _maxHeight);
} else {
	if jump_Key or pause_Key {
		obj_SFXManager.lowTierGod = true;
	}
}