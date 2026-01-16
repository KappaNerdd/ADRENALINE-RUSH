display_set_gui_size(768, 432);

var _fontX = 55;
	
if global.PartnerChar != -1 && global.Partner2Char != -1 {
	_fontX = 105;
} else if global.PartnerChar != -1 && global.Partner2Char == -1 {
	_fontX = 75;
} else if global.PartnerChar == -1 && global.Partner2Char == -1 {
	_fontX = 45;
}

var _nameString = scr_LocalText(global.PlayerSelection[global.PlayerChar][0][2]);
var _stringWidth = string_width(_nameString);

draw_text_color(_fontX + 9, yMove + 341, _nameString, c_black, c_black, c_black, c_black, image_alpha);

draw_set_font(global.LifeFont);
	if !global.Freeplay {
		draw_text_color(_fontX + 17 + _stringWidth, yMove + 343, "x" + string(global.PlayerExtraLives), c_black, c_black, c_black, c_black, image_alpha);
		draw_text_color(_fontX + 20 + _stringWidth, yMove + 340, "x" + string(global.PlayerExtraLives), c_white, c_white, c_white, global.fullRGB, image_alpha);
	}
draw_set_font(global.font_main);

draw_text_color(_fontX + 12, yMove + 338, _nameString , c_white, c_white, c_white, global.fullRGB, image_alpha);

#region //Health
	var _extraX = -5;
	var _extraY = 335 + yMove;
	
	if global.Freeplay {
		_extraY = 335 + yMove;
	}

	draw_sprite_ext(spr_HealthSmallInactive, healthIndex, _extraX + 67, _extraY + 3, 1, 1, 0, c_black, image_alpha);
	draw_sprite_ext(spr_Health2ndSmallDeactive, healthIndex, _extraX + 79, _extraY + 3, 1, 1, 0, c_black, image_alpha);
	draw_sprite_ext(spr_HealthMidInactive, healthIndex, _extraX + 89, _extraY + 3, 1, 1, 0, c_black, image_alpha);
	draw_sprite_ext(spr_Health2ndLargeInactive, healthIndex, _extraX + 100, _extraY + 3, 1, 1, 0, c_black, image_alpha);
	draw_sprite_ext(spr_HealthLargeInactive, healthIndex, _extraX + 111, _extraY + 3, 1, 1, 0, c_black, image_alpha);
	draw_sprite_ext(spr_HealthLargeInactive, healthIndex, _extraX + 122, _extraY + 3, 1, 1, 0, c_black, image_alpha);
	draw_sprite_ext(spr_HealthLargeInactive, healthIndex, _extraX + 133, _extraY + 3, 1, 1, 0, c_black, image_alpha);
	draw_sprite_ext(spr_HealthLargeInactive, healthIndex, _extraX + 144, _extraY + 3, 1, 1, 0, c_black, image_alpha);
	draw_sprite_ext(spr_HealthLargeInactive, healthIndex, _extraX + 155, _extraY + 3, 1, 1, 0, c_black, image_alpha);
	draw_sprite_ext(spr_HealthLargeInactive, healthIndex, _extraX + 166, _extraY + 3, 1, 1, 0, c_black, image_alpha);

	draw_sprite_ext(spr_HealthSmallInactive, healthIndex, _extraX + 70, _extraY, 1, 1, 0, c_white, image_alpha);
	draw_sprite_ext(spr_Health2ndSmallDeactive, healthIndex, _extraX + 81, _extraY, 1, 1, 0, c_white, image_alpha);
	draw_sprite_ext(spr_HealthMidInactive, healthIndex, _extraX + 92, _extraY, 1, 1, 0, c_white, image_alpha);
	draw_sprite_ext(spr_Health2ndLargeInactive, healthIndex, _extraX + 103, _extraY, 1, 1, 0, c_white, image_alpha);
	draw_sprite_ext(spr_HealthLargeInactive, healthIndex, _extraX + 114, _extraY, 1, 1, 0, c_white, image_alpha);
	draw_sprite_ext(spr_HealthLargeInactive, healthIndex, _extraX + 125, _extraY, 1, 1, 0, c_white, image_alpha);
	draw_sprite_ext(spr_HealthLargeInactive, healthIndex, _extraX + 136, _extraY, 1, 1, 0, c_white, image_alpha);
	draw_sprite_ext(spr_HealthLargeInactive, healthIndex, _extraX + 147, _extraY, 1, 1, 0, c_white, image_alpha);
	draw_sprite_ext(spr_HealthLargeInactive, healthIndex, _extraX + 158, _extraY, 1, 1, 0, c_white, image_alpha);
	draw_sprite_ext(spr_HealthLargeInactive, healthIndex, _extraX + 169, _extraY, 1, 1, 0, c_white, image_alpha);

	#region //1
		var _scaleChange1 = 1.5;
		
		if global.Health >= 100000 {
			draw_sprite_ext(spr_HealthSmallActive, healthIndex, _extraX + 70, _extraY, 1, 1, 0, global.fullRGB, image_alpha);
		}
		
		if healthHurt && healthHurtTimer > 0 && global.Health < 100000 {
			draw_sprite_ext(spr_HealthSmallDamage, healthIndex, _extraX + 70, _extraY, 1, _scaleChange1, 0, c_white, 1);
		}
	#endregion
	
	#region //2
		if global.Health >= 200000 {
			draw_sprite_ext(spr_Health2ndSmallActive, healthIndex, _extraX + 81, _extraY, 1, 1, 0, global.fullRGB, image_alpha);
			
			if healthHurt && healthHurtTimer > 0 && global.Health < 200000 && global.Health >= 100000 {
				draw_sprite_ext(spr_Health2ndSmallDamage, healthIndex, _extraX + 81, _extraY, 1, _scaleChange1, 0, c_white, 1);
			}
		}
	#endregion
	
	#region //3
		if global.Health >= 300000 {
			draw_sprite_ext(spr_HealthMidActive, healthIndex, _extraX + 92, _extraY, 1, 1, 0, global.fullRGB, image_alpha);
			
			if healthHurt && healthHurtTimer > 0 && global.Health < 300000 && global.Health >= 200000 {
				draw_sprite_ext(spr_HealthMidDamage, healthIndex, _extraX + 92, _extraY, 1, _scaleChange1, 0, c_white, 1);
			}
		}
	#endregion
	
	#region //4
		if global.Health >= 400000 {
			draw_sprite_ext(spr_Health2ndLargeActive, healthIndex, _extraX + 103, _extraY, 1, 1, 0, global.fullRGB, image_alpha);
			
			if healthHurt && healthHurtTimer > 0 && global.Health < 400000 && global.Health >= 300000 {
				draw_sprite_ext(spr_Health2ndLargeDamage, healthIndex, _extraX + 103, _extraY, 1, _scaleChange1, 0, c_white, 1);
			}
		}
	#endregion
	
	#region //5
		if global.Health >= 500000 {
			draw_sprite_ext(spr_HealthLargeActive, healthIndex, _extraX + 114, _extraY, 1, 1, 0, global.fullRGB, image_alpha);
			
			if healthHurt && healthHurtTimer > 0 && global.Health < 500000 && global.Health >= 400000 {
				draw_sprite_ext(spr_HealthLargeDamage, healthIndex, _extraX + 114, _extraY, 1, _scaleChange1, 0, c_white, 1);
			}
		}
	#endregion
	
	#region //6
		if global.Health >= 600000 {
			draw_sprite_ext(spr_HealthLargeActive, healthIndex, _extraX + 125, _extraY, 1, 1, 0, global.fullRGB, image_alpha);
			
			if healthHurt && healthHurtTimer > 0 && global.Health < 600000 && global.Health >= 500000 {
				draw_sprite_ext(spr_HealthLargeDamage, healthIndex, _extraX + 125, _extraY, 1, _scaleChange1, 0, c_white, 1);
			}
		}
	#endregion
	
	#region //7
		if global.Health >= 700000 {
			draw_sprite_ext(spr_HealthLargeActive, healthIndex, _extraX + 136, _extraY, 1, 1, 0, global.fullRGB, image_alpha);
			
			if healthHurt && healthHurtTimer > 0 && global.Health < 700000 && global.Health >= 600000 {
				draw_sprite_ext(spr_HealthLargeDamage, healthIndex, _extraX + 136, _extraY, 1, _scaleChange1, 0, c_white, 1);
			}
		}
	#endregion
	
	#region //8
		if global.Health >= 800000 {
			draw_sprite_ext(spr_HealthLargeActive, healthIndex, _extraX + 147, _extraY, 1, 1, 0, global.fullRGB, image_alpha);
			
			if healthHurt && healthHurtTimer > 0 && global.Health < 800000 && global.Health >= 700000 {
				draw_sprite_ext(spr_HealthLargeDamage, healthIndex, _extraX + 147, _extraY, 1, _scaleChange1, 0, c_white, 1);
			}
		}
	#endregion
	
	#region //9
		if global.Health >= 900000 {
			draw_sprite_ext(spr_HealthLargeActive, healthIndex, _extraX + 158, _extraY, 1, 1, 0, global.fullRGB, image_alpha);
			
			if healthHurt && healthHurtTimer > 0 && global.Health < 900000 && global.Health >= 800000 {
				draw_sprite_ext(spr_HealthLargeDamage, healthIndex, _extraX + 158, _extraY, 1, _scaleChange1, 0, c_white, 1);
			}
		}
	#endregion
	
	#region //10
		if global.Health >= global.MaxHealth {
			draw_sprite_ext(spr_HealthLargeActive, healthIndex, _extraX + 169, _extraY, 1, 1, 0, global.fullRGB, image_alpha);
		}
	#endregion
#endregion

var _textCol = global.fullRGB;
var _normCol = c_white;

if global.Health <= global.MaxHealth / 4 {
	_textCol = c_red;
	_normCol = c_red;
}

//draw_text_transformed_color(55, 295, "+" + string(global.Health), 0.8, 1, 0, _normCol, _normCol, _textCol, _textCol, 1);

draw_sprite_ext(sprite_index, image_index, 2, yMove + 313, lifeScale, lifeScale, 0, c_black, image_alpha);
draw_sprite_ext(sprite_index, image_index, 5, yMove + 310, lifeScale, lifeScale, 0, c_white, image_alpha);

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


if _relY >= 330 {
	image_alpha = lerp(image_alpha, 0.5, 0.5);
} else {
	image_alpha = lerp(image_alpha, 1, 0.25);
}

//How're you doin'?

//Who's your favorite Sonic character?

//Mine used to be Silver, but then I replayed my favorite game of all time and its sequel,
//those being Sonic Rush and Sonic Rush Adventure, forgot how cool Blaze really is.

//Tl;dr, my favorite character is now Blaze.