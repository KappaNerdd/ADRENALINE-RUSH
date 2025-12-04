//Player confirm
if instance_exists(obj_Player) {
	if place_meeting(x, y, obj_Player) {
		obj_Player.vel = 0;
		obj_Player.can_Move = false;
	}

	if place_meeting(x, y, obj_Player) && playerConfirmed == false && obj_Player.ground == true {
		playerConfirmed = true;
	}

}

if playerConfirmed == true {
	set_song_ingame(noone, 300, 0);
	
	if !instance_exists(obj_CutsceneHeadEnd) {
		instance_create_depth(x, y, depth, obj_CutsceneHeadEnd);
	}
	
	instance_destroy();
}