getCharacterControls();

if jump_Key {
	if global.ResultsTimer > 3 {
		global.ResultsTimer = 3;
	}
}


if !instance_exists(obj_ResultsCard) {
	instance_destroy();
}

sprite_index = rankGraphic;

//Play SFX 'n' shit
if global.ResultsTimer == 1 {
	obj_SFXManager.omegaConfirm = true;
	visible = true;
	
	if !instance_exists(obj_MusicTag) {
		instance_create_depth(x, y, depth, obj_MusicTag);
	}
	
	save_Speed_Stage(global.saveFile);
}

if global.ResultsTimer == 1 && !instance_exists(obj_ResultsConfirm) {
	instance_create_depth(x, y, depth, obj_ResultsConfirm);
}

if global.ResultsTimer == 1 && !instance_exists(obj_ResultsTryAgain) {
	instance_create_depth(x, y, depth, obj_ResultsTryAgain);
}




//Play song based on rank && character
if global.ResultsTimer <= 2 && global.ResultsTimer > 0 {
	//Results Themes
	if global.Rank == 0 or global.Rank == 1 {
		set_song_ingame(global.PlayerSelection[global.PlayerChar][23][0], 0, 60);
	} else if global.Rank == 2 or global.Rank == 3 or global.Rank == 4 {
		set_song_ingame(global.PlayerSelection[global.PlayerChar][23][1], 0, 60);
	} else if global.Rank == 5 {
		set_song_ingame(global.PlayerSelection[global.PlayerChar][23][2], 0, 60);
	} else if global.Rank == 6 {
		set_song_ingame(global.PlayerSelection[global.PlayerChar][23][2], 0, 60);
	}
	
	if !instance_exists(obj_MusicTag) {
		instance_create_depth(x, y, depth, obj_MusicTag);
	}
}
