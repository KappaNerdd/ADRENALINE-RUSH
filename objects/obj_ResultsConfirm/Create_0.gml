x = camera_get_view_x(view_camera[0]) + 290;
y = camera_get_view_y(view_camera[0]) + 78;

depth = obj_ResultsCardWhiteTrans.depth + 1;

sprite_index = obj_CustomJumpKeySpeed.sprite_index;
image_index = obj_CustomJumpKeySpeed.image_index;

image_speed = 0;

image_xscale = 1;
image_yscale = 1;

image_angle = -52;

wait = 90;

waiting = false;


//Give extra lives depending on rank (Takin' a page outta Sonic Colors DS' book. (Another one of my favorite games since it's part of the "RUSH" series.))
if !global.Freeplay {

	if global.Rank == 6 {
		global.PlayerExtraLives += 3;
	} else if global.Rank == 5 {
		global.PlayerExtraLives += 2;
	} else if global.Rank == 4 {
		global.PlayerExtraLives += 1;
	}

}

if global.Rank == 4 or global.Rank == 3 or global.Rank == 2 {
	obj_SFXManager.crowdApplause = true;
} else if global.Rank == 1 or global.Rank == 0 {
	obj_SFXManager.crowdAww = true;
}