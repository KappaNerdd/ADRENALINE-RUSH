charDir = DIR.DOWN;

with(instance_create_depth(x, y, depth, global.DRParty[0].obj)) {
	global.DRPlayerID = id;
	scr_SetCamFollow(id);
	mainPlayer = true;
	sprite_index = baseSpr[other.charDir];
		
	if array_length(global.DRParty) > 1 {	
		followSize = 101;

		for(var f = followSize - 1; f >= 0; f--) {
			pos_x[f] = x;
			pos_y[f] = y;
			toRecordSprite[f] = other.charDir;
		}
	}
}

if array_length(global.DRParty) > 1 {
	for(var i = 1; i < array_length(global.DRParty); i++) {
		with(instance_create_depth(x, y, depth, global.DRParty[i].obj)) {
			mainPlayer = false;
			record = 20 * i;
			charDir = other.charDir;
			sprite_index = baseSpr[other.charDir];
			x = other.x;
			y = other.y;
		}
	}
}

instance_destroy();