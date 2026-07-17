/// @desc Stop Any Extra Bullshit
airBoost = false;

glide = false;
afterGlide = false;
glideTimer = glideFrames;
grav = normalGrav;

if audio_is_playing(snd_BurstGlide) {
	audio_stop_sound(snd_BurstGlide);
}

bursted = false;
bursting = false;

dJumping = false;
sliding = false;

stomping = false;
stomped = false;

slowSkid = false;

wallJump = false;
afterWallJump = false;