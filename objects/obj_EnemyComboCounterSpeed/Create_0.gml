sizeChange = 1;

depth = 0;

mult = 1;

newX = 0;
newY = 0;

newX2 = 0;
newY2 = 0;

newX3 = 0;
newY3 = 0;

visibleTimer = 2;

createBonus = false;

if !global.MIND && global.PlayerChar != 0 {
	image_speed = 0;
} else {
	image_speed = 1;
}
	
image_index = 0;

comboNames = [
	spr_EnemyComboOkHead,
	spr_EnemyComboAightHead,
	spr_EnemyComboNiceHead,
	spr_EnemyComboGoodHead,
	spr_EnemyComboSickHead,
	spr_EnemyComboDamnHead,
	spr_EnemyComboFuckHead,
	spr_EnemyCombo69Head,
]