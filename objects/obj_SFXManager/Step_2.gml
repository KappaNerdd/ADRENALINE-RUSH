//Get Volume
var _sfxVol = global.MASTER_VOL * global.SFX_VOL;

///-----General-----///

//Clench
if clench == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_Clench, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	clench = false;
}

//Balloon Pop
if balloonPop == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_BalloonPop, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	balloonPop = false;
}

//Spike Hurt
if spikeHurt == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_PlayerHurtSpikes, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	spikeHurt = false;
}

//Bump
if bump == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_Bump, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	bump = false;
}

//Water Spout
if waterSpout == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_WaterSpout, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	waterSpout = false;
}


//Rush Ring Spin Loop
if rushRingLoop == true && !audio_is_playing(rushRingLoopInst) {
	rushRingLoopInst = audio_play_sound(snd_RushRingLoop, 8, true);
	audio_sound_gain(rushRingLoopInst, _sfxVol, 0);
}

if rushRingLoop == false && audio_is_playing(rushRingLoopInst) {
	audio_stop_sound(rushRingLoopInst);
}

rushRingLoop = false;


//Rush Ring Slow
if rushRingSlow == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_RushRingSlow, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	rushRingSlow = false;
}

//Rush Ring Finish
if rushRingFinish == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_RushRingFinish, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	rushRingFinish = false;
}

//Rush Char Select
if rushCharSelect == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_RushCharSelect, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	rushCharSelect = false;
}


///-----Rush Tricks-----///

//Sonic Rush Trick
if sonicRushTrick {
	
	//Play Sound
	var _snd = audio_play_sound(snd_RushSonicTrick, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	sonicRushTrick = false;
}

//Sonic Rush Dir Trick
if sonicRushDirTrick {
	
	//Play Sound
	var _snd = audio_play_sound(snd_RushSonicDirTrick, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	sonicRushDirTrick = false;
}

//Blaze Rush Trick
if blazeRushTrick {
	
	//Play Sound
	var _snd = audio_play_sound(snd_RushBlazeTrick, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	blazeRushTrick = false;
}

//Blaze Rush Dir Trick
if blazeRushDirTrick {
	
	//Play Sound
	var _snd = audio_play_sound(snd_RushBlazeDirTrick, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	blazeRushDirTrick = false;
}

//Crowd Fail
if crowdFail {
	
	//Play Sound
	var _snd = audio_play_sound(snd_RushCrowdFail, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	crowdFail = false;
}

//Crowd
if crowd {
	
	//Play Sound
	var _snd = audio_play_sound(snd_RushCrowd1, 8, false);
	var _randomNum = random(ceil(2));
	
	if _randomNum == 0 {
		_snd = audio_play_sound(snd_RushCrowd1, 8, false);
	} else if _randomNum == 1 {
		_snd = audio_play_sound(snd_RushCrowd2, 8, false);
	} else if _randomNum == 2 {
		_snd = audio_play_sound(snd_RushCrowd3, 8, false);
	}
	
	audio_sound_gain(_snd, _sfxVol, 0);
	
	crowd = false;
}

//Crowd Complete
if crowdComplete {
	
	//Play Sound
	var _snd = audio_play_sound(snd_RushCrowd3, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	crowdComplete = false;
}


///-----Animals-----///

//Cat Meow
if catMeow == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_CatMeow, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	catMeow = false;
}


///-----More Player Shit-----///

//Player Hurt
if playerHurt == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_PlayerHurt, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	playerHurt = false;
}

//Enemy Hurt/Explode
if enemyExplode == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_EnemyExplode, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	audio_sound_pitch(_snd, random_range(0.8, 1.2));
	
	enemyExplode = false;
}


///-----Player Actions-----///


//---Rush & Edge---//

//Sonic Jump
if sonicJump == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_SonicJump, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	sonicJump = false;
}

//Spindash Rev
if spindashRev == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_Spindash, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	if spindashPitch < 1.5 {
		spindashPitch += 0.05;
	}
	
	spindashPitchTimer = 60;
	
	audio_sound_pitch(_snd, spindashPitch);
	
	spindashRev = false;
}

if !spindashRev {
	if spindashPitchTimer > 0 {
		spindashPitchTimer -= 1;
	}
	
	if spindashPitchTimer <= 0 {
		spindashPitch = 1;
	}
}

//Homing Lock On
if homingLockOn == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_HomingLockOn, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	homingLockOn = false;
}

//Homing Attack
if homingAttack == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_HomingAttack, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	homingAttack = false;
}

//Boost Pad
if boostPad == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_BoostPad, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	boostPad = false;
}



//---Ivy---//


//Gun Shoot
if ivyShoot == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_IvyGunShoot, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	ivyShoot = false;
}


//Charging Shot
if ivyCharge == true {
	
	//Play Sound
	if !audio_is_playing(ivyChargeInst) {
		ivyChargeInst = audio_play_sound(snd_IvyGunCharge, 1, true);
	}
	
	audio_sound_gain(ivyChargeInst, _sfxVol, 0);
	
	//Raise Pitch
	if ivyChargePitch < 1 {
		ivyChargePitch += 0.01;
	} else {
		ivyChargePitch = 1;
	}
}

//Set Pitch
if audio_is_playing(ivyChargeInst) {
	audio_sound_pitch(ivyChargeInst, ivyChargePitch);
}

if ivyCharge == false {
	if audio_is_playing(ivyChargeInst) {
		audio_stop_sound(ivyChargeInst);
	}
	
	ivyChargePitch = ivyChargeSetPitch;
}


//Charge Shot
if ivyChargeShot == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_IvyGunChargeShoot, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	ivyChargeShot = false;
}


//Pre-Stomp (Ivy)
if ivyPreStomp == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_IvyPreStomp, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	ivyPreStomp = false;
}


//Gun Impact
if ivyImpact == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_IvyStomp, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	ivyImpact = false;
}



//---Universal---//

//Jump Sound
if jumpSound == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_Jump, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	jumpSound = false;
}


//Double Jump Sound
if doubleJumpSound == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_Whoosh, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	doubleJumpSound = false;
}


//Double Jump Loop
if doubleJumpSoundLoop == true && !audio_is_playing(doubleJumpSoundLoopInst) {
	doubleJumpSoundLoopInst = audio_play_sound(snd_WhooshLoop, 1, true);
	audio_sound_gain(doubleJumpSoundLoopInst, _sfxVol, 0);
}

if doubleJumpSoundLoop == false && audio_is_playing(doubleJumpSoundLoopInst) {
	audio_stop_sound(doubleJumpSoundLoopInst);
}

doubleJumpSoundLoop = false;


//Sliding Sound
if slideSound == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_Slide, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	slideSound = false;
}


//Stomping Sound
if stompingSound == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_Stomping, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	stompingSound = false;
}

//Stomping Rev
if stompingRev == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_StompingPickUp, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	stompingRev = false;
}

//Stomping Charged
if stompingCharged == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_StompingFullCharge, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	stompingCharged = false;
}

//Omega Stomping
if omegaStomping == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_OmegaStomping, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	omegaStomping = false;
}


///-----Boosting-----///

//Sonic Rush
if sonicRush == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_Boost, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	sonicRush = false;
}

//Blaze Rush
if blazeRush == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_BoostFire, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	blazeRush = false;
}



///-----Tricking-----///

//Rush Trick
if rushTrick == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_Trick1, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	rushTrick = false;
}

//Rush Trick Finish
if rushTrickFinish == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_TrickFinal, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	rushTrickFinish = false;
}

//Rush Mode Trick
if rushModeTrick == true {
	rushModePitch += 0.01;
	rushModePitchTimer = rushModePitchFrames;
	
	//Play Sound
	var _snd = audio_play_sound(snd_RushRushModeTrick, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	audio_sound_pitch(_snd, rushModePitch);
	
	rushModeTrick = false;
}

if rushModePitchTimer > 0 {
	rushModePitchTimer--;
} else {
	rushModePitch = 0.95;
}


///-----Rush Mode-----///

//Rush Mode Gain
if rushModeGain == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_RushRushModeGain, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	rushModeGain = false;
}

//Rush Mode Lose
if rushModeLose == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_RushRushModeLose, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	rushModeLose = false;
}


//Stomped
if stompSound == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_Stomp, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	if audio_is_playing(snd_Stomping) {
		audio_stop_sound(snd_Stomping);
	}
	
	stompSound = false;
}


//Air Dash
if airDashSound == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_AirDash, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	airDashSound = false;
}


//Rail Grind On
if railGrindOn == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_RailOn, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	railGrindOn = false;
}


//Rail Grinding (Loop)
if railGrinding == true && !audio_is_playing(railGrindingInst) {
	railGrindingInst = audio_play_sound(snd_RailGrind, 1, true);
}

if railGrinding == false && audio_is_playing(railGrindingInst) {
	audio_stop_sound(railGrindingInst);
}

railGrinding = false;


//Rail Jump
if railJump == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_TrickFinal, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	railJump = false;
}


//Tricking
if trick == true {
	//Randomize
	var _trickRandom = ceil(random_range(1, 2));
	
	//Play Sound Based on Random
	if _trickRandom == 1 {
		var _snd = audio_play_sound(snd_Trick1, 8, false);
		audio_sound_gain(_snd, _sfxVol, 0);
	} else if _trickRandom == 2 {
		var _snd = audio_play_sound(snd_Trick2, 8, false);
		audio_sound_gain(_snd, _sfxVol, 0);
	}
	
	trick = false;
}


///-----Menu-----///

//Menu Confirm
if menuConfirm == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_MenuConfirm, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	menuConfirm = false;
}

//Menu Cancel
if menuCancel == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_MenuCancel, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	menuCancel = false;
}

//Menu Tap
if menuTap == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_GeneralText, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	menuTap = false;
}

//OMEGA Confirm
if omegaConfirm == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_OmegaConfirm, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	omegaConfirm = false;
}

//---Hint---//

//Menu Pop
if menuPop == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_FunkinCS_Select, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	menuPop = false;
}

//---Results---//

//Funkin' Locked
if funkinLocked == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_FunkinCS_Locked, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	funkinLocked = false;
}

//Funkin' Screenshot
if funkinScreenshot == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_FunkinScreenshot, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	funkinScreenshot = false;
}

//---Pause Menu---//

//Pause Menu Splash
if pauseMenuSplash == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_PauseMenuSplash, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	pauseMenuSplash = false;
}


///-----Cutscenes-----///

//Deltarune AUDIO INTRO
if deltaAudioIntro == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_DeltaruneAUDIOINTRO, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	deltaAudioIntro = false;
}


///-----Death-----///

//Friday Night Funkin' CS Confirm
if funkinCheckpoint == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_FunkinCS_Confirm, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	funkinCheckpoint = false;
}

//Deltarune Fall
if deltaFall == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_DeltaruneFall, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	deltaFall = false;
}

//Deltarune Thud
if deltaThud == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_DeltaruneThud, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	deltaThud = false;
}


///-----Game Over-----///

//ULTRAKILL Landing
if ULTRAKILL_Landing == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_LightOn, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	ULTRAKILL_Landing = false;
}


///-----Weather-----///

//Thunder
if thunder1 == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_Thunder1, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	thunder1 = false;
}

if thunder2 == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_Thunder2, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	thunder2 = false;
}

if thunder3 == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_Thunder3, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	thunder3 = false;
}

if lowTierGod == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_Vineboom, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	lowTierGod = false;
}


///-----Text-----///

//Funkin Fav
if funkinFav == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_FunkinFav, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	funkinFav = false;
}


///-----Results-----///

//Crowd Aww
if crowdAww == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_CrowdAww, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	crowdAww = false;
}

//Crowd Applause
if crowdApplause == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_CrowdApplause, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	crowdApplause = false;
}


///-----Environments-----///


//---Breakables---//

//Breakable Ground
if breakableGround == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_GroundBreak, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	breakableGround = false;
}


//---Spring---//

//Spring Bounce
if springBounce == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_FunkinRankinBad, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	springBounce = false;
}



//---End Goal Pole Break---//

//Undertale Bomb
if UndertaleBomb == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_Bomb, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	UndertaleBomb = false;
}


//UNDERTALE Bomb Fly
if UNDERTALEBombFly == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_BombFall, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	UNDERTALEBombFly = false;
}


//UNDERTALE Bomb Splosion
if UNDERTALEBombSplosion == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_BombSplosion, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	UNDERTALEBombSplosion = false;
}


//Undertale Fire
if UndertaleFireLoop == true && !audio_is_playing(UndertaleFireInst) {
	
	//Play Sound
	UndertaleFireInst = audio_play_sound(snd_BGFlame, 8, true);
	audio_sound_gain(UndertaleFireInst, _sfxVol, 0);
	
}

if UndertaleFireLoop == false && audio_is_playing(UndertaleFireInst) {
	
	//Stop loop
	audio_stop_sound(UndertaleFireInst);
	
}
UndertaleFireLoop = false;


//UNDERTALE Rainbow
if UNDERTALERainbow == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_RainbowBeam, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	UNDERTALERainbow = false;
}

//Undertale Damage
if UndertaleDamage == true {
	
	//Play Sound
	var _snd = audio_play_sound(snd_UTEnemyDamage, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	UndertaleDamage = false;
}


//Undertale Rainbow Loop
if UndertaleRainbowLoop == true && !audio_is_playing(UndertaleRainbowInst) {
	
	//Play Sound
	UndertaleRainbowInst = audio_play_sound(snd_RainbowBeamLoop, 8, true);
	audio_sound_gain(UndertaleRainbowInst, _sfxVol, 0);
	
}

if UndertaleRainbowLoop == false && audio_is_playing(UndertaleRainbowInst) {
	
	//Stop loop
	audio_stop_sound(UndertaleRainbowInst);
	
}
UndertaleRainbowLoop = false;







///-----Action Shit-----///

//Light Hit
if lightHit == true {
	var _snd = audio_play_sound(snd_BattleJab, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	lightHit = false;
}

//Medium
if mediumHit == true {
	var _snd = audio_play_sound(snd_SemiHeavyHit, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	mediumHit = false;
}

//Heavy
if heavyHit == true {
	var _snd = audio_play_sound(snd_HeavyHit, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	heavyHit = false;
}

//Heavy Launcher
if heavyLauncher == true {
	var _snd = audio_play_sound(snd_HeavyLauncher, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	heavyLauncher = false;
}

//Wall Bounce
if wallBounce == true {
	var _snd = audio_play_sound(snd_BattleBounceHit, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	wallBounce = false;
}

//Parry
if parry == true {
	var _snd = audio_play_sound(snd_Parry, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	parry = false;
}

//Block
if block == true {
	var _snd = audio_play_sound(snd_ChargeStart, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	block = false;
}

//Block
if heavyWhoosh == true {
	var _snd = audio_play_sound(snd_HeavyWhoosh, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	heavyWhoosh = false;
}

//Charge Loop
if chargeLoop == true && !audio_is_playing(chargeInst) {
	
	//Play Sound
	chargeInst = audio_play_sound(snd_ChargeLoop, 8, true);
	audio_sound_gain(chargeInst, _sfxVol, 0);
	
}

if chargeLoop == false && audio_is_playing(chargeInst) {
	
	//Stop loop
	audio_stop_sound(chargeInst);
	
}
chargeLoop = false;


/*//Stomping
if stompingSound == true {
	//Play Sound
	if !audio_is_playing(stompingSoundInst) {
		stompingSoundInst = audio_play_sound(snd_Stomping, 1, true)
	}
	
	//Raise Volume
	if stompingSoundVol < 1 {
		stompingSoundVol += stompingSoundVolSpd
	} else {
		stompingSoundVol = 1;
	}
}

//Fade out and turn off
if stompingSound == false {
	//Lower Volume
	if stompingSoundVol > 0 {
		stompingSoundVol -= stompingSoundVolSpd;
	} else {
		stompingSoundVol = 0;
	}
	
	//Stop sound if volume 0
	if stompingSoundVol <= 0 {
		audio_stop_sound(stompingSoundInst);
	}		
}

//Set Volume
if audio_is_playing(stompingSoundInst) {
	audio_sound_gain(stompingSoundInst, stompingSoundVol * _sfxVol, 0);
}

//Stop Sound
stompingSound = false;*/


/*if doubleJumpSound == true && !audio_is_playing(doubleJumpSoundInst) {
	
	//Play Sound
	doubleJumpSoundInst = audio_play_sound(snd_Whoosh, 8, false);
}

//Set Volume
if audio_is_playing(doubleJumpSoundInst) {
	audio_sound_gain(doubleJumpSoundInst, _sfxVol, 0);
}

if doubleJumpSound == false && audio_is_playing(doubleJumpSoundInst) {
	audio_stop_sound(doubleJumpSoundInst); 
}

doubleJumpSound = false;*/