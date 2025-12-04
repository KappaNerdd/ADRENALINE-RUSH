getCharacterControls();

if obj_TitleExc.characters {
	y = lerp(y, 40, 0.25);
	characters = true;
} else {
	y = lerp(y, 440, 0.25);
	characters = false;
}

if action_Key && obj_TitleExc.characters {
	if !obj_SAGE25CharBio.charBio {
		obj_TitleExc.characters = false;
		obj_SFXManager.funkinFav = true;
	} else {
		obj_SAGE25CharBio.charBio = false;
		obj_SFXManager.funkinFav = true;
	}
}

with(obj_SAGE25ActChar) {
	y = other.y + 53;
}