draw_self();

if newChar != noone {
	draw_text(x + 8, y + 4, "You can now play as     " + string(charName));
	draw_sprite_ext(charIcon, 0, x + 206, y + 4, 0.5, 0.5, 0, c_white, 1);
}

if newCostume != noone {
	draw_text(x + 8, y + 4, "You unlocked costume     " + string(costumeName));
	draw_sprite_ext(costumeIcon, costumeIndex, x + 220, y + 4, 0.5, 0.5, 0, c_white, 1);
}