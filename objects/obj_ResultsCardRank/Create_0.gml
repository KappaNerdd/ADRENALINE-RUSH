x = camera_get_view_x(view_camera[0]) + 200;
y = camera_get_view_y(view_camera[0]) + 250;

rankGraphic = spr_RankFHead;

if global.PlayerChar == 0 or global.MIND {
	rankF = spr_RankFHead;
	rankD = spr_RankDHead;
	rankC = spr_RankCHead;
	rankB = spr_RankBHead;
	rankA = spr_RankAHead;
	rankS = spr_RankSHead;
	rankP = spr_RankPHead;
} else {
	rankF = spr_RankFNew;
	rankD = spr_RankDNew;
	rankC = spr_RankCNew;
	rankB = spr_RankBNew;
	rankA = spr_RankANew;
	rankS = spr_RankSNew;
	rankP = spr_RankPNew;
}


if global.Rank == 0 {
	rankGraphic = rankF;
} else if global.Rank == 1 {
	rankGraphic = rankD;
} else if global.Rank == 2 {
	rankGraphic = rankC;
} else if global.Rank == 3 {
	rankGraphic = rankB;
} else if global.Rank == 4 {
	rankGraphic = rankA;
} else if global.Rank == 5 {
	rankGraphic = rankS;
} else if global.Rank == 6 {
	rankGraphic = rankP;
}


visible = 0;

depth = -1000000100;