createDRBG = true;
colDR = c_lime;
changePos = false;
charPos1 = [50, 100];
charPos2 = [200, 150];
charPos3 = [300, 200];

enemPos1 = [510, 50];
enemPos2 = [400, 150];
enemPos3 = [350, 100];

enemHP = 100;
enemMaxHP = 100;
level = 5;
bullets = [];

enemNumID = 0;

moreEnemies = [global.DREnemyList.angel];

battleSpr[BATTLE.IDLE] = spr_HeadFleaIdle;
battleSpr[BATTLE.HURT] = spr_HeadFleaRoar;