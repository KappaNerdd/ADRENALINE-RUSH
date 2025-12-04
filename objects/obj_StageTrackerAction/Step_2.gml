//HitLag
var _time = current_time;  
while current_time - _time < hitLag {  
	
}  

if hitLag > 0 {
	hitLag -= hitLag;
}

if global.ActionEnemy.attacking {
	global.ActionEnemy.depth = attackingDepth - 1;
	global.ActionPlayer.depth = attackingDepth;
} else if global.ActionPlayer.attacking {
	global.ActionPlayer.depth = attackingDepth - 1;
	global.ActionEnemy.depth = attackingDepth;
}