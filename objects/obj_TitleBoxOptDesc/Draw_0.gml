draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 0.75);
draw_sprite_ext(spr_TextboxTrans, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);

with(obj_TitleCursor) {
	#region //Audio
		if place_meeting(x, y, obj_TitleBoxOptMaster) {
			other.descText = "Adjust overall game volume. \n(Down 10% every press.)"
		} else
		
		if place_meeting(x, y, obj_TitleBoxOptMusic) {
			other.descText = "Adjust BGM volume. \n(Down 10% every press.)"
		} else
		
		if place_meeting(x, y, obj_TitleBoxOptSFX) {
			other.descText = "Adjust sound effect volume. \n(Down 10% every press.)"
		} else
		
		if place_meeting(x, y, obj_TitleBoxOptText) {
			other.descText = "Adjust type-writer text volume. \n(Down 10% every press.)"
		} else
		
		if place_meeting(x, y, obj_TitleBoxOptAmbience) {
			other.descText = "Adjust ambiance volume. \n(Down 10% every press.)"
		} else
		
		if place_meeting(x, y, obj_TitleBoxOptPauseTheme) {
			other.descText = "Have a unique track play \nbased on the character \nyou're playing when \nyou pause the game."
		} else
	#endregion
	
	#region //Visual
		if place_meeting(x, y, obj_TitleBoxOptSimVFX) {
			other.descText = "Minimize or stop things that \nmight be eye-straining."
		} else
		
		if place_meeting(x, y, obj_TitleBoxOptParticles) {
			other.descText = "Have particles appear."
		} else 
		
		if place_meeting(x, y, obj_TitleBoxOptScreenShake) {
			other.descText = "Shake your screen \nduring certain events."
		} else 
		
		if place_meeting(x, y, obj_TitleBoxOptLanguage) {
			other.descText = "Change the game's language. \n(W.I.P.)"
		} else
	#endregion
	
	#region //Misc
		if place_meeting(x, y, obj_TitleBoxOptFullscreen) {
			other.descText = "Make the game display in \nyour monitor's resolution."
		} else
		
		if place_meeting(x, y, obj_TitleBoxOptSongTag) {
			other.descText = "Have a BGM track's name, \ncomposer, and length \nappear on the top-right \noccasionally."
		} else
		
		if place_meeting(x, y, obj_TitleBoxOptConRum) {
			other.descText = "Make your controller rumble \nduring certain events. \n(Controller only.)"
		} else
		
		if place_meeting(x, y, obj_TitleBoxOptConType) {
			other.descText = "Change visual controller \ninputs. \n(Controller only.)"
		} else
		
		if place_meeting(x, y, obj_TitleBoxOptExtCam) {
			other.descText = "Have the camera trail \nbehind when slow and \nmove farther ahead when \nfast. \n(Overworld/Speed Stages only.)"
		} else
		
		if place_meeting(x, y, obj_TitleBoxOptFPS) {
			other.descText = "Have the FPS and REAL FPS \nshow on the top-left."
		} else 
		
		if place_meeting(x, y, obj_TitleBoxOptBack) {
			other.descText = "Return to main menu & save \noptions."
		} else 
		
		if place_meeting(x, y, obj_TitleBoxOptDefault) {
			other.descText = "Reset all settings & delete \noptions save files."
		} else {
			other.descText = "";
		}
	#endregion
}

draw_text(x + 8, y + 4, string(descText));