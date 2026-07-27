display_set_gui_size(768, 432);

#region //Menu Check
	var _scale = 1 + extraScale / 8;
#endregion

#region //Background
	draw_sprite_ext(sprite_index, image_index, 0, 0, 38.5, 22, 0, c_white, 1);
	
	for(var i = 0; i < 20; i++) {
		var _gapX = 60;
		var _text = "level_Rush";
		var _change = backTextX;
		
		if i % 2 == 0 {
			_text = "level_Adrenaline";
			_change = otherBackTextX;
		}
		
		var _newX = -_change + (_gapX * i);
		var _jacobAlpharad = 0.75;
		
		draw_text_transformed_color(_newX, _change, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		
		draw_text_transformed_color(_newX + baseTextX * 0.25, _change - baseTextX * 0.25, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX + baseTextX * 0.5, _change - baseTextX * 0.5, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX + baseTextX * 0.75, _change - baseTextX * 0.75, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX + baseTextX, _change - baseTextX, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX + baseTextX * 1.25, _change - baseTextX * 1.25, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX + baseTextX * 1.5, _change - baseTextX * 1.5, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX + baseTextX * 1.75, _change - baseTextX * 1.75, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX + baseTextX * 2, _change - baseTextX * 2, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX + baseTextX * 2.25, _change - baseTextX * 2.25, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		
		draw_text_transformed_color(_newX - baseTextX * 0.25, _change + baseTextX * 0.25, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX - baseTextX * 0.5, _change + baseTextX * 0.5, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX - baseTextX * 0.75, _change + baseTextX * 0.75, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX - baseTextX, _change + baseTextX, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX - baseTextX * 1.25, _change + baseTextX * 1.25, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX - baseTextX * 1.5, _change + baseTextX * 1.5, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX - baseTextX * 1.75, _change + baseTextX * 1.75, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX - baseTextX * 2, _change + baseTextX * 2, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX - baseTextX * 2.25, _change + baseTextX * 2.25, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
	}
	
	draw_sprite_ext(spr_MainMenuBall, 3 * extraScale, -menuX + 100, menuY + 100, 2 + extraScale / 1.5, 2 + extraScale / 1.5, 0, c_fuchsia, 0.75);
	draw_sprite_ext(spr_MainMenuBall, 4, -menuX + 100, menuY + 100, 2 + extraScale / 4, 2 + extraScale / 4, 0, c_white, 1);
	
	draw_sprite_ext(spr_MainMenuBall, 3 * extraScale, menuX + 668, menuY + 332, 2 + extraScale / 1.5, 2 + extraScale / 1.5, 0, c_blue, 0.75);
	draw_sprite_ext(spr_MainMenuBall, 4, menuX + 668, menuY + 332, 2 + extraScale / 4, 2 + extraScale / 4, 0, c_white, 1);
	
	var _checkY = 230 + (menuY * 3);
	
	gpu_set_fog(true, c_blue, 0, 1);
		draw_sprite_ext(spr_KappaTitle, 0, 170 - 10 - (15 * extraScale), _checkY - 10 - (10 * extraScale), 0.66, 0.66, 0, c_white, 1);
	gpu_set_fog(false, c_black, 0, 1);
	
	gpu_set_fog(true, c_fuchsia, 0, 1);
		draw_sprite_ext(spr_LuciferTitle, 0, 628 + 10 + (15 * extraScale), _checkY - 10 - (10 * extraScale), 0.66, 0.66, 0, c_white, 1);
	gpu_set_fog(false, c_black, 0, 1);
	
	draw_sprite_ext(spr_KappaTitle, 0, 170, _checkY + (5 * extraScale), 0.66, 0.66, 0, c_white, 1);
	draw_sprite_ext(spr_LuciferTitle, 0, 628, _checkY + (5 * extraScale), 0.66, 0.66, 0, c_white, 1);
#endregion

#region //Extra Overlays
	var _moveScale = extraScale / 4;

	draw_sprite_ext(spr_TitleLogoNormal, 0, 768 / 2, 210 + menuY * 3, 0.5 + _moveScale / 4, 0.5 + _moveScale / 4, 0, c_black, 1);
	draw_sprite_ext(spr_TitleLogoNormal, 0, 768 / 2, 200 + menuY * 3, 0.5 + _moveScale / 4, 0.5 + _moveScale / 4, 0, c_white, 1);
	draw_sprite_ext(spr_TitleNewEN, 0, 768 / 2, 200 + menuY * 3, 1.5 + _moveScale, 1.5 + _moveScale, 0, c_white, 1);
	
	if !pressed {
		if nerd == 0 {
			draw_sprite_ext(spr_MenuButtonBlaze, 1, 768 - 215, -menuY + 360 + (10 * extraScale), 10, 1, 0, c_white, 1);
			draw_sprite_ext(spr_MenuButtonSonic, 0, 768 - 215, -menuY + 350 + (5 * extraScale), 10, 1, 0, c_white, 1);
		} else {
			draw_sprite_ext(spr_MenuButtonSonic, 1, 768 - 215, -menuY + 360 + (10 * extraScale), 10, 1, 0, c_white, 1);
			draw_sprite_ext(spr_MenuButtonBlaze, 0, 768 - 215, -menuY + 350 + (5 * extraScale), 10, 1, 0, c_white, 1);
		}
	}
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
		if pressStart {
			draw_text_transformed_color(768 / 2, -menuY + 353 + (3 * extraScale), scr_LocalText("freeplay_ChooseChar1") + " " + string(obj_CustomPauseKeySpeed.keyText), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
			draw_text_transformed_color(768 / 2, -menuY + 350 + (3 * extraScale), scr_LocalText("freeplay_ChooseChar1") + " " + string(obj_CustomPauseKeySpeed.keyText), 1, 1, 0, c_white, c_white, c_white, c_white, 1);
		}
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	draw_sprite_ext(spr_SonicRushSpikesNorm, srSpikesIndex, 820, 50, 3 + extraScale / 2, 3 + extraScale / 2, -135, c_blue, 1);
	draw_sprite_ext(spr_SonicRushSpikesNorm, srSpikesIndex, -52, 382, 3 + extraScale / 2, 3 + extraScale / 2, 45, c_fuchsia, 1);
#endregion
