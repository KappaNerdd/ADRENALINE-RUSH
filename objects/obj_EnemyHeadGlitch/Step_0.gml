scr_EnemyStep();

var _nearPlayer = instance_nearest(x, y, obj_Player);

if distance_to_object(_nearPlayer) < 150 {
	//move_towards_point(_nearPlayer.x, _nearPlayer.y, 2);
	
	if _nearPlayer.x < x {
		image_xscale = -2;
	} else if _nearPlayer.x > x {
		image_xscale = 2;
	}
	
	image_speed = 2;
}
