getCharacterControls();

var _xOff = x - 25;
var _yOff = y;
var _spacing = scrollSpacing;

for (var i = 0; i < array_length(global.speedStageData); i++) {
	var _mod = global.speedStageData[i];
	var _drawX = _xOff + (i * -_spacing) + scrollOffset;
    var _drawY = _yOff + (i * _spacing) - scrollOffset;
	var _drawAng = 0 + i - scrollOffset;
    
	var _hoveredCol = c_white;
			
	if !_mod.locked {
		if !confirmed {
			if i == global.SpeedSelected {
				_hoveredCol = global.fullRGB;
			} else {
				_hoveredCol = c_white;
			}
		} else {	
			if i == global.SpeedSelected {
				_hoveredCol = image_blend;
			} else {
				_hoveredCol = c_white;
			}
		}
	} else {
		if i == global.SpeedSelected {
			_hoveredCol = c_white;
		
			if jump_Key {
				_hoveredCol = c_red;
			}
		} else {
			_hoveredCol = c_grey;
		}
	}
	
	draw_sprite_ext(spr_TextboxHead, image_index, _drawX, _drawY, image_xscale, image_yscale, 0, _hoveredCol, 1);
	draw_sprite_ext(sprite_index, image_index, _drawX, _drawY, image_xscale, image_yscale, 0, _hoveredCol, 0.5);
	
	//Stage Name and Level Number
	if !_mod.locked {
		var _xScale = 1;
		
		if string_length(string(_mod.stage_Type) + " " + string(_mod.level_Num)) > 9 {
			_xScale = 0.75;
		}
		
		draw_text_transformed_color(_drawX + 50, _drawY + 6, string(_mod.stage_Name), 1, 1, 0, c_white, c_white, _hoveredCol, _hoveredCol, 1);
		draw_text_transformed_color(_drawX + 50, _drawY + 68, string(_mod.stage_Type) + " " + string(_mod.level_Num), _xScale, 1, 0, c_white, c_white, _hoveredCol, _hoveredCol, 1);
	} else {
		var _lockedAngle = 0;
		var _lockedScale = 1;
		var _lockedSubImg = 0;
		
		if pressedLock {
			if i == global.SpeedSelected {
				if !global.SimplifyVFX {
					_lockedAngle = random_range(-10, 10);
					_lockedScale = random_range(1.1, 1.5);
					_lockedSubImg = lockedSubImg;
				}
				
				lockedSubImg += 1 / 3;
			}
		}
		
		if lockedSubImg >= 5 {
			lockedSubImg = 0;
			pressedLock = false;
		}
		
		draw_sprite_ext(spr_FreeplayLock, _lockedSubImg, _drawX + 110, _drawY + 48, _lockedScale, _lockedScale, _lockedAngle, c_white, 1);
	}
	
	draw_set_halign(fa_right);
		//Saved Time
		if _mod.seconds < 10 && _mod.minutes < 10 {
			draw_text_color(_drawX + 280, _drawY + 68, string(_mod.minutes) + ":0" + string(_mod.seconds), c_white, c_white, _hoveredCol, _hoveredCol, 1);
		} else if _mod.seconds >= 10 && _mod.minutes >= 10 {
			draw_text_color(_drawX + 280, _drawY + 68, string(_mod.minutes) + ":" + string(_mod.seconds), c_white, c_white, _hoveredCol, _hoveredCol, 1);
		} else if _mod.seconds < 10 && _mod.minutes >= 10 {
			draw_text_color(_drawX + 280, _drawY + 68, string(_mod.minutes) + ":0" + string(_mod.seconds), c_white, c_white, _hoveredCol, _hoveredCol, 1);
		} else if _mod.seconds >= 10 && _mod.minutes < 10 {
			draw_text_color(_drawX + 280, _drawY + 68, string(_mod.minutes) + ":" + string(_mod.seconds), c_white, c_white, _hoveredCol, _hoveredCol, 1);
		}
		
		
		//Saved Score
		var _score0 = "000000";
		var _actualScore = _mod.gameScore;
		
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
		
		draw_text_transformed_color(_drawX + 280, _drawY + 32, string(_score0) + string(round(_actualScore)), 1, 1, 0, c_white, c_white, _hoveredCol, _hoveredCol, 1);
	draw_set_halign(fa_left);
	
	//Player
	if _mod.complete {
		draw_sprite_ext(_mod.player_Sprite, _mod.player_Costume, _drawX + 5, _drawY + 5, 0.75, 0.75, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_StageCharNone, 0, _drawX + 5, _drawY + 5, 0.75, 0.75, 0, c_white, 1);
	}
	
	//Rank
	var _rank = spr_RankFHead;

	if _mod.rank == -1 or _mod.rank == 0 {
		_rank = spr_RankFNew;
	} else if _mod.rank == 1 {
		_rank = spr_RankDNew;
	} else if _mod.rank == 2 {
		_rank = spr_RankCNew;
	} else if _mod.rank == 3 {
		_rank = spr_RankBNew;
	} else if _mod.rank == 4 {
		_rank = spr_RankANew;
	} else if _mod.rank == 5 {
		_rank = spr_RankSNew;
	} else if _mod.rank == 6 {
		_rank = spr_RankPNew;
	}
	
	draw_sprite_ext(_rank, imageProgress, _drawX + 5, _drawY + 53, 0.75, 0.75, 0, c_white, 1);
	
	
	//Rank Time
	var _rankTime = spr_RankFHead;

	if _mod.rankTime == -1 or _mod.rankTime == 0 {
		_rankTime = spr_RankFNew;
	} else if _mod.rankTime == 1 {
		_rankTime = spr_RankDNew;
	} else if _mod.rankTime == 2 {
		_rankTime = spr_RankCNew;
	} else if _mod.rankTime == 3 {
		_rankTime = spr_RankBNew;
	} else if _mod.rankTime == 4 {
		_rankTime = spr_RankANew;
	} else if _mod.rankTime == 5 {
		_rankTime = spr_RankSNew;
	} else if _mod.rankTime == 6 {
		_rankTime = spr_RankPNew;
	}
	
	draw_sprite_ext(_mod.player_SpriteTime, _mod.player_CostumeTime, _drawX + 140, _drawY + 65, 0.5, 0.5, 0, c_white, 1);
	draw_sprite_ext(_rankTime, imageProgress, _drawX + 170, _drawY + 65, 0.5, 0.5, 0, c_white, 1);
	
	
	//Rank Score
	var _rankScore = spr_RankFHead;

	if _mod.rankScore == -1 or _mod.rankScore == 0 {
		_rankScore = spr_RankFNew;
	} else if _mod.rankScore == 1 {
		_rankScore = spr_RankDNew;
	} else if _mod.rankScore == 2 {
		_rankScore = spr_RankCNew;
	} else if _mod.rankScore == 3 {
		_rankScore = spr_RankBNew;
	} else if _mod.rankScore == 4 {
		_rankScore = spr_RankANew;
	} else if _mod.rankScore == 5 {
		_rankScore = spr_RankSNew;
	} else if _mod.rankScore == 6 {
		_rankScore = spr_RankPNew;
	}
	
	draw_sprite_ext(_mod.player_SpriteScore, _mod.player_CostumeScore, _drawX + 140, _drawY + 30, 0.5, 0.5, 0, c_white, 1);
	draw_sprite_ext(_rankScore, imageProgress, _drawX + 170, _drawY + 30, 0.5, 0.5, 0, c_white, 1);
	
	if i == global.SpeedSelected {
		if !confirmed {
			var _musicText = "PLAY TRACK";
					
			if action2_Key {
				if !_mod.locked {
					if !musicPlay {
						musicPlay = true;
						obj_SFXManager.menuPop = true;
					
						instance_create_depth(x, y, depth, obj_MusicTag);
					} else {
						musicPlay = false;
						obj_SFXManager.menuTap = true;
					
						instance_create_depth(x, y, depth, obj_MusicTag);
					}
				}
			}
			
			if !_mod.locked && (obj_FreeplaySpeedStages.speedStageActive) && !confirmed {
				if musicPlay {
					_musicText = "STOP TRACK";
				
					if !global.Girly {
						set_song_ingame(global.speedStageData[global.SpeedSelected].musicTrack, 60, 60);
					} else {
						set_song_ingame(global.speedStageData[global.SpeedSelected].musicTrackGirly, 60, 60);
					}
				} else {
					_musicText = "PLAY TRACK";
				
					set_song_ingame(global.PlayerSelection[global.PlayerChar][20], 60, 60);
				}
			
				draw_sprite_ext(obj_CustomAct3KeySpeed.sprite_index, obj_CustomAct3KeySpeed.image_index, _drawX - 110, _drawY - 35, 1, 1,0, c_white, 1);
				draw_text(_drawX - 40, _drawY - 40, string(_musicText));
			}
		}
	}
}

