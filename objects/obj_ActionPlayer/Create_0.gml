#region //Character Sprites & Data
	scr_CharDataSonicAction();
	scr_SpriteDataSonicAction();
#endregion

#region //Create Action Variables
	scr_CreateActionVariables();
#endregion

#region //HitBox
	hitBox = obj_ActionHitbox;
#endregion

//HP & EN
if player {
	HP = global.Health;
	maxHP = global.MaxHealth;
} else {
	HP = 1000000;
	maxHP = 1000000;
}

EN = 0;
maxEN = 300;

//Damage & Score Multipliers
global.AttackFreshness = 0;
