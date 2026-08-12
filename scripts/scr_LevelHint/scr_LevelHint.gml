function scr_CreateHint(_moves = [], _moveHint = "", _descHint = noone, _charHint = noone, _charHintRight = noone) {
	checkCons = _moves
	moveHint = _moveHint;
	descHint = _descHint;

	if !obj_Player.leftFacer {
		charHint = _charHint;
	} else {
		charHint = _charHintRight;
	}
}