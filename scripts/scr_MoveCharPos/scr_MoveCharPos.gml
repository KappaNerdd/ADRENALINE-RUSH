function scr_CharMovePos(_prevX = 0, _prevY = 0, _tarX = 100, _tarY = 100, _moveDur = 0.5) {
	var _dist = point_distance(x, y, _tarX, _tarY);
	var _moveSpd = _dist / _moveDur;
	var _moveDir = point_direction(x, y, _tarX, _tarY);
	var _dt = _moveSpd * delta_time / 1000000;

	x += lengthdir_x(_dt, _moveDir);
	y += lengthdir_y(_dt, _moveDir);

	if point_distance(x, y, _tarX, _tarY) <= _dt {
	    x = _tarX;
	    y = _tarY;
	}
}