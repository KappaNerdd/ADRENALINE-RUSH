enemyWave = false;
spawnWave1 = false;
enemyWaveTimer = 60;

gasterWave = false;
gasterWaveTimer = 660;
blastTimer = 30;
blast1 = false;
blast2 = false;
blast3 = false;

enemyWave2 = false;
doneWave = false;
blastTimer2 = 120;
blast4 = false;
blast5 = false;
blast6 = false;

enemyWave3 = false;
doneWave2 = false;
blastTimer3 = 60;
blast7 = false;
blast8 = false;
blast9 = false;

enemyWave4 = false;
doneWave3 = false;
blastTimer4 = 60;
blast10 = false;
blast11 = false;
blast12 = false;

blastingTimer = 705;
changeTheme = false;
doneWave4 = false;
blastTimer5 = 60;
blast13 = false;
blast14 = false;
blast15 = false;

moveDownPlayer = false;

scr_HealingEffect(obj_Player);
scr_HealthPlayer(250000);
scr_DRDamageNumbers(250000, obj_Player.x, obj_Player.y, 120, c_lime);
obj_SFXManager.funkinCheckpoint = true;