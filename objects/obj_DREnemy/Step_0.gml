depth = -bbox_bottom;

if !global.DRBattle {
	var _camX = camera_get_view_x(view_camera[0]);
	var _camY = camera_get_view_y(view_camera[0]);
	
	if place_meeting(x, y, global.DRPlayerID) && !instance_exists(obj_DRBattle) {
		//Get rid of old Enemies
		array_delete(global.DREnemy, 0, array_length(global.DREnemy));
		array_set(global.DREnemy, 0, id);
		sprite_index = battleSpr[BATTLE.HURT];
		
		for(var i = 0; i < array_length(moreEnemies); i++) {
			with(instance_create_depth(_camX + 650, _camY + 144, depth, moreEnemies[i].obj)) {
				extraX = 0;
				extraY = 0;
				array_set(global.DREnemy, i + 1, id);
				enemNumID = i + 1;
			}
		}
		
		scr_BattleStart(createDRBG, colDR, changePos, charPos1, charPos2, charPos3, enemPos1, enemPos2, enemPos3);
	} else {
		scr_CreateAfterImage(x, y, depth + 1, true, c_red);
	}
} else {
	if enemHP <= 0 {
		array_delete(global.DREnemy, 0, enemNumID);
	}
}