var _camX = 0;
var _camY = 0;
var _col = global.fullRGB;
var _xscale = 0.8;
var _yscale = 1;
var _ang = 0;

if global.MIND or global.PlayerChar == 0 {
	_col = c_white;
}

//Draw Background Box
draw_sprite_ext(sprite_index, image_index, _camX - 5, _camY - 5, image_xscale, image_yscale, 0, c_grey, image_alpha);


//Sonic Rush Boss Ball
var _ballAlpha = 1;
var _leftBackAnim = mindImageIndex;

if !global.MIND && global.PlayerChar != 0 {
	_leftBackAnim = 0;
}

draw_sprite_ext(leftBackSprite, _leftBackAnim, _camX + leftBackMoveX + 10, _camY - 10, 1, 1, 0, c_black, 0.5);
draw_sprite_ext(leftBackSprite, _leftBackAnim, _camX + leftBackMoveX, _camY, 1, 1, 0, _col, 1);

draw_sprite_ext(srBallBG, 0, _camX + 470 - 15 + srBallBGMoveX, _camY + 200 + srBallMoveY + 15, 2, 2, 0, c_black, 0.5);
draw_sprite_ext(srBallBG, 0, _camX + 470 + srBallBGMoveX, _camY + 200 + srBallMoveY, 2, 2, 0, _col, 1);
draw_sprite_ext(srBall, 0, _camX + 470 + srBallBGMoveX + srBallMoveX, _camY + 200 + srBallMoveY + -srBallMoveX, 2, 2, srBallRotate, _col, _ballAlpha);


//Text UI
draw_sprite_ext(resultsSprite, mindImageIndex, _camX + resultsMoveX + 5, _camY + 55 + 5, 0.25, 0.25, 0, c_black, 0.5);
draw_sprite_ext(resultsSprite, mindImageIndex, _camX + resultsMoveX, _camY + 55, 0.25, 0.25, 0, _col, 1);

draw_sprite_ext(stageNameSprite, mindImageIndex, _camX + stageNameMoveX + 5, _camY + 100 + 5, 0.25, 0.25, 0, c_black, 0.5);
draw_sprite_ext(stageNameSprite, mindImageIndex, _camX + stageNameMoveX, _camY + 100, 0.25, 0.25, 0, c_white, 1);

draw_sprite_ext(levelNumberSprite, mindImageIndex, _camX + levelNumberMoveX + 5, _camY + 140 + 5, 1, 1, 0, c_black, 0.5);
draw_sprite_ext(levelNumberSprite, mindImageIndex, _camX + levelNumberMoveX, _camY + 140, 1, 1, 0, c_white, 1);


var _font = global.EnemyComboFont;

if global.MIND or global.PlayerChar == 0 {
	_font = global.EnemyComboFontHead;
}

draw_set_font(_font);
if savedSeconds < 10 && savedMinutes < 10 {
	draw_text_transformed_color(_camX + 105 + timeMoveX + 5, _camY + 165 + 5, string(round(savedMinutes)) + ":0" + string(savedSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 0.5);
} else if savedSeconds >= 10 && savedMinutes >= 10 {
	draw_text_transformed_color(_camX + 105 + timeMoveX + 5, _camY + 165 + 5, string(round(savedMinutes)) + ":" + string(savedSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 0.5);
} else if savedSeconds < 10 && savedMinutes >= 10 {
	draw_text_transformed_color(_camX + 105 + timeMoveX + 5, _camY + 165 + 5, string(round(savedMinutes)) + ":0" + string(savedSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 0.5);
} else if savedSeconds >= 10 && savedMinutes < 10 {
	draw_text_transformed_color(_camX + 105 + timeMoveX + 5, _camY + 165 + 5, string(round(savedMinutes)) + ":" + string(savedSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 0.5);
}
	
if savedSeconds < 10 && savedMinutes < 10 {
	draw_text_transformed(_camX + 105 + timeMoveX, _camY + 165, string(round(savedMinutes)) + ":0" + string(savedSeconds), _xscale, _yscale, _ang);
} else if savedSeconds >= 10 && savedMinutes >= 10 {
	draw_text_transformed(_camX + 105 + timeMoveX, _camY + 165, string(round(savedMinutes)) + ":" + string(savedSeconds), _xscale, _yscale, _ang);
} else if savedSeconds < 10 && savedMinutes >= 10 {
	draw_text_transformed(_camX + 105 + timeMoveX, _camY + 165, string(round(savedMinutes)) + ":0" + string(savedSeconds), _xscale, _yscale, _ang);
} else if savedSeconds >= 10 && savedMinutes < 10 {
	draw_text_transformed(_camX + 105 + timeMoveX, _camY + 165, string(round(savedMinutes)) + ":" + string(savedSeconds), _xscale, _yscale, _ang);
}

draw_text_transformed_color(_camX + 125 + timeMoveX + 5, _camY + 195 + 5, string(ceil(savedScore)), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 0.5);
draw_text_transformed(_camX + 125 + timeMoveX, _camY + 195, string(ceil(savedScore)), _xscale, _yscale, _ang);
draw_set_font(global.font_main);

rankFrames += rankAnim;

var _animCheck = 60

if global.MIND or global.PlayerChar == 0 {
	_animCheck = 3;
}

if rankFrames >= _animCheck {
	rankFrames = 0;
}

var _scoreRank = spr_RankFHead;
var _mod2 = global.speedStageData[global.SpeedSelected];
var _totalSeconds = (savedMinutes * 100) + savedSeconds;

if !global.MIND && global.PlayerChar != 0 {
	if _totalSeconds < _mod2.rankD_Time && _totalSeconds >= _mod2.rankC_Time {
		_scoreRank = spr_RankDNew;
	} else if _totalSeconds < _mod2.rankC_Time && _totalSeconds >= _mod2.rankB_Time {
		_scoreRank = spr_RankCNew;
	} else if _totalSeconds < _mod2.rankB_Time && _totalSeconds >= _mod2.rankA_Time {
		_scoreRank = spr_RankBNew;
	} else if _totalSeconds < _mod2.rankA_Time && _totalSeconds >= _mod2.rankS_Time {
		_scoreRank = spr_RankANew;
	} else if _totalSeconds < _mod2.rankS_Time {
		_scoreRank = spr_RankSNew;
	} else {
		_scoreRank = spr_RankFNew;
	}
} else {
	if _totalSeconds < _mod2.rankD_Time && _totalSeconds >= _mod2.rankC_Time {
		_scoreRank = spr_RankDHead;
	} else if _totalSeconds < _mod2.rankC_Time && _totalSeconds >= _mod2.rankB_Time {
		_scoreRank = spr_RankCHead;
	} else if _totalSeconds < _mod2.rankB_Time && _totalSeconds >= _mod2.rankA_Time {
		_scoreRank = spr_RankBHead;
	} else if _totalSeconds < _mod2.rankA_Time && _totalSeconds >= _mod2.rankS_Time {
		_scoreRank = spr_RankAHead;
	} else if _totalSeconds < _mod2.rankS_Time {
		_scoreRank = spr_RankSHead;
	} else {
		_scoreRank = spr_RankFHead;
	}
}


draw_sprite_ext(timeSprite, mindImageIndex, _camX + timeMoveX + 5, _camY + 165 + 2 + 5, 1, 1, 0, c_black, 0.5);
draw_sprite_ext(_scoreRank, rankFrames, _camX + timeMoveX + 220, _camY + 165 + 5, 0.5, 0.5, 0, c_black, 0.5);
draw_sprite_ext(timeSprite, mindImageIndex, _camX + timeMoveX, _camY + 165 + 2, 1, 1, 0, _col, 1);
draw_sprite_ext(_scoreRank, rankFrames, _camX + timeMoveX + 220, _camY + 165, 0.5, 0.5, 0, c_white, 1);


var _timeRank = spr_RankFNew;
var _mod3 = global.speedStageData[global.SpeedSelected];

if !global.MIND && global.PlayerChar != 0 {
	if savedScore >= _mod3.rankD_Score && savedScore < _mod3.rankC_Score {
		_timeRank = spr_RankDNew;
	} else if savedScore >= _mod3.rankC_Score && savedScore < _mod3.rankB_Score {
		_timeRank = spr_RankCNew;
	} else if savedScore >= _mod3.rankB_Score && savedScore < _mod3.rankA_Score {
		_timeRank = spr_RankBNew;
	} else if savedScore >= _mod3.rankA_Score && savedScore < _mod3.rankS_Score {
		_timeRank = spr_RankANew;
	} else if savedScore >= _mod3.rankS_Score {
		_timeRank = spr_RankSNew;
	} else {
		_timeRank = spr_RankFNew;
	}
} else {
	if savedScore >= _mod3.rankD_Score && savedScore < _mod3.rankC_Score {
		_timeRank = spr_RankDHead;
	} else if savedScore >= _mod3.rankC_Score && savedScore < _mod3.rankB_Score {
		_timeRank = spr_RankCHead;
	} else if savedScore >= _mod3.rankB_Score && savedScore < _mod3.rankA_Score {
		_timeRank = spr_RankBHead;
	} else if savedScore >= _mod3.rankA_Score && savedScore < _mod3.rankS_Score {
		_timeRank = spr_RankAHead;
	} else if savedScore >= _mod3.rankS_Score {
		_timeRank = spr_RankSHead;
	} else {
		_timeRank = spr_RankFHead;
	}
}


draw_sprite_ext(scoreSprite, mindImageIndex, _camX + timeMoveX + 5, _camY + 195 + 2 + 5, 1, 1, 0, c_black, 0.5);
draw_sprite_ext(_timeRank, rankFrames, _camX + timeMoveX + 230, _camY + 195 + 5, 0.5, 0.5, 0, c_black, 0.5);
draw_sprite_ext(scoreSprite, mindImageIndex, _camX + timeMoveX, _camY + 195 + 2, 1, 1, 0, _col, 1);
draw_sprite_ext(_timeRank, rankFrames, _camX + timeMoveX + 230, _camY + 195, 0.5, 0.5, 0, c_white, 1);

draw_sprite_ext(rankSprite, mindImageIndex, _camX + rankMoveX + 5, _camY + 280 + 5, 0.5, 0.3, 0, c_black, 0.5);
draw_sprite_ext(rankSprite, mindImageIndex, _camX + rankMoveX, _camY + 280, 0.5, 0.3, 0, _col, 1);

//Player
draw_sprite_ext(playerSprite, playerCostume, _camX + playerMoveX - 15, _camY + 15 + 25, 0.25, 0.25, 0, c_black, 0.5);
draw_sprite_ext(playerSprite, playerCostume, _camX + playerMoveX, _camY + 25, 0.25, 0.25, 0, c_white, 1);

var _rank = spr_RankFHead;
var _mod = global.Rank;

if !global.MIND && global.PlayerChar != 0 {
	if _mod == -1 or _mod == 0 {
		_rank = spr_RankFNew;
	} else if _mod == 1 {
		_rank = spr_RankDNew;
	} else if _mod == 2 {
		_rank = spr_RankCNew;
	} else if _mod == 3 {
		_rank = spr_RankBNew;
	} else if _mod == 4 {
		_rank = spr_RankANew;
	} else if _mod == 5 {
		_rank = spr_RankSNew;
	} else if _mod == 6 {
		_rank = spr_RankPNew;
	}
} else {
	if _mod == -1 or _mod == 0 {
		_rank = spr_RankFHead;
	} else if _mod == 1 {
		_rank = spr_RankDHead;
	} else if _mod == 2 {
		_rank = spr_RankCHead;
	} else if _mod == 3 {
		_rank = spr_RankBHead;
	} else if _mod == 4 {
		_rank = spr_RankAHead;
	} else if _mod == 5 {
		_rank = spr_RankSHead;
	} else if _mod == 6 {
		_rank = spr_RankPHead;
	}
}

if createRank {
	draw_sprite_ext(_rank, rankFrames, _camX + rankShakeX + rankAltX + 220 + 5, _camY + rankShakeY + 255 + 5, 1 + rankSize, 1 + rankSize, 0, c_black, 0.5);
	draw_sprite_ext(_rank, rankFrames, _camX + rankShakeX + rankAltX + 220, _camY + rankShakeY + 255, 1 + rankSize, 1 + rankSize, 0, c_white, 1);
}

//Draw Sonic Rush Spikes
draw_sprite_ext(srSpikes, srSpikesImageIndex, _camX + 640 + 10, _camY + moveUp + 10, 2.75, 2.75, -90, c_black, 0.5);
draw_sprite_ext(srSpikes, srSpikesImageIndexBack, _camX + 640 + 10, _camY + moveDown - 10, 2.75, -2.75, 90, c_black, 0.5);
draw_sprite_ext(srSpikes, srSpikesImageIndex, _camX + moveRight + 10, _camY + 10, 2.75, 2.75, 0, c_black, 0.5);

draw_sprite_ext(srSpikes, srSpikesImageIndex, _camX + 640, _camY + moveUp, 2.75, 2.75, -90, _col, 1);
draw_sprite_ext(srSpikes, srSpikesImageIndexBack, _camX + 640, _camY + moveDown, 2.75, -2.75, 90, _col, 1);
draw_sprite_ext(srSpikes, srSpikesImageIndex, _camX + moveRight, _camY, 2.75, 2.75, 0, _col, 1);


var _return = "RETURN";
var _retry = "RETRY";

if rankSize == 0 {
	var _button = obj_CustomAct1KeySpeed.sprite_index;
	var _retryText = "results_Retry";
	var _retryWidth = string_width(scr_LocalText(_retryText));
	
	var _continueText = "title_Continue";
	var _continueWidth = string_width(scr_LocalText(_continueText));
	
	var _ghostText = "results_Ghost";
	var _replayText = "results_Replay";
	
	if ghostGotSaved {
		_ghostText = "results_GhostSaved";
	}
	
	var _ghostWidth = string_width(scr_LocalText(_ghostText));
	
	if replayGotSaved {
		_replayText = "results_ReplaySaved";
	}
	
	var _replayWidth = string_width(scr_LocalText(_replayText));
	
	
	draw_set_halign(fa_right);
		#region //Retry
			draw_sprite_ext(_button, obj_CustomAct1KeySpeed.image_index, _camX + 570 - _retryWidth, _camY + 345, 1, 1, 0, c_white, image_alpha * 2);
			draw_text_transformed_color(_camX + 635, _camY + 335, scr_LocalText(_retryText), 1, 1, 0, c_white, c_white, c_white, c_white, image_alpha * 2);
		#endregion
		
		#region //Continue
			draw_sprite_ext(_button, obj_CustomJumpKeySpeed.image_index, _camX + 570 - _continueWidth, _camY + 310, 1, 1, 0, c_white, image_alpha * 2);
			draw_text_transformed_color(_camX + 635, _camY + 300, scr_LocalText(_continueText), 1, 1, 0, c_white, c_white, c_white, c_white, image_alpha * 2);
		#endregion
		
		#region //Replay
			if !replayGotSaved {
				draw_sprite_ext(_button, obj_CustomAct2KeySpeed.image_index, _camX + 570 - _replayWidth, _camY + 20, 1, 1, 0, c_white, image_alpha * 2);
			}
			
			draw_text_transformed_color(_camX + 635, _camY + 10, scr_LocalText(_replayText), 1, 1, 0, c_white, c_white, c_white, c_white, image_alpha * 2);
		#endregion
		
		#region //Ghost
			if !ghostGotSaved {
				draw_sprite_ext(_button, obj_CustomAct4KeySpeed.image_index, _camX + 570 - _ghostWidth, _camY + 55, 1, 1, 0, c_white, image_alpha * 2);
			}
			
			draw_text_transformed_color(_camX + 635, _camY + 45, scr_LocalText(_ghostText), 1, 1, 0, c_white, c_white, c_white, c_white, image_alpha * 2);
		#endregion
	draw_set_halign(fa_left);
}



