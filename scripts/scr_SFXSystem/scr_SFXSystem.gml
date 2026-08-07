function scr_PlaySound(_snd, _loop = false, _pitch = 1) {
	audio_play_sound(_snd, 8, _loop, global.MASTER_VOL * global.SFX_VOL, 0, _pitch);
}