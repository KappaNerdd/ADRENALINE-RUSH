function scr_BPMCreate(_bpm = 120, _frames = 60) {
	global.BPM = _bpm;
	global.Beat = _frames / global.BPM;
	global.BeatProg = global.Beat;
	global.MainBeat = 0;
}

function scr_BPMStep() {
	var _musOff = 0.1;
	var _currentPos = audio_sound_get_track_position(obj_MusicManager.songInstance) + _musOff;
	
	global.MainBeat = _currentPos % global.Beat;
}

function scr_GetMainBeat() {
	return global.MainBeat;
}

function scr_GetBeatProg() {
	return global.BeatProg;
}

function scr_GetMainNProg() {
	global.BeatProg = global.MainBeat;
}