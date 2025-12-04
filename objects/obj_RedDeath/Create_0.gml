depth = -10000000;

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

var _playX = 0;
var _playY = 0;

if instance_exists(obj_Player) {
	_playX = obj_Player.x;
	_playY = obj_Player.y;
}

var _relX = _playX - _camX;
var _relY = _playY - _camY;

playX = _playX;
playY = _playY;

scr_BonusPoints(round(-(global.GameScore / 4)));

hitLag = 500;

createDeath = false;

obj_SFXManager.UndertaleDamage = true;

