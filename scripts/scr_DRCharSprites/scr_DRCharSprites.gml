function scr_DRKrisSprite() {
	//Color
	charCol = COLORS.LONE;
	
	//SOUL
	soulSpr[SOUL.IDLE] = spr_DRSOULLone;
	soulSpr[SOUL.HURT] = spr_DRSOULLoneHurt;
	soulSpr[SOUL.SIL] = spr_DRSOULLoneSil;
	
	//Overworld Menu
	menuPort = spr_CharBioANGEL;
	
	//Overworld Movement
	baseSpr[DIR.UP] = spr_KrisUp;
	baseSpr[DIR.DOWN] = spr_KrisDown;
	baseSpr[DIR.LEFT] = spr_KrisLeft;
	baseSpr[DIR.RIGHT] = spr_KrisRight;
	
	walkSpr[DIR.UP] = spr_KrisUp;
	walkSpr[DIR.DOWN] = spr_KrisDown;
	walkSpr[DIR.LEFT] = spr_KrisLeft;
	walkSpr[DIR.RIGHT] = spr_KrisRight;
	runSpr[DIR.UP] = spr_KrisUp;
	runSpr[DIR.DOWN] = spr_KrisDownRun;
	runSpr[DIR.LEFT] = spr_KrisLeftRun;
	runSpr[DIR.RIGHT] = spr_KrisRightRun;
	
	//Battle
	battleSpr[BATTLE.ENTER] = spr_KrisBattleEnter;
	battleSpr[BATTLE.LEAVE] = spr_KrisBattleEnter;
	battleSpr[BATTLE.LAND] = spr_KrisLand;
	battleSpr[BATTLE.START] = spr_KrisBattleAttack;
	battleSpr[BATTLE.IDLE] = spr_KrisBattleIdle;
	battleSpr[BATTLE.ATTACK] = spr_KrisBattleAttack;
	
	charFace = baseSpr[DIR.DOWN];
	mask_index = spr_KrisDown;
}

function scr_DRSusieSprite() {
	//Color
	charCol = COLORS.ROXXANE;
	
	//SOUL
	soulSpr[SOUL.IDLE] = spr_DRSOULRoxxane;
	soulSpr[SOUL.HURT] = spr_DRSOULRoxxaneHurt;
	soulSpr[SOUL.SIL] = spr_DRSOULRoxxaneSil;
	
	//Overworld Menu
	menuPort = spr_CharBioFLEA;
	
	//Overworld Movement
	baseSpr[DIR.UP] = spr_SusieUp;
	baseSpr[DIR.DOWN] = spr_SusieDown;
	baseSpr[DIR.LEFT] = spr_SusieLeft;
	baseSpr[DIR.RIGHT] = spr_SusieRight;
	
	walkSpr[DIR.UP] = spr_SusieUp;
	walkSpr[DIR.DOWN] = spr_SusieDown;
	walkSpr[DIR.LEFT] = spr_SusieLeft;
	walkSpr[DIR.RIGHT] = spr_SusieRight;
	runSpr[DIR.UP] = spr_SusieUpRun;
	runSpr[DIR.DOWN] = spr_SusieDownRun;
	runSpr[DIR.LEFT] = spr_SusieLeftRun;
	runSpr[DIR.RIGHT] = spr_SusieRightRun;
	
	//Battle
	battleSpr[BATTLE.ENTER] = spr_SusieBattleEnter;
	battleSpr[BATTLE.LEAVE] = spr_SusieBattleEnter;
	battleSpr[BATTLE.LAND] = spr_SusieLand;
	battleSpr[BATTLE.START] = spr_SusieBattleAttack;
	battleSpr[BATTLE.IDLE] = spr_SusieBattleIdle;
	battleSpr[BATTLE.ATTACK] = spr_SusieBattleAttack;
	
	charFace = baseSpr[DIR.DOWN];
	mask_index = spr_KrisDown;
}