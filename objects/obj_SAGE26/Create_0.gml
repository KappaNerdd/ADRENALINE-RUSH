changeSpd = 1.5;

moveX = 0;
moveY = 0;

changeScale = 0;
changeAlpha = 1;

audio_play_sound(snd_SAGE26Jingle, 8, false, global.MUSIC_VOL * global.MASTER_VOL);

leaveTimer = 60 * 7;
load_Speed_Stage(0);

shineX = -200;

if global.Particles {
	repeat(30) {
		instance_create_depth(768 / 2, 432 / 2, depth - 2, obj_HealingStars);
	}
}