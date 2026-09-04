charDir = DIR.DOWN;

//Create Player
with(instance_create_depth(x, y, depth, global.DRParty[0].obj)) {
	global.DRPlayerID = id;
	global.DRBattle = false;
	scr_SetCamFollow(id);
	mainPlayer = true;
	sprite_index = baseSpr[other.charDir];
	
	alarm_set(0, 2);
		
	if array_length(global.DRParty) > 1 {	
		followSize = 101;

		for(var f = followSize - 1; f >= 0; f--) {
			pos_x[f] = x;
			pos_y[f] = y;
			toRecordSprite[f] = other.charDir;
		}
	}
}

//Create Partners
if array_length(global.DRParty) > 1 {
	for(var i = 1; i < array_length(global.DRParty); i++) {
		with(instance_create_depth(x, y, depth, global.DRParty[i].obj)) {
			mainPlayer = false;
			record = 20 * i;
			charDir = other.charDir;
			sprite_index = baseSpr[other.charDir];
			x = other.x;
			y = other.y;
			alarm_set(0, 2 + i);
		}
	}
}

//Get rid of old Player & Partners' IDs
array_delete(global.DRPartyReal, 0, array_length(global.DRPartyReal));

instance_destroy();