function scr_CreateDRChar(_name = "KRIS", _obj = obj_DRKris, _lv = 1, _atk = 2, _def = 5, _hp = 90, _maxHP = 90) constructor {
	name = _name;
	obj = _obj;
	lv = _lv;
	atk = _atk;
	def = _def;
	hp = _hp;
	maxHP = _maxHP
}

global.DRCharList = {
	kris: new scr_CreateDRChar(
		"KRIS",
		obj_DRKris,
		1,
		2,
		5,
		90,
		90
	),
	
	susie: new scr_CreateDRChar(
		"SUSIE",
		obj_DRSusie,
		1,
		5,
		6,
		110,
		110
	),
}
