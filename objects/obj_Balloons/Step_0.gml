if popped {
	homingAttackable = false;
	
	visible = false
	
	if poppedTimer > 0 {
		poppedTimer -= 1;
	}
	
	if poppedTimer <= 0 {
		visible = true;
		popped = false;
		poppedTimer = 180;
	}
} else {
	homingAttackable = true;
}

if cluster {
	sprite_index = clustBalloons[rSprite1];
} else {
	sprite_index = singBalloons[rSprite2];
}