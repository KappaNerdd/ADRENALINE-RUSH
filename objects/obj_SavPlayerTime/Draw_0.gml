draw_set_halign(fa_right);

	if global.statData[0].player_TimeSeconds < 10 && global.statData[0].player_TimeMinutes < 10 {
		draw_text(obj_SavBox.x + 460, obj_SavBox.y + 30, string(global.statData[0].player_TimeHours) + ":0" + string(global.statData[0].player_TimeMinutes) + ":0" + string(round(global.statData[0].player_TimeSeconds)));
	} else if global.statData[0].player_TimeSeconds >= 10 && global.statData[0].player_TimeMinutes >= 10 {
		draw_text(obj_SavBox.x + 460, obj_SavBox.y + 30, string(global.statData[0].player_TimeHours) + ":" + string(global.statData[0].player_TimeMinutes) + ":" + string(round(global.statData[0].player_TimeSeconds)));
	} else if global.statData[0].player_TimeSeconds < 10 && global.statData[0].player_TimeMinutes >= 10 {
		draw_text(obj_SavBox.x + 460, obj_SavBox.y + 30, string(global.statData[0].player_TimeHours) + ":" + string(global.statData[0].player_TimeMinutes) + ":0" + string(round(global.statData[0].player_TimeSeconds)));
	} else if global.statData[0].player_TimeSeconds >= 10 && global.statData[0].player_TimeMinutes < 10 {
		draw_text(obj_SavBox.x + 460, obj_SavBox.y + 30, string(global.statData[0].player_TimeHours) + ":0" + string(global.statData[0].player_TimeMinutes) + ":" + string(round(global.statData[0].player_TimeSeconds)));
	}
	
draw_set_halign(fa_left);