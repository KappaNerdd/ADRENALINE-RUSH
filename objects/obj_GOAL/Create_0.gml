set_song_ingame(noone, 60, 0);
obj_SFXManager.funkinCheckpoint = true;

goal = false;
goalTimer = 120;

if global.PlayerChar == 0 or global.MIND {
	sprite_index = spr_GOALHead;
} else {
	sprite_index = spr_GOALNorm;
}

movedX = 1000;