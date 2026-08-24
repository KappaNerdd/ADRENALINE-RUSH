var _toji2 = instance_place(x, y, obj_EnemyParent);
			
if _toji2 {
	if canHurt && hurtEnemy && createdChar != _toji2.id && !_toji2.launched {
		_toji2.charKiller = obj_Player;
				
		scr_ScreenShake(0.5, 10, true, true);
		scr_ControllerRumble();
				
		scr_DRDamageNumbers(-_toji2.enemyHealth, _toji2.x, _toji2.y);
		_toji2.enemyHealth -= _toji2.enemyHealth;
		obj_SFXManager.UndertaleDamage = true;
		
		if killProj {
			instance_destroy();
		}
	}
}