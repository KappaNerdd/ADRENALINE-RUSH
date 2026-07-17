if sprite_index == spr_HeadFalseIdle {
	if animRandom == 1 {
		sprite_index = spr_HeadFalseBlink;
	}
	
	animRandom = round(random(20));
} else {
	sprite_index = spr_HeadFalseIdle;
}