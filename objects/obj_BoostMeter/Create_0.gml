instance_create_depth(x, y - 1000000, depth, obj_TrickScore);

image_alpha = 1;

xMove = -100;

boostColor = c_white;

charColor = c_white;
rushColor = c_white;
rushTimer = 4;
rushCol = false;

personalBoost = obj_Player.boostEnergy;

upBoost = false;
downBoost = false;

newX = 0;
newY = 0;

emblemSpeed = 0;
emblemSpeedRush = 0;

scr_GetCharBoostMeter();
scr_GetCharBoostIcon();
scr_GetCharRushBoostIcon();

boostSprite = _charCheck2;
boostEmblem = _charCheck;
rushEmblem = _charCheck3;

#region //Boost Bar Bullshit
	#region //Boost Bar 1
		_bar1SizeA = 2;
		_bar1SizeB = 2;
		_bar1SizeC = 2;
	#endregion
	
	#region //Boost Bar 2
		_bar2SizeA = 2;
		_bar2SizeB = 2;
		_bar2SizeC = 2;
	#endregion
	
	#region //Boost Bar 3
		_bar3SizeA = 2;
		_bar3SizeB = 2;
		_bar3SizeC = 2;
	#endregion
	
	#region //Boost Bar 4
		_bar4SizeA = 2;
		_bar4SizeB = 2;
		_bar4SizeC = 2;
	#endregion
	
	#region //Boost Bar 5
		_bar5SizeA = 2;
		_bar5SizeB = 2;
		_bar5SizeC = 2;
	#endregion
	
	#region //Boost Bar 6
		_bar6SizeA = 2;
		_bar6SizeB = 2;
		_bar6SizeC = 2;
	#endregion
	
	#region //Boost Bar 7
		_bar7SizeA = 2;
		_bar7SizeB = 2;
		_bar7SizeC = 2;
	#endregion
	
	#region //Boost Bar 8
		_bar8SizeA = 2;
		_bar8SizeB = 2;
		_bar8SizeC = 2;
	#endregion
	
	#region //Boost Bar 9
		_bar9SizeA = 2;
		_bar9SizeB = 2;
		_bar9SizeC = 2;
	#endregion
	
	#region //Boost Bar 10
		_bar10SizeA = 2;
		_bar10SizeB = 2;
		_bar10SizeC = 2;
	#endregion
	
	#region //Boost Bar 11
		_bar11SizeA = 2;
		_bar11SizeB = 2;
		_bar11SizeC = 2;
	#endregion
	
	#region //Boost Bar 12
		_bar12SizeA = 2;
		_bar12SizeB = 2;
		_bar12SizeC = 2;
	#endregion
	
	#region //Boost Bar 13
		_bar13SizeA = 2;
		_bar13SizeB = 2;
		_bar13SizeC = 2;
	#endregion
	
	#region //Boost Bar 14
		_bar14SizeA = 2;
		_bar14SizeB = 2;
		_bar14SizeC = 2;
	#endregion
	
	#region //Boost Bar 15
		_bar15SizeA = 2;
		_bar15SizeB = 2;
		_bar15SizeC = 2;
	#endregion
	
	#region //Boost Bar 16
		_bar16SizeA = 2;
		_bar16SizeB = 2;
		_bar16SizeC = 2;
	#endregion
	
	#region //Boost Bar 17
		_bar17SizeA = 2;
		_bar17SizeB = 2;
		_bar17SizeC = 2;
	#endregion
	
	#region //Boost Bar 18
		_bar18SizeA = 2;
		_bar18SizeB = 2;
		_bar18SizeC = 2;
	#endregion
	
	#region //Boost Bar 19
		_bar19SizeA = 2;
		_bar19SizeB = 2;
		_bar19SizeC = 2;
	#endregion
	
	#region //Boost Bar 20
		_bar20SizeA = 2;
		_bar20SizeB = 2;
		_bar20SizeC = 2;
	#endregion
#endregion


