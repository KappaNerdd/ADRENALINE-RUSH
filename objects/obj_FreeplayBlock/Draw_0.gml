/*//Back Box
var _col = c_white;

if locked {
	_col = c_grey;
} else {
	if !confirmed {
		if place_meeting(x, y, obj_TitleCursor) {
			if global.PlayerChar != 0 {
				_col = global.fullRGB;
			}
		} else {
			_col = c_white;
		}
	} else {
		if global.PlayerChar != 0 {
			if confirmedBlue && !global.SimplifyVFX {
				_col = c_white;
			} else {
				_col = global.fullRGB;
			}
		}
	}
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, _col, 1);


//Stage Name
draw_text(x + 60, y + 6, string(stageName));


//Level Number
draw_text(x + 60, y + 36, string(stageLevel));


//Ranks
var _rank = spr_RankFHead;

if global.PlayerChar == 0 {
	if rank == -1 or rank == 0 {
		_rank = spr_RankFHead;
	} else if rank == 0 {
		_rank = spr_RankFHead;
	} else if rank == 1 {
		_rank = spr_RankDHead;
	} else if rank == 2 {
		_rank = spr_RankCHead;
	} else if rank == 3 {
		_rank = spr_RankBHead;
	} else if rank == 4 {
		_rank = spr_RankAHead;
	} else if rank == 5 {
		_rank = spr_RankSHead;
	} else if rank == 6 {
		_rank = spr_RankPHead;
	}
} else {
	if rank == -1 or rank == 0 {
		_rank = spr_RankF;
	} else if rank == 0 {
		_rank = spr_RankF;
	} else if rank == 1 {
		_rank = spr_RankD;
	} else if rank == 2 {
		_rank = spr_RankC;
	} else if rank == 3 {
		_rank = spr_RankB;
	} else if rank == 4 {
		_rank = spr_RankA;
	} else if rank == 5 {
		_rank = spr_RankS;
	} else if rank == 6 {
		_rank = spr_RankP;
	}
}

draw_sprite_ext(_rank, imageProgress, x + 10, y + 34, 0.5, 0.5, 0, c_white, 1);


//Player
if timeMinutes != 99 && timeMinutes != 59 {
	scr_GetCharLivesLocal();
	_liveSprite = char;
	_charCostume = charCost;
	draw_sprite_ext(_charCheck, _charCostume, x + 10, y + 5, 0.5, 0.5, 0, c_white, 1);
} else {
	draw_sprite_ext(spr_StageCharNone, 0, x + 10, y + 5, 0.5, 0.5, 0, c_white, 1);
}


//Time
if timeSeconds < 10 && timeMinutes < 10 {
	draw_text(x + 200, y + 6, string(timeMinutes) + ":0" + string(timeSeconds))
} else if timeSeconds >= 10 && timeMinutes >= 10 {
	draw_text(x + 200, y + 6, string(timeMinutes) + ":" + string(timeSeconds))
} else if timeSeconds < 10 && timeMinutes >= 10 {
	draw_text(x + 200, y + 6, string(timeMinutes) + ":0" + string(timeSeconds))
} else if timeSeconds >= 10 && timeMinutes < 10 {
	draw_text(x + 200, y + 6, string(timeMinutes) + ":" + string(timeSeconds))
}