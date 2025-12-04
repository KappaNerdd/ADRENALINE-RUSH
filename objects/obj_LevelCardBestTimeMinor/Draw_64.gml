draw_self();

var _ang = 0;

var _xscale = 0.5;
var _yscale = 0.5;

draw_set_font(global.TimerFont);

draw_sprite_ext(sprite_index, image_index, xChange, yChange, image_xscale, image_yscale, 0, c_white, image_alpha);

if timeSeconds < 10 && timeMinutes < 10 {
	draw_text_transformed_color(xChange - 30, yChange + 20, string(timeMinutes) + ":0" + string(timeSeconds), _xscale, _yscale, _ang, c_white, c_white, c_white, c_white, image_alpha);
} else if timeSeconds >= 10 && timeMinutes >= 10 {
	draw_text_transformed_color(xChange - 30, yChange + 20, string(timeMinutes) + ":" + string(timeSeconds), _xscale, _yscale, _ang, c_white, c_white, c_white, c_white, image_alpha);
} else if timeSeconds < 10 && timeMinutes >= 10 {
	draw_text_transformed_color(xChange - 30, yChange + 20, string(timeMinutes) + ":0" + string(timeSeconds), _xscale, _yscale, _ang, c_white, c_white, c_white, c_white, image_alpha);
} else if timeSeconds >= 10 && timeMinutes < 10 {
	draw_text_transformed_color(xChange - 30, yChange + 20, string(timeMinutes) + ":" + string(timeSeconds), _xscale, _yscale, _ang, c_white, c_white, c_white, c_white, image_alpha);
}

var _rank = spr_RankFHead;
var _mod = global.speedStageData[global.SpeedSelected];

if !global.MIND or global.PlayerChar != 0 {
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

draw_sprite_ext(_rank, 0, xChange - 30, yChange + 40, 0.5, 0.5, 0, c_white, image_alpha);

var _playerIcon = _mod.player_Sprite;
var _playerCost = _mod.player_Costume;

draw_sprite_ext(_playerIcon, _playerCost, xChange + 15, yChange + 40, 0.5, 0.5, 0, c_white, image_alpha);


draw_set_font(global.font_main);