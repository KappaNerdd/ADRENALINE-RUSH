vel = 5;

back = false;
forth = true;

depth = -100;

mainX = x;

image_xscale = 4.50;
image_yscale = 20;

stop = false;

obj_SFXManager.UNDERTALERainbow = true;

set_song_ingame(mus_LostReason, 0, 0);

global.RespawnX = obj_Player.x;
global.RespawnY = obj_Player.y;

if instance_exists(obj_PowerOrb) {
	obj_PowerOrb.active = true;
}