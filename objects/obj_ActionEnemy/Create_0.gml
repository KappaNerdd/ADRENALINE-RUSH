#region //Character Sprites & Data
	scr_CharDataSonicAction();
	scr_SpriteDataSonicAction();
#endregion

#region //Create Action Variables
	scr_CreateActionVariables();
#endregion

#region //HitBox
	hitBox = obj_EnemyHitbox;
#endregion

//HP & EN
HP = global.Health;
maxHP = global.MaxHealth;
EN = 300;
maxEN = 300;

//Damage & Score Multipliers
global.AttackFreshness = 0;
