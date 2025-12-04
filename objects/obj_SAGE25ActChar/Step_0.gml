getCharacterControls();

if place_meeting(x, y, obj_TitleCursor) && !obj_SAGE25CharBio.charBio {
	obj_SAGE2025Chars.sprite_index = global.PlayerSelection[char][6][0];
	obj_SAGE2025Chars.char = char;
	
	if global.speedStageData[0].complete && global.speedStageData[1].complete && global.speedStageData[2].complete && global.speedStageData[3].complete && global.speedStageData[5].complete && global.speedStageData[8].complete {
		image_blend = c_white;
		
		if jump_Key {
			obj_SFXManager.menuPop = true;
			set_song_ingame(global.PlayerSelection[char][20], 60, 60);
			instance_create_depth(x, y, depth, obj_MusicTag);
			
			obj_SAGE25CharBio.charBio = true;
			obj_SAGE25CharBio.bio = charBio;
			obj_SAGE25CharBio.bioX = charBioX;
			obj_SAGE25CharBio.image_xscale = charBioXScale;
		}
	} else {
		if jump_Key {
			obj_SFXManager.menuCancel = true;
		}
	}
} else {
	if global.speedStageData[0].complete && global.speedStageData[1].complete && global.speedStageData[2].complete && global.speedStageData[3].complete && global.speedStageData[5].complete && global.speedStageData[8].complete {
		image_blend = c_grey;
	}
}

sprite_index = global.PlayerSelection[char][9][0];
