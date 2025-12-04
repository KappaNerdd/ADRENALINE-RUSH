draw_self();

var _ang = 0;

var _xscale = 1;
var _yscale = 1;

draw_set_font(global.TimerFont);

if timeSeconds < 10 && timeMinutes < 10 {
	draw_text_transformed(x - 70, y + 40, string(timeMinutes) + ":0" + string(timeSeconds), _xscale, _yscale, _ang);
} else if timeSeconds >= 10 && timeMinutes >= 10 {
	draw_text_transformed(x - 70, y + 40, string(timeMinutes) + ":" + string(timeSeconds), _xscale, _yscale, _ang);
} else if timeSeconds < 10 && timeMinutes >= 10 {
	draw_text_transformed(x - 70, y + 40, string(timeMinutes) + ":0" + string(timeSeconds), _xscale, _yscale, _ang);
} else if timeSeconds >= 10 && timeMinutes < 10 {
	draw_text_transformed(x - 70, y + 40, string(timeMinutes) + ":" + string(timeSeconds), _xscale, _yscale, _ang);
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

draw_sprite_ext(_rank, 0, x + 83, y - 22, 1, 1, 0, c_black, 0.5);
draw_sprite_ext(_rank, 0, x + 80, y - 25, 1, 1, 0, c_white, 1);

var _playerIcon = _mod.player_Sprite;
var _playerCost = _mod.player_Costume;

draw_sprite_ext(_playerIcon, _playerCost, x + 83, y + 28, 1, 1, 0, c_black, 0.5);
draw_sprite_ext(_playerIcon, _playerCost, x + 80, y + 25, 1, 1, 0, c_white, 1);

draw_set_font(global.font_main);