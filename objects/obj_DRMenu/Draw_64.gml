display_set_gui_size(512, 288);

#region //First Menu
	for(var i = 0; i < menuCount; i++) {
		var _index = 0;
		var _gap = 230 / menuCount;
		var _col = c_white;
		
		if menuChoice == i {
			_index = 1;
			_col = c_aqua;
		}
		
		draw_text_transformed_color(menuX[i] - 25, menuY + 30 + (_gap * (i)), scr_LocalText(menus[i][0]), 0.75, 0.75, 0, c_white, c_white, _col, _col, 1);
		draw_sprite_ext(menus[i][1], _index, menuX[i], menuY + 50 + (_gap * (i)), 1, 1, 0, c_white, 1);
	}
#endregion

#region
	display_set_gui_size(768, 432);
		for(var p = 0; p < array_length(global.DRPartyReal); p++) {
			var _gap = 300;
			
			draw_sprite_ext(global.DRPartyReal[2 - p].menuPort, 0, 800 - (charX * (3 - p)), menuY + 250, 0.5, 0.5, 0, c_white, 1);
		}
	display_set_gui_size(512, 288);
#endregion

#region //SOUL
	soulX = lerp(soulX, tarSOULX, 0.15);
	soulY = lerp(soulY, tarSOULY, 0.15);
	
	draw_sprite_ext(soulSpr, 0, soulX, soulY, 1, 1, 0, c_white, 1);
#endregion

#region //Sonic Rush Spikes
	display_set_gui_size(768, 432);
	draw_sprite_ext(spr_SonicRushSpikesNorm, srSpikesIndex, 768, -menuY, 1, 21, -90, global.DRPlayerID.charCol, 1);
#endregion