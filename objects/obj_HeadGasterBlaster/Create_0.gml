//Inherit the parent event
event_inherited();

canHurt = false;
canBoost = false;
hori = false;
verti = false;

fakeXScale = 0;
fakeYScale = 0;

damage = 200000;

waitTimer = 10;
sustain = 10;
fire = false;
back = false;

beepTimer = 10;

if global.SimplifyVFX {
	image_speed = 0;
}

image_alpha = 0;

if instance_exists(obj_Player) {
	depth = obj_Player.depth - 5;
}