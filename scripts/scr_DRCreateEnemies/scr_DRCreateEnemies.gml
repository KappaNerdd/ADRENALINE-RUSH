function scr_CreateDREnemy(_name = "FLEA", _obj = obj_DRFlea, _lv = 5, _atk = 5, _def = 3, _hp = 100, _maxHP = 100, _money = 5) constructor {
	name = _name;
	obj = _obj;
	lv = _lv;
	atk = _atk;
	def = _def;
	hp = _hp;
	maxHP = _maxHP;
	money = _money;
}

global.DREnemyList = {
	flea: new scr_CreateDREnemy(
		"FLEA",
		obj_DRFlea,
		5,
		5,
		4,
		100,
		100,
		5
	),
	
	angel: new scr_CreateDREnemy(
		"FALSE ANGEL",
		obj_DRFalse,
		2,
		1,
		10,
		50,
		50,
		1
	),
}