display_set_gui_size(640, 360);

var _ang = 0;

var _xscale = 0.75;
var _yscale = 0.75;

var _font = global.EnemyComboFont;
var _arrow = spr_PauseArrow;

if global.MIND or global.PlayerChar == 0 {
	_font = global.EnemyComboFontHead;
	_arrow = spr_PauseArrowHead;
}

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

var _playX = 0;
var _playY = 0;

if instance_exists(obj_Player) {
	_playX = obj_Player.x;
	_playY = obj_Player.y;
}

var _relX = _playX - _camX;
var _relY = _playY - _camY;


if _relY <= 100 {
	image_alpha = lerp(image_alpha, 0.25, 0.25);
} else {
	image_alpha = lerp(image_alpha, 1, 0.25);
}

draw_set_font(_font);
draw_set_halign(fa_left);
	//draw_text(80, 0, string(_relX));
	//draw_text(80, 20, string(_relY));
	
	var _score0 = "000000";
	var _actualScore = round(inGameScore);
	var _scoreSprite = spr_HUDScoreSpike;
	
	if _actualScore < 10 {
		_score0 = "000000";
	} else if _actualScore < 100 && _actualScore >= 10 {
		_score0 = "00000";
	} else if _actualScore < 1000 && _actualScore >= 100 {
		_score0 = "0000";
	} else if _actualScore < 10000 && _actualScore >= 1000 {
		_score0 = "000";
	} else if _actualScore < 100000 && _actualScore >= 10000 {
		_score0 = "00";
	} else if _actualScore < 1000000 && _actualScore >= 100000 {
		_score0 = "0";
	} else if _actualScore >= 1000000 {
		_score0 = "";
	}
	
	if global.MIND or global.PlayerChar == 0 {
		_scoreSprite = spr_HUDScoreSpikeHead;
	}
	
	draw_sprite_ext(_arrow, image_index, 103, moveY + 3, 1, 0.5, 0, c_black, image_alpha);
	draw_sprite_ext(sprite_index, image_index, 81, moveY + 11, 0.5, 0.5, 0, c_black, image_alpha);
	draw_sprite_ext(_arrow, image_index, 93, moveY + 29, 1, 0.5, 0, c_black, image_alpha);
	draw_sprite_ext(_scoreSprite, image_index, 60, moveY + 29, 1, 1, 0, c_black, image_alpha);
	
	if global.seconds < 10 && global.minutes < 10 {
		draw_text_transformed_color(97, moveY + 3, string(global.minutes) + ":0" + string(global.seconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, image_alpha);
	} else if global.seconds >= 10 && global.minutes >= 10 {
		draw_text_transformed_color(97, moveY + 3, string(global.minutes) + ":" + string(global.seconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, image_alpha);
	} else if global.seconds < 10 && global.minutes >= 10 {
		draw_text_transformed_color(97, moveY + 3, string(global.minutes) + ":0" + string(global.seconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, image_alpha);
	} else if global.seconds >= 10 && global.minutes < 10 {
		draw_text_transformed_color(97, moveY + 3, string(global.minutes) + ":" + string(global.seconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, image_alpha);
	}
	
	draw_text_transformed_color(87, moveY + 29, string(_score0) + string(_actualScore), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, image_alpha);
	
	
	draw_sprite_ext(_arrow, image_index, 106, moveY, 1, 0.5, 0, global.fullRGB, image_alpha);
	draw_sprite_ext(sprite_index, image_index, 84, moveY + 8, 0.5, 0.5, 0, global.fullRGB, image_alpha);
	
	draw_sprite_ext(_arrow, image_index, 96, moveY + 26, 1, 0.5, 0, global.fullRGB, image_alpha);
	draw_sprite_ext(_scoreSprite, image_index, 63, moveY + 26, 1, 1, 0, global.fullRGB, image_alpha);
	
	if global.seconds < 10 && global.minutes < 10 {
		draw_text_transformed_color(100, moveY, string(global.minutes) + ":0" + string(global.seconds), _xscale, _yscale, _ang, c_white, c_white, c_white, c_white, image_alpha);
	} else if global.seconds >= 10 && global.minutes >= 10 {
		draw_text_transformed_color(100, moveY, string(global.minutes) + ":" + string(global.seconds), _xscale, _yscale, _ang, c_white, c_white, c_white, c_white, image_alpha);
	} else if global.seconds < 10 && global.minutes >= 10 {
		draw_text_transformed_color(100, moveY, string(global.minutes) + ":0" + string(global.seconds), _xscale, _yscale, _ang, c_white, c_white, c_white, c_white, image_alpha);
	} else if global.seconds >= 10 && global.minutes < 10 {
		draw_text_transformed_color(100, moveY, string(global.minutes) + ":" + string(global.seconds), _xscale, _yscale, _ang, c_white, c_white, c_white, c_white, image_alpha);
	}
	
	draw_text_transformed_color(90, moveY + 26, string(_score0) + string(_actualScore), _xscale, _yscale, _ang, c_white, c_white, c_white, c_white, image_alpha);
draw_set_halign(fa_left);
draw_set_font(global.font_main);

if global.speedStageData[global.SpeedSelected].complete {
	var _sprayGap = 22;

	for(var i = 0; i < array_length(global.Secrets); i++) {
		var _col = c_white;
		var _sprite = spr_HUDJSRSprays;
		var _fog = true;
	
		if global.MIND or global.PlayerChar == 0 {
			_sprite = spr_HUDJSRSpraysHead;
		}
	
		if global.Secrets[i] {
			_col = global.fullRGB;
			_fog = false;
		}
	
	
		draw_sprite_ext(_sprite, image_index, 66 + (_sprayGap * i), moveY + 63, 1, 1, 0, c_black, image_alpha);
	
		gpu_set_fog(_fog, _col, 0, 1);
			draw_sprite_ext(_sprite, image_index, 69 + (_sprayGap * i), moveY + 60, 1, 1, 0, _col, image_alpha);
		gpu_set_fog(false, c_black, 0, 1);
	}


	var _cassSprite = spr_HUDCassette;
	var _cassCol = c_white;
	var _cassFog = true;

	if global.speedStageData[global.SpeedSelected].musicSecret {
		_cassCol = global.fullRGB;
		_cassFog = false;
	}

	if global.MIND or global.PlayerChar == 0 {
		_cassSprite = spr_HUDCassetteHead;
	}

	draw_sprite_ext(_cassSprite, image_index, 188, moveY + 63, 1, 1, 0, c_black, image_alpha);

	gpu_set_fog(_cassFog, _cassCol, 0, 1);
		draw_sprite_ext(_cassSprite, image_index, 191, moveY + 60, 1, 1, 0, _cassCol, image_alpha);
	gpu_set_fog(false, c_black, 0, 1);
}


draw_set_halign(fa_center);
draw_set_font(global.LifeFont);
	var _trinketSprite = _charCheck3;
	var _extra0s = "";
	var _ringCol = global.fullRGB;
	
	if global.Rings == 0 {
		if !global.SimplifyVFX {
			if trinkColCheckTimer > 0 {
				trinkColCheckTimer--;
			} else {
				trinkColCheckTimer = 10;
			
				if trinkColCheck {
					trinkColCheck = false;
				} else {
					trinkColCheck = true;
				}
			}
		} else {
			if global.MIND or global.PlayerChar == 0 {
				_ringCol = c_grey;
			} else {
				_ringCol = c_red;
			}
		}
	} else {
		_ringCol = global.fullRGB;
	}
	
	if trinkColCheck && !global.SimplifyVFX && global.Rings == 0 {
		if global.MIND or global.PlayerChar == 0 {
			_ringCol = c_grey;
		} else {
			_ringCol = c_red;
		}
	}
	
	if global.Rings < 10 {
		_extra0s = "00";
	} else if global.Rings < 100 && global.Rings >= 10 {
		_extra0s = "0";
	}
	
	if global.MIND or global.PlayerChar == 0 {
		_trinketSprite = spr_HeadCollectable;
	}
	
	
	draw_sprite_ext(spr_TrinketRing, 0, 28, moveY + 19, trinketScale + 0.5, trinketScale + 0.5, 0, c_black, image_alpha);
	draw_sprite_ext(_trinketSprite, trinketFrames, 19, moveY + 9, 1, 1, 0, c_black, image_alpha);
	draw_text_transformed_color(28, moveY + 25, "x" + string(_extra0s) + string(global.Rings), trinketScale - 0.25, trinketScale - 0.25, 0, c_black, c_black, c_black, c_black, image_alpha);
	
	draw_sprite_ext(spr_TrinketRing, 0, 31, moveY + 16, trinketScale + 0.5, trinketScale + 0.5, 0, _ringCol, image_alpha);
	draw_sprite_ext(_trinketSprite, trinketFrames, 22, moveY + 6, 1, 1, 0, c_white, image_alpha);
	
	draw_text_transformed_color(31, moveY + 22, "x" + string(_extra0s) + string(global.Rings), trinketScale - 0.25, trinketScale - 0.25, 0, c_white, c_white, c_white, _ringCol, image_alpha);
draw_set_font(global.font_main);
draw_set_halign(fa_left);
