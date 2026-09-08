function scr_CreateRushCats(_cat = 0, _x = 0, _xspd = 0, _wait = 0) {
	with (instance_create_depth(-100000, 0, -1, obj_RushTrickCats)) {
		catSpr = _cat;
		newX = _x;
		xspd = _xspd;
		waitTimer = _wait;
	}
}


function scr_RushCatType() {
	var _mainNum = 540;
	
	switch(round(random(6))) {
		case 0:
			scr_CreateRushCats(0, 100, 0, 0);
			scr_CreateRushCats(1, 253, 0, 5);
			scr_CreateRushCats(2, 387, 0, 10);
			scr_CreateRushCats(3, 540, 0, 15);
		break;
		
		case 1:
			scr_CreateRushCats(0, 540, 0, 0);
			scr_CreateRushCats(1, 387, 0, 5);
			scr_CreateRushCats(2, 253, 0, 10);
			scr_CreateRushCats(3, 100, 0, 15);
		break;
		
		case 2:
			scr_CreateRushCats(0, 320, 1.25, 0);
			scr_CreateRushCats(1, 320, -3.25, 0);
			scr_CreateRushCats(2, 320, 3.25, 0);
			scr_CreateRushCats(3, 320, -1.25, 0);
		break;
		
		case 3:
			scr_CreateRushCats(0, 100, 3.25, 0);
			scr_CreateRushCats(1, 253, 1.25, 0);
			scr_CreateRushCats(2, 387, -1.25, 0);
			scr_CreateRushCats(3, 540, -3.25, 0);
		break;
		
		case 4:
			scr_CreateRushCats(0, 540, -2, 0);
			scr_CreateRushCats(1, 387, 2, 0);
			scr_CreateRushCats(2, 253, -2, 0);
			scr_CreateRushCats(3, 100, 2, 0);
		break;
		
		case 5:
			scr_CreateRushCats(0, 387, 0, 0);
			scr_CreateRushCats(1, 100, 5, 0);
			scr_CreateRushCats(2, 540, -5, 0);
			scr_CreateRushCats(3, 253, 0, 0);
		break;
		
		case 6:
			scr_CreateRushCats(0, 100, 2, 0);
			scr_CreateRushCats(1, 253, -2, 5);
			scr_CreateRushCats(2, 387, 2, 10);
			scr_CreateRushCats(3, 540, -2, 15);
		break;
	}
}