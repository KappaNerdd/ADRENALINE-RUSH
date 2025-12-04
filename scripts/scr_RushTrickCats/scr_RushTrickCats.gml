function scr_CreateRushCats(_cat = 0, _x = 0, _xspd = 0, _wait = 0) {
	with (instance_create_depth(-100000, 0, -1, obj_RushTrickCats)) {
		catSpr = _cat;
		newX = _x;
		xspd = _xspd;
		waitTimer = _wait;
	}
}


function scr_RushCatType(_type = 0) {
	switch(_type) {
		case 0:
			scr_CreateRushCats(0, 540, 0, 0);
			scr_CreateRushCats(1, 320, 0, 10);
			scr_CreateRushCats(2, 100, 0, 20);
		break;
		
		case 1:
			scr_CreateRushCats(0, 100, 0, 0);
			scr_CreateRushCats(1, 320, 0, 10);
			scr_CreateRushCats(2, 540, 0, 20);
		break;
		
		case 2:
			scr_CreateRushCats(0, 320, 0, 0);
			scr_CreateRushCats(1, 100, 5, 0);
			scr_CreateRushCats(2, 540, -5, 0);
		break;
		
		case 3:
			scr_CreateRushCats(0, 320, 0, 0);
			scr_CreateRushCats(1, 320, -5, 0);
			scr_CreateRushCats(2, 320, 5, 0);
		break;
	}
}