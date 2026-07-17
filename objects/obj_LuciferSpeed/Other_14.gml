/// @desc Stop Stomping 'n' Extra Shit
stomping = false;
glide = false;
afterGlide = false;
bursting = false;
bursted = false;

if audio_is_playing(snd_BurstGlide) {
	audio_stop_sound(snd_BurstGlide);
}