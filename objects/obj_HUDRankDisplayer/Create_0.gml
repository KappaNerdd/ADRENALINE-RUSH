moveY = -100;

totalSeconds = 0;

rankGraphic = spr_RankFHead;
rankChecker = 0;

rankGraphic2 = spr_RankFHead;
rankChecker2 = 0;

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

image_alpha = 1;

image_xscale = 0.5;
image_yscale = 0.5;