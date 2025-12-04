display_set_gui_size(640, 360);

if createBonusTimer > 0 {
	createBonusTimer -= 1;
}

if createBonusTimer <= 0 {
	if !createBonus {
		createBonus = true;
		scr_BonusPoints(bonus1 + bonus2 + bonus3 + bonus4 + bonus5);
	}
}


if kysTimer > 0 {
	kysTimer -= 1;
	
	moveX = lerp(moveX, 400, 0.1);
} else {
	moveX = lerp(moveX, 700, 0.1);
	
	if moveX >= 699 {
		instance_destroy();
	}
}

draw_text_color(moveX + 3, 33, scr_LocalText("bon_Time") + ": " + string(bonus1) + "\n" + scr_LocalText("bon_Trink") + ": " + string(bonus5) + "\n" + scr_LocalText("bon_Enemy") + ": " + string(bonus2) + "\n" + scr_LocalText("bon_Ring") + ": " + string(bonus3) + "\n" + scr_LocalText("bon_Perf") + ": " + string(bonus4), c_black, c_black, c_black, c_black, 1);

draw_text(moveX, 30, scr_LocalText("bon_Time") + ": " + string(bonus1) + "\n" + scr_LocalText("bon_Trink") + ": " + string(bonus5) + "\n" + scr_LocalText("bon_Enemy") + ": " + string(bonus2) + "\n" + scr_LocalText("bon_Ring") + ": " + string(bonus3) + "\n" + scr_LocalText("bon_Perf") + ": " + string(bonus4));
