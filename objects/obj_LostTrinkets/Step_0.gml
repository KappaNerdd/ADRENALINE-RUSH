scr_GetCharRushBoostIcon();

if !global.MIND && global.PlayerChar != 0 {
	sprite_index = _charCheck3;
	colChar = c_black;
} else {
	sprite_index = spr_HeadCollectable;
	colChar = c_white;
}

if uncollectable {
	uncollectableTimer--;
	
	if uncollectableTimer <= 0 {
		uncollectable = false;
	}
}

if kysTimer > 0 {
	kysTimer--;
}

if kysTimer <= 0 {
	if dyingTimer > 0 {
		dyingTimer--;
		
		if visibleTimer > 0 {
			visibleTimer--;
		} else {
			visibleTimer = 2;
			
			if visible {
				visible = false;
			} else {
				visible = true;
			}
		}
	} else {
		instance_destroy();
	}
}

x += ringXSpeed;
y += ringYSpeed;
ringYSpeed += grav;

if place_meeting(x + ringXSpeed, y, obj_Solid) {
	ringXSpeed = -ringXSpeed;
}

if place_meeting(x, y + ringYSpeed, obj_Solid) {
	ringYSpeed = -(ringYSpeed - 0.25);
}