x = -40000;
depth = -1;

if instance_exists(obj_Player) {
	obj_Player.can_Move = true;
	obj_Player.prepare = true;
}

countdownTimer = 180;
boostFrames = 10;

created = false;

movedX = 320;
movedY = -250;