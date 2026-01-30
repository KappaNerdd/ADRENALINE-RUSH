bonus1 = 10000 * obj_HUDRankDisplayer.rankChecker;
bonus2 = 1000 * global.EnemyCount;
bonus3 = 20000;

if !global.PRank {
	bonus4 = 0;
} else {
	bonus4 = 50000;
}

bonus5 = 100 * global.Rings;

kysTimer = 180;

createBonusTimer = 2;
createBonus = false;

moveX = 700;

instance_destroy();