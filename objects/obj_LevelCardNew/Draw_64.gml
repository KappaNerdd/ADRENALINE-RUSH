var _camX = 0;
var _camY = 0;
var _col = global.fullRGB;

if global.MIND or global.PlayerChar == 0 {
	_col = c_white;
}

//Draw Background Box
draw_sprite_ext(sprite_index, image_index, _camX - 5, _camY - 5, image_xscale, image_yscale, 0, c_grey, image_alpha);

//Sonic Rush Boss Ball
var _ballAlpha = 1;

draw_sprite_ext(srBallBG, 0, _camX + 450 - 15 + srBallBGMoveX, _camY + 200 + srBallMoveY + 15, 2, 2, 0, c_black, 0.5);
draw_sprite_ext(srBallBG, 0, _camX + 450 + srBallBGMoveX, _camY + 200 + srBallMoveY, 2, 2, 0, _col, 1);
draw_sprite_ext(srBall, 0, _camX + 450 + srBallBGMoveX + srBallMoveX, _camY + 200 + srBallMoveY + -srBallMoveX, 2, 2, srBallRotate, _col, _ballAlpha);


//Player
draw_sprite_ext(playerSprite, playerCostume, _camX + playerMoveX - 15, _camY + 15 + 25, 0.25, 0.25, 0, c_black, 0.5);
draw_sprite_ext(playerSprite, playerCostume, _camX + playerMoveX, _camY + 25, 0.25, 0.25, 0, c_white, 1);


//Draw Stage Name, Level Type, & Level Num
draw_sprite_ext(stageNameSprite, mindImageIndex, _camX + stageNameMoveX + 4, _camY + 70 + 4, 0.5, 0.5, 0, c_black, 0.5);
draw_sprite_ext(levelTypeSprite, mindImageIndex, _camX + levelTypeMoveX + 4, _camY + 150 + 4, 1, 1, 0, c_black, 0.5);
draw_sprite_ext(levelNumberSprite, mindImageIndex, _camX + levelNumberMoveX + 4, _camY + 180 + 4, 1, 1, 0, c_black, 0.5);

draw_sprite_ext(stageNameSprite, mindImageIndex, _camX + stageNameMoveX, _camY + 70, 0.5, 0.5, 0, c_white, 1);
draw_sprite_ext(levelTypeSprite, mindImageIndex, _camX + levelTypeMoveX, _camY + 150, 1, 1, 0, c_white, 1);
draw_sprite_ext(levelNumberSprite, mindImageIndex, _camX + levelNumberMoveX, _camY + 180, 1, 1, 0, c_white, 1);


//Best Time & Rank
var _ang = 0;
var _xscale = 1;
var _yscale = 1;
var _font = global.EnemyComboFont;

if global.MIND or global.PlayerChar == 0 {
	_font = global.EnemyComboFontHead;
}

draw_set_font(_font);
draw_set_halign(fa_left);
	if savedSeconds < 10 && savedMinutes < 10 {
		draw_text_transformed_color(_camX + 60 + 5, _camY + savedMoveY + 5 - 20, string(savedMinutes) + ":0" + string(savedSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 0.5);
	} else if savedSeconds >= 10 && savedMinutes >= 10 {
		draw_text_transformed_color(_camX + 60 + 5, _camY + savedMoveY + 5 - 20, string(savedMinutes) + ":" + string(savedSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 0.5);
	} else if savedSeconds < 10 && savedMinutes >= 10 {
		draw_text_transformed_color(_camX + 60 + 5, _camY + savedMoveY + 5 - 20, string(savedMinutes) + ":0" + string(savedSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 0.5);
	} else if savedSeconds >= 10 && savedMinutes < 10 {
		draw_text_transformed_color(_camX + 60 + 5, _camY + savedMoveY + 5 - 20, string(savedMinutes) + ":" + string(savedSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 0.5);
	}
	
	if savedSeconds < 10 && savedMinutes < 10 {
		draw_text_transformed(_camX + 60, _camY + savedMoveY - 20, string(savedMinutes) + ":0" + string(savedSeconds), _xscale, _yscale, _ang);
	} else if savedSeconds >= 10 && savedMinutes >= 10 {
		draw_text_transformed(_camX + 60, _camY + savedMoveY - 20, string(savedMinutes) + ":" + string(savedSeconds), _xscale, _yscale, _ang);
	} else if savedSeconds < 10 && savedMinutes >= 10 {
		draw_text_transformed(_camX + 60, _camY + savedMoveY - 20, string(savedMinutes) + ":0" + string(savedSeconds), _xscale, _yscale, _ang);
	} else if savedSeconds >= 10 && savedMinutes < 10 {
		draw_text_transformed(_camX + 60, _camY + savedMoveY - 20, string(savedMinutes) + ":" + string(savedSeconds), _xscale, _yscale, _ang);
	}
	
	//Saved Score
	var _score0 = "000000";
	var _actualScore = savedScore;
		
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
	
	draw_text_transformed_color(_camX + 65, _camY + 45 + savedMoveY, string(_score0) + string(round(_actualScore)), _xscale, _yscale, 0, c_black, c_black, c_black, c_black, 0.5);
	draw_text_transformed_color(_camX + 60, _camY + 40 + savedMoveY, string(_score0) + string(round(_actualScore)), _xscale, _yscale, 0, c_white, c_white, c_white, c_white, 1);
draw_set_halign(fa_left);
draw_set_font(global.font_main);

var _rank = spr_RankFHead;
var _rank2 = spr_RankFHead;
var _rank3 = spr_RankFHead;
var _mod = global.speedStageData[global.SpeedSelected];

if !global.MIND && global.PlayerChar != 0 {
	if _mod.rankTime == -1 or _mod.rankTime == 0 {
		_rank2 = spr_RankFNew;
	} else if _mod.rankTime == 1 {
		_rank2 = spr_RankDNew;
	} else if _mod.rankTime == 2 {
		_rank2 = spr_RankCNew;
	} else if _mod.rankTime == 3 {
		_rank2 = spr_RankBNew;
	} else if _mod.rankTime == 4 {
		_rank2 = spr_RankANew;
	} else if _mod.rankTime == 5 {
		_rank2 = spr_RankSNew;
	} else if _mod.rankTime == 6 {
		_rank2 = spr_RankPNew;
	}
} else {
	if _mod.rankTime == -1 or _mod.rankTime == 0 {
		_rank2 = spr_RankFHead;
	} else if _mod.rankTime == 1 {
		_rank2 = spr_RankDHead;
	} else if _mod.rankTime == 2 {
		_rank2 = spr_RankCHead;
	} else if _mod.rankTime == 3 {
		_rank2 = spr_RankBHead;
	} else if _mod.rankTime == 4 {
		_rank2 = spr_RankAHead;
	} else if _mod.rankTime == 5 {
		_rank2 = spr_RankSHead;
	} else if _mod.rankTime == 6 {
		_rank2 = spr_RankPHead;
	}
}

if !global.MIND && global.PlayerChar != 0 {
	if _mod.rankScore == -1 or _mod.rankScore == 0 {
		_rank3 = spr_RankFNew;
	} else if _mod.rankScore == 1 {
		_rank3 = spr_RankDNew;
	} else if _mod.rankScore == 2 {
		_rank3 = spr_RankCNew;
	} else if _mod.rankScore == 3 {
		_rank3 = spr_RankBNew;
	} else if _mod.rankScore == 4 {
		_rank3 = spr_RankANew;
	} else if _mod.rankScore == 5 {
		_rank3 = spr_RankSNew;
	} else if _mod.rankScore == 6 {
		_rank3 = spr_RankPNew;
	}
} else {
	if _mod.rankScore == -1 or _mod.rankScore == 0 {
		_rank3 = spr_RankFHead;
	} else if _mod.rankScore == 1 {
		_rank3 = spr_RankDHead;
	} else if _mod.rankScore == 2 {
		_rank3 = spr_RankCHead;
	} else if _mod.rankScore == 3 {
		_rank3 = spr_RankBHead;
	} else if _mod.rankScore == 4 {
		_rank3 = spr_RankAHead;
	} else if _mod.rankScore == 5 {
		_rank3 = spr_RankSHead;
	} else if _mod.rankScore == 6 {
		_rank3 = spr_RankPHead;
	}
}

if !global.MIND && global.PlayerChar != 0 {
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
} else {
	if _mod.rank == -1 or _mod.rank == 0 {
		_rank = spr_RankFHead;
	} else if _mod.rank == 1 {
		_rank = spr_RankDHead;
	} else if _mod.rank == 2 {
		_rank = spr_RankCHead;
	} else if _mod.rank == 3 {
		_rank = spr_RankBHead;
	} else if _mod.rank == 4 {
		_rank = spr_RankAHead;
	} else if _mod.rank == 5 {
		_rank = spr_RankSHead;
	} else if _mod.rank == 6 {
		_rank = spr_RankPHead;
	}
}

draw_sprite_ext(_rank2, 0, _camX + 200 + 5, _camY - 39 + savedMoveY + 5, 0.5, 0.5, 0, c_black, 0.5);
draw_sprite_ext(savedCharTime, savedCostumeTime, _camX + 200 + 5, _camY - 13 + savedMoveY + 5, 0.5, 0.5, 0, c_black, 0.5);

draw_sprite_ext(_rank3, 0, _camX + 200 + 5, _camY + 27 + savedMoveY + 5, 0.5, 0.5, 0, c_black, 0.5);
draw_sprite_ext(savedCharScore, savedCostumeScore, _camX + 200 + 5, _camY + 53 + savedMoveY + 5, 0.5, 0.5, 0, c_black, 0.5);

draw_sprite_ext(_rank2, 0, _camX + 200, _camY - 39 + savedMoveY, 0.5, 0.5, 0, c_white, 1);
draw_sprite_ext(savedCharTime, savedCostumeTime, _camX + 200, _camY - 13 + savedMoveY, 0.5, 0.5, 0, c_white, 1);

draw_sprite_ext(_rank3, 0, _camX + 200, _camY + 27 + savedMoveY, 0.5, 0.5, 0, c_white, 1);
draw_sprite_ext(savedCharScore, savedCostumeScore, _camX + 200, _camY + 53 + savedMoveY, 0.5, 0.5, 0, c_white, 1);

draw_sprite_ext(_rank, 0, _camX + 240 + 5, _camY + savedMoveY - 30 + 5, 1, 1, 0, c_black, 0.5);
draw_sprite_ext(savedChar, savedCostume, _camX + 240 + 5, _camY + savedMoveY + 20 + 5, 1, 1, 0, c_black, 0.5);

draw_sprite_ext(_rank, 0, _camX + 240, _camY + savedMoveY - 30, 1, 1, 0, c_white, 1);
draw_sprite_ext(savedChar, savedCostume, _camX + 240, _camY + savedMoveY + 20, 1, 1, 0, c_white, 1);

//Draw Sonic Rush Spikes
draw_sprite_ext(srSpikes, srSpikesImageIndex, _camX + 640 + 10, _camY + moveUp + 10, 2.75, 2.75, -90, c_black, 0.5);
draw_sprite_ext(srSpikes, srSpikesImageIndexBack, _camX + 640 + 10, _camY + moveDown - 10, 2.75, -2.75, 90, c_black, 0.5);
draw_sprite_ext(srSpikes, srSpikesImageIndex, _camX + moveRight + 10, _camY + 10, 2.75, 2.75, 0, c_black, 0.5);

draw_sprite_ext(srSpikes, srSpikesImageIndex, _camX + 640, _camY + moveUp, 2.75, 2.75, -90, _col, 1);
draw_sprite_ext(srSpikes, srSpikesImageIndexBack, _camX + 640, _camY + moveDown, 2.75, -2.75, 90, _col, 1);
draw_sprite_ext(srSpikes, srSpikesImageIndex, _camX + moveRight, _camY, 2.75, 2.75, 0, _col, 1);
